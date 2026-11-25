# Chapter 01: Setup, Bearer Token & First Real TMDB Request

## 🎯 What You Will Do
Connect Postman to the live TMDB API using your **Bearer Token** and fetch a real list of **Popular Movies**, then write automated tests to verify the live response.

---

## 💡 About This Chapter (For Beginners)
Unlike mock APIs that let anyone in without a password, real APIs require **authentication** on every request.
TMDB uses a **Bearer Token** (called *API Read Access Token* in your TMDB account settings). Instead of putting your password in the URL, Postman safely sends it in the `Authorization` header:
`Authorization: Bearer <your-token>`

---

## 🛠️ How to Do It (Step-by-Step)

### Step 1: Make Sure Your Environment is Ready
1. In Postman's top-right dropdown, select **TMDB Environment**.
2. Click the eye icon (👁️) next to it and verify `baseUrl` is `https://api.themoviedb.org/3` and `tmdb_token` has your real token pasted.

### Step 2: Create the Request
1. Click **+** to open a new request tab.
2. Method: **GET**
3. URL:
   ```
   {{baseUrl}}/movie/popular
   ```
4. Click the **Authorization** tab under the URL bar.
5. Set **Auth Type** to **Bearer Token**.
6. In the **Token** box, type:
   ```
   {{tmdb_token}}
   ```
7. Click **Send**.

### Step 3: Inspect the Real Response
Look at the JSON body at the bottom:
* `page`: `1`
* `results`: An array of 20 real popular movies right now! Each movie has `id`, `title`, `overview`, `release_date`, and `vote_average`.
* `total_pages` and `total_results`: Total number of pages/movies in TMDB's database.

### Step 4: Add Automated Tests
Click the **Scripts → Post-response** (or **Tests**) tab and paste:
```javascript
pm.test("Status code is 200 OK", function () {
    pm.response.to.have.status(200);
});

pm.test("Response time is under 2000ms", function () {
    pm.expect(pm.response.responseTime).to.be.below(2000);
});

pm.test("Page is 1 and results array is not empty", function () {
    var data = pm.response.json();
    pm.expect(data.page).to.eql(1);
    pm.expect(data.results).to.be.an("array").that.is.not.empty;
});

pm.test("First movie has required fields", function () {
    var firstMovie = pm.response.json().results[0];
    pm.expect(firstMovie.id).to.be.a("number");
    pm.expect(firstMovie.title).to.be.a("string");
    pm.expect(firstMovie.vote_average).to.be.a("number");
});
```
Click **Send** and verify all 4 tests show **PASS**!

---

## 🏆 Mini Challenge
Change the URL to `{{baseUrl}}/movie/top_rated` and send it again. Do all 4 tests still pass?
