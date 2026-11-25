# Chapter 02: Searching GitHub Repositories (No Token Needed)

## 🎯 What You Will Do
Search all public repositories on GitHub using **Query Parameters** (`q`, `sort`, `order`, `per_page`) and verify that sorting and page limits work accurately.

---

## 🛠️ How to Do It (Step-by-Step)

1. **Method**: `GET`
2. **URL**: `{{baseUrl}}/search/repositories`
3. **Params**:
   * `q`: `postman`
   * `sort`: `stars`
   * `order`: `desc`
   * `per_page`: `5`
4. **Headers**:
   * `Accept`: `application/vnd.github+json`
5. **Test Script**:
   ```javascript
   pm.test("Status code is 200 OK", function () {
       pm.response.to.have.status(200);
   });

   pm.test("Returned exactly 5 repositories", function () {
       var data = pm.response.json();
       pm.expect(data.total_count).to.be.above(0);
       pm.expect(data.items).to.be.an("array").with.lengthOf(5);
   });

   pm.test("Repositories are sorted by stars descending", function () {
       var items = pm.response.json().items;
       for (var i = 0; i < items.length - 1; i++) {
           pm.expect(items[i].stargazers_count).to.be.at.least(items[i + 1].stargazers_count);
       }
   });
   ```
6. Click **Send** and check **Test Results**!

---

## 🏆 Mini Challenge
Change `q` to `language:javascript` and `per_page` to `3`, then update the length assertion to `3`.
