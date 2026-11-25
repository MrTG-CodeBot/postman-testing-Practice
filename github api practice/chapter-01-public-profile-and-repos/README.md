# Chapter 01: Public GitHub Profile & Repos (No Token Needed)

## 🎯 What You Will Do
Fetch a real GitHub user's profile and public repositories, and verify **GitHub API Headers** (`x-ratelimit-remaining`).

---

## 💡 About This Chapter (For Beginners)
GitHub allows anyone to read public data (like profiles and public repos) up to **60 times per hour** without a token.
Every response includes special **Rate Limit Headers** telling you how many requests you have left!

---

## 🛠️ How to Do It (Step-by-Step)

*(Make sure **GitHub Environment** is selected in the top right!)*

### Request 1: Get User Profile
* **Method**: `GET`
* **URL**: `{{baseUrl}}/users/{{username}}`
* **Headers**:
  * `Accept`: `application/vnd.github+json`
* **Test Script**:
  ```javascript
  pm.test("Status code is 200 OK", function () {
      pm.response.to.have.status(200);
  });

  pm.test("Username matches environment variable", function () {
      var data = pm.response.json();
      pm.expect(data.login.toLowerCase()).to.eql(pm.environment.get("username").toLowerCase());
  });

  pm.test("Rate limit header is present", function () {
      pm.response.to.have.header("x-ratelimit-remaining");
      var remaining = parseInt(pm.response.headers.get("x-ratelimit-remaining"));
      pm.expect(remaining).to.be.at.least(0);
  });
  ```

### Request 2: Get User's Public Repositories
* **Method**: `GET`
* **URL**: `{{baseUrl}}/users/{{username}}/repos`
* **Headers**:
  * `Accept`: `application/vnd.github+json`
* **Test Script**:
  ```javascript
  pm.test("Status code is 200 OK", function () {
      pm.response.to.have.status(200);
  });

  pm.test("Repositories list is an array", function () {
      var repos = pm.response.json();
      pm.expect(repos).to.be.an("array").that.is.not.empty;
  });

  pm.test("First repository has name and html_url", function () {
      var firstRepo = pm.response.json()[0];
      pm.expect(firstRepo.name).to.be.a("string");
      pm.expect(firstRepo.html_url).to.include("https://github.com/");
  });
  ```

---

## 🏆 Mini Challenge
Change `username` in **GitHub Environment** to `octocat` (GitHub's mascot!) and run both requests again.
