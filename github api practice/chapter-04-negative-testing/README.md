# Chapter 04: Negative Testing (`404 Not Found` & `422 Validation Error`)

## 🎯 What You Will Do
Test two common real-world error responses on GitHub:
1. **`404 Not Found`**: Requesting a user that doesn't exist.
2. **`422 Unprocessable Entity`**: Sending an empty JSON body `{}` when creating an Issue (missing the required `title` field).

---

## 💡 About This Chapter (For Beginners)
Many real APIs return **`422 Unprocessable Entity`** when your JSON syntax is valid, **but** a required field is missing or invalid. Learning the difference between `400` (bad syntax) and `422` (validation error) is a great QA skill!

---

## 🛠️ How to Do It (Step-by-Step)

### Test 1: Non-Existent User (`404 Not Found`)
* **Method**: `GET`
* **URL**: `{{baseUrl}}/users/this-user-definitely-does-not-exist-999999`
* **Test Script**:
  ```javascript
  pm.test("Status code is 404 Not Found", function () {
      pm.response.to.have.status(404);
  });

  pm.test("Error message says Not Found", function () {
      pm.expect(pm.response.json().message).to.eql("Not Found");
  });
  ```

### Test 2: Create Issue Without Title (`422 Unprocessable Entity`)
* **Method**: `POST`
* **URL**: `{{baseUrl}}/repos/{{username}}/{{test_repo}}/issues`
* **Authorization**: **Bearer Token** → `{{github_token}}`
* **Body** (`raw` → `JSON`):
  ```json
  {}
  ```
* **Test Script**:
  ```javascript
  pm.test("Status code is 422 Unprocessable Entity", function () {
      pm.response.to.have.status(422);
  });

  pm.test("Error reports validation failure", function () {
      var data = pm.response.json();
      pm.expect(data.message).to.include("Invalid request");
  });
  ```
