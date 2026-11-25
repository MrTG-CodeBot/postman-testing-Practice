# Chapter 03: Real Issue CRUD with Token (`POST`, `PATCH`, Request Chaining)

## 🎯 What You Will Do
Use a **GitHub Personal Access Token (PAT)** to:
1. **Create** a real Issue on one of your repositories (`POST`).
2. Automatically save the created `issue_number` into your Environment.
3. **Update & Close** that Issue (`PATCH`) so your repository stays clean!

---

## 🔑 How to Create a Safe GitHub Token (2 Minutes)
1. Go to GitHub → **Profile Icon → Settings → Developer settings** (bottom left) → **Personal access tokens → Fine-grained tokens**.
2. Click **Generate new token**:
   * **Token name**: `Postman Practice`
   * **Expiration**: `7 days`
   * **Repository access**: **Only select repositories** → pick one test repo (e.g., `postman-api-testing`).
   * **Permissions → Repository permissions → Issues**: set to **Read and write**.
3. Click **Generate token** and copy it.
4. In Postman, open **GitHub Environment**, paste it into `github_token` (**Current Value**), and click **Save**. Also verify `username` and `test_repo` match your repo!

> ⚠️ **Never paste or push your GitHub token to any public repo!**

---

## 🛠️ How to Do It (Step-by-Step)

### Step 1: Create a New Issue (`POST`)
* **Method**: `POST`
* **URL**: `{{baseUrl}}/repos/{{username}}/{{test_repo}}/issues`
* **Authorization**: **Bearer Token** → `{{github_token}}`
* **Headers**: `Accept: application/vnd.github+json`
* **Body** (`raw` → `JSON`):
  ```json
  {
    "title": "Postman Automated Test Issue",
    "body": "Created via Postman API testing practice!"
  }
  ```
* **Test Script**:
  ```javascript
  pm.test("Issue created with 201 Created", function () {
      pm.response.to.have.status(201);
  });

  var issue = pm.response.json();
  pm.test("Issue is open and title matches", function () {
      pm.expect(issue.state).to.eql("open");
      pm.expect(issue.title).to.eql("Postman Automated Test Issue");
  });

  pm.environment.set("issue_number", issue.number);
  console.log("Saved issue_number:", issue.number);
  ```

### Step 2: Update & Close the Issue (`PATCH`)
* **Method**: `PATCH`
* **URL**: `{{baseUrl}}/repos/{{username}}/{{test_repo}}/issues/{{issue_number}}`
* **Authorization**: **Bearer Token** → `{{github_token}}`
* **Body** (`raw` → `JSON`):
  ```json
  {
    "title": "Postman Automated Test Issue (Updated)",
    "state": "closed"
  }
  ```
* **Test Script**:
  ```javascript
  pm.test("Status code is 200 OK", function () {
      pm.response.to.have.status(200);
  });

  pm.test("Issue is now closed", function () {
      var issue = pm.response.json();
      pm.expect(issue.state).to.eql("closed");
      pm.expect(issue.title).to.include("Updated");
  });
  ```
* Click **Send** — check your repo's **Issues → Closed** tab on GitHub to see it live!
