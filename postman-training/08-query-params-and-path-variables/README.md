# Practice 08: Query Parameters & Path Variables

## 🎯 Goal
Master how to pass parameters in URLs for filtering, searching, sorting, and pagination using Postman's **Params** table.

---

## 💡 Concepts for Beginners

### 1. Path Variables (Identifiers)
* Part of the URL path itself, usually prefixed with a colon in templates: `/posts/:postId`
* Used to identify a **specific resource**.
* Example: `https://jsonplaceholder.typicode.com/posts/1` (Targeting post 1).

### 2. Query Parameters (Filters & Modifiers)
* Appended after a question mark `?` and separated by `&`:
  `https://jsonplaceholder.typicode.com/comments?postId=1&_limit=5`
* Used for:
  * **Filtering**: `?userId=2`
  * **Sorting**: `?_sort=title&_order=asc`
  * **Pagination / Limits**: `?_page=1&_limit=10`
  * **Searching**: `?q=javascript`

---

## 🛠️ Step-by-Step Instructions

### Step 1: Open the Params Tab
1. Create a **GET** request to:
   ```
   https://jsonplaceholder.typicode.com/comments
   ```
2. Click the **Params** tab under the URL bar.
3. In the key-value table, enter:
   * **Key**: `postId` | **Value**: `1`
   * **Key**: `_limit` | **Value**: `3`
4. Notice how Postman automatically constructs the URL as you type:
   `https://jsonplaceholder.typicode.com/comments?postId=1&_limit=3`

### Step 2: Write Verification Tests
Click **Scripts / Tests**:
```javascript
// Test 1: Status Code
pm.test("Status code is 200", function () {
    pm.response.to.have.status(200);
});

// Test 2: Verify only 3 items returned due to _limit=3
pm.test("Response limited to exactly 3 comments", function () {
    var comments = pm.response.json();
    pm.expect(comments).to.be.an("array").with.lengthOf(3);
});

// Test 3: Verify all returned comments belong to postId 1
pm.test("All comments belong to postId 1", function () {
    var comments = pm.response.json();
    comments.forEach(function (comment) {
        pm.expect(comment.postId).to.eql(1);
    });
});
```

---

## 🏆 Practice Challenge for You
Uncheck the checkbox next to `_limit` in the Params table without deleting the row. Send the request again. How many comments are returned now? (This demonstrates how easily Postman lets you toggle query parameters on and off!).
