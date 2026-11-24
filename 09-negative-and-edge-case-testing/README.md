# Practice 09: Negative Testing & Edge Cases (The QA Mindset)

## 🎯 Goal
Great QA testers don't just test the "happy path" (when everything goes right). They intentionally test what happens when things go wrong! Learn how to verify error codes (`400`, `401`, `404`) and error responses.

---

## 💡 Concepts for Beginners

* **Happy Path**: Testing that valid inputs produce expected `200` or `201` outputs.
* **Negative Testing**: Testing that invalid inputs, missing fields, or unauthorized requests are blocked with clear, informative HTTP error codes.
* **Common HTTP Error Codes**:
  * `400 Bad Request`: The server cannot process the request (malformed syntax, missing required fields).
  * `401 Unauthorized`: Missing or invalid credentials/token.
  * `403 Forbidden`: Authenticated, but user lacks permission to access this resource.
  * `404 Not Found`: The resource ID does not exist.
  * `500 Internal Server Error`: The server crashed or experienced a bug.

---

## 🛠️ Step-by-Step Instructions

### Scenario 1: Requesting a Non-Existent Resource (404)
1. **Method**: `GET`
2. **URL**: `https://jsonplaceholder.typicode.com/posts/999999` (ID does not exist!)
3. **Test Script**:
   ```javascript
   pm.test("Status code is 404 Not Found", function () {
       pm.response.to.have.status(404);
   });

   pm.test("Body is empty object", function () {
       var data = pm.response.json();
       pm.expect(data).to.be.an("object");
       pm.expect(Object.keys(data).length).to.eql(0);
   });
   ```

### Scenario 2: Unauthorized Request (401)
1. **Method**: `GET`
2. **URL**: `https://postman-echo.com/basic-auth`
3. Leave Authorization set to **Inherit auth from parent** or **No Auth**.
4. **Test Script**:
   ```javascript
   pm.test("Status is 401 Unauthorized when credentials missing", function () {
       pm.response.to.have.status(401);
   });
   ```

### Scenario 3: Bad Request with Invalid Payload (400)
1. **Method**: `POST`
2. **URL**: `https://postman-echo.com/status/400`
3. **Test Script**:
   ```javascript
   pm.test("Returns 400 Bad Request status", function () {
       pm.response.to.have.status(400);
   });
   ```

---

## 🏆 Practice Challenge for You
Think of 3 edge cases for an API endpoint that registers a new user (`POST /users`):
1. What happens if the password is 1 character long?
2. What happens if the email is already registered?
3. What happens if the email field is missing?
*(These are the exact test cases QA engineers write everyday!)*
