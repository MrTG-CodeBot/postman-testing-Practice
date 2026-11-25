# Chapter 02: Searching Real Movies & Query Parameters

## 🎯 What You Will Do
Use TMDB's search endpoint with **Query Parameters** to search for real movies, control the language and page number, and test what happens when a search finds **nothing**.

---

## 💡 About This Chapter (For Beginners)
When you type a movie name into a search bar, the app sends a `GET` request with **Query Parameters** (everything after the `?` in the URL).
For example:
`{{baseUrl}}/search/movie?query=Inception&language=en-US&page=1`

As a QA tester, you should test **both**:
1. A valid search (e.g., `"Inception"`) returns matching movies.
2. A nonsense search (e.g., `"zzxxccvv999888"`) does **not** crash — it should cleanly return `200 OK` with an empty `results: []` array.

---

## 🛠️ How to Do It (Step-by-Step)

### Request 1: Search for a Real Movie
1. Method: **GET**
2. URL: `{{baseUrl}}/search/movie`
3. Under the **Authorization** tab, choose **Bearer Token** → `{{tmdb_token}}`.
4. Click the **Params** tab and add these rows:
   * `query`: `Inception`
   * `language`: `en-US`
   * `page`: `1`
5. In the **Scripts → Post-response** (or **Tests**) tab, paste:
   ```javascript
   pm.test("Status code is 200 OK", function () {
       pm.response.to.have.status(200);
   });

   pm.test("Search returned at least 1 movie", function () {
       var data = pm.response.json();
       pm.expect(data.results).to.be.an("array").that.is.not.empty;
   });

   pm.test("Top result title includes Inception", function () {
       var firstTitle = pm.response.json().results[0].title.toLowerCase();
       pm.expect(firstTitle).to.include("inception");
   });
   ```
6. Click **Send** and check **Test Results**.

### Request 2: Empty Search Result Test
1. Duplicate Request 1 (or create a new request).
2. Change `query` in **Params** to: `zzxxccvv999888notamovie`
3. Update the test script:
   ```javascript
   pm.test("Status code is still 200 OK", function () {
       pm.response.to.have.status(200);
   });

   pm.test("Results array is empty and total_results is 0", function () {
       var data = pm.response.json();
       pm.expect(data.results).to.be.an("array").that.is.empty;
       pm.expect(data.total_results).to.eql(0);
   });
   ```
4. Click **Send** and verify both tests pass!

---

## 🏆 Mini Challenge
Add `include_adult=false` to the **Params** tab of Request 1 and test searching for `"Avatar"` or `"Interstellar"`.
