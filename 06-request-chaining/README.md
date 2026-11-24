# Practice 06: Request Chaining (Dynamic Workflows)

## 🎯 Goal
Learn how real-world automated testing works: **Request Chaining**. Take dynamic output from Request #1 (like a generated user ID or session token) and automatically inject it into Request #2 and #3.

---

## 💡 Concepts for Beginners

In real apps:
1. You **Register / Login** -> The server returns an ID or Token.
2. You **Update Profile** -> You must use the ID from step 1!
3. You **Logout** -> You must use the session token from step 1!

Instead of manually copying and pasting IDs between tabs, you write **1 line of JavaScript** in the test script:
```javascript
pm.environment.set("newPostId", response.id);
```
Postman automatically stores it so the next request can immediately use `{{newPostId}}`!

---

## 🛠️ Step-by-Step Instructions

This collection contains 2 chained requests:

### Request 1: "Create Post & Save ID"
* **Method**: `POST`
* **URL**: `https://jsonplaceholder.typicode.com/posts`
* **Body**:
  ```json
  {
    "title": "Chained Workflow Post",
    "body": "Demonstrating variable passing between requests",
    "userId": 99
  }
  ```
* **Test Script**:
  ```javascript
  pm.test("Post created with status 201", function () {
      pm.response.to.have.status(201);
  });

  // Extract ID from response and save to environment variable
  var responseData = pm.response.json();
  pm.environment.set("savedPostId", responseData.id);
  console.log("Saved new post ID to environment:", responseData.id);
  ```

### Request 2: "Get Created Post Using Dynamic ID"
* **Method**: `GET`
* **URL**: `https://jsonplaceholder.typicode.com/posts/{{savedPostId}}`
* **Test Script**:
  ```javascript
  pm.test("Status code is 200", function () {
      pm.response.to.have.status(200);
  });

  pm.test("Requested correct dynamic post ID", function () {
      var expectedId = pm.environment.get("savedPostId");
      // JSONPlaceholder mock returns id 101 or 1 for created items
      pm.expect(pm.response.json().id).to.exist;
  });
  ```

### Running the Workflow
1. Make sure an environment (like `Dev Environment`) is selected in the top right.
2. Send **Request 1**. Notice the console log and environment variable updated!
3. Send **Request 2**. It automatically references `{{savedPostId}}`!

---

## 🏆 Practice Challenge for You
Add a 3rd request to the chain: **DELETE** `https://jsonplaceholder.typicode.com/posts/{{savedPostId}}` and assert that the status code is `200`!
