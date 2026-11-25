# Practice 01: Your First GET Request & Status Code Verification

## 🎯 Goal
Learn how an API request works, send your first HTTP `GET` request in Postman, inspect the response, and write your first automated test.

---

## 💡 Concepts for Beginners

* **API (Application Programming Interface)**: A messenger that takes requests from a client (like your browser or mobile app) to a server and returns the data back.
* **GET Request**: Used to retrieve/fetch data from the server. It does NOT change or create any data.
* **HTTP Status Code 200 OK**: Means the request was successful and the server returned the requested data.
* **Test Script (`pm.test`)**: A JavaScript snippet running in the **"Scripts > Post-response"** tab (formerly "Tests") that verifies the server answered as expected.

---

## 🛠️ Step-by-Step Instructions

### Step 1: Open Postman & Create a Request
1. Open Postman.
2. Click **+** (New Request tab).
3. Select **GET** from the dropdown menu (it's the default).
4. Enter this URL in the address bar:
   ```
   https://jsonplaceholder.typicode.com/posts/1
   ```
5. Click the blue **Send** button.

### Step 2: Inspect the Response
Look at the bottom response pane:
* **Status**: You will see `200 OK`.
* **Time**: Shows response time in milliseconds (e.g. `120 ms`).
* **Body**: Shows JSON data for post #1:
  ```json
  {
    "userId": 1,
    "id": 1,
    "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
    "body": "quia et suscipit..."
  }
  ```

### Step 3: Write an Automated Test
1. Click the **Scripts** tab under the URL bar (or **Tests** tab in older Postman versions).
2. Type or paste the following test script:
   ```javascript
   // Test 1: Verify status code is 200
   pm.test("Status code is 200 OK", function () {
       pm.response.to.have.status(200);
   });

   // Test 2: Verify the response is JSON
   pm.test("Response is valid JSON format", function () {
       pm.response.to.be.json;
   });

   // Test 3: Verify the post has ID 1
   pm.test("Post ID is 1", function () {
       var jsonData = pm.response.json();
       pm.expect(jsonData.id).to.eql(1);
   });
   ```
3. Click **Send** again.
4. Go to the **Test Results** tab in the bottom response pane.
5. You should see 3 green badges: `PASS Status code is 200 OK`, etc.!

---

## 🏆 Practice Challenge for You
Try requesting:
```
https://jsonplaceholder.typicode.com/posts/5
```
Add a test assertion verifying that `jsonData.id` is equal to `5`.
