# Practice 03: Complete CRUD Lifecycle (PUT, PATCH, DELETE)

## 🎯 Goal
Understand the full **CRUD** (Create, Read, Update, Delete) cycle by mastering the difference between `PUT` (full replacement), `PATCH` (partial update), and `DELETE`.

---

## 💡 Concepts for Beginners

| HTTP Method | CRUD Operation | Description | Analogy |
| :--- | :--- | :--- | :--- |
| **POST** | **C**reate | Adds a brand new record | Putting a new file in a drawer |
| **GET** | **R**ead | Fetches an existing record | Reading a file from the drawer |
| **PUT** | **U**pdate (Full) | Replaces the *entire* existing record | Replacing an entire document page |
| **PATCH** | **U**pdate (Partial) | Updates only specified fields | Using white-out on just one line |
| **DELETE** | **D**elete | Removes the record permanently | Shredding the file |

---

## 🛠️ Step-by-Step Instructions

### Step 1: PUT Request (Full Update)
1. Set method to **PUT**.
2. URL: `https://jsonplaceholder.typicode.com/posts/1`
3. Body (`raw -> JSON`):
   ```json
   {
     "id": 1,
     "title": "Completely Replaced Title",
     "body": "Completely replaced body text",
     "userId": 1
   }
   ```
4. Test Script:
   ```javascript
   pm.test("PUT Status code is 200", function () {
       pm.response.to.have.status(200);
   });
   pm.test("Title was replaced", function () {
       pm.expect(pm.response.json().title).to.eql("Completely Replaced Title");
   });
   ```

### Step 2: PATCH Request (Partial Update)
1. Set method to **PATCH**.
2. URL: `https://jsonplaceholder.typicode.com/posts/1`
3. Notice: Only send the field you want to modify!
   ```json
   {
     "title": "Only This Field Was Modified"
   }
   ```
4. Test Script:
   ```javascript
   pm.test("PATCH Status code is 200", function () {
       pm.response.to.have.status(200);
   });
   pm.test("Title updated via PATCH", function () {
       pm.expect(pm.response.json().title).to.eql("Only This Field Was Modified");
   });
   ```

### Step 3: DELETE Request
1. Set method to **DELETE**.
2. URL: `https://jsonplaceholder.typicode.com/posts/1`
3. No body needed!
4. Test Script:
   ```javascript
   pm.test("DELETE status is 200 or 204", function () {
       pm.expect(pm.response.code).to.be.oneOf([200, 204]);
   });
   ```

---

## 🏆 Practice Challenge for You
Why would you choose `PATCH` over `PUT` in a real-world mobile app with slow cellular connection? *(Hint: Look at the size of the request body you need to transfer!)*
