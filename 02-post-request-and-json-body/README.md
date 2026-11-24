# Practice 02: Sending Data with POST & Verifying Status 201

## 🎯 Goal
Learn how to create new records on a server using an HTTP `POST` request, format a JSON request body, set headers, and test the created object.

---

## 💡 Concepts for Beginners

* **POST Request**: Used to send data to the server to create a new resource (like submitting a registration form, posting a comment, or creating a user).
* **Request Body**: The payload containing data you are sending to the server.
* **Content-Type Header**: Informs the server what format the body is in (most APIs use `application/json`).
* **HTTP Status Code 201 Created**: Means the server received your data and successfully created the new record.

---

## 🛠️ Step-by-Step Instructions

### Step 1: Set Up the POST Request
1. Open a new request tab in Postman.
2. Change the method dropdown from **GET** to **POST**.
3. Enter the URL:
   ```
   https://jsonplaceholder.typicode.com/posts
   ```

### Step 2: Add the JSON Body
1. Click the **Body** tab underneath the URL bar.
2. Select the **raw** radio button.
3. On the right side dropdown (where it says `Text`), switch it to **JSON**.
4. Paste the following JSON payload into the text area:
   ```json
   {
     "title": "My First Automated API Post",
     "body": "Learning Postman step by step is fun!",
     "userId": 1
   }
   ```

### Step 3: Add Automated Test Scripts
1. Click the **Scripts** (or **Tests**) tab.
2. Add the following assertions:
   ```javascript
   // Test 1: Check status code is 201 Created
   pm.test("Status code is 201 Created", function () {
       pm.response.to.have.status(201);
   });

   // Test 2: Check server generated a new ID
   pm.test("Created post has an ID", function () {
       var response = pm.response.json();
       pm.expect(response).to.have.property("id");
   });

   // Test 3: Check title matches what we sent
   pm.test("Title matches payload", function () {
       var response = pm.response.json();
       pm.expect(response.title).to.eql("My First Automated API Post");
   });
   ```

### Step 4: Send & Validate
1. Click **Send**.
2. Notice the response status is `201 Created`.
3. Check **Test Results** to see all 3 tests passing.

---

## 🏆 Practice Challenge for You
Change the payload to your own name and favorite hobby (e.g., `{"title": "Alice's Post", "body": "I love photography", "userId": 42}`). Update Test #3 to assert your title!
