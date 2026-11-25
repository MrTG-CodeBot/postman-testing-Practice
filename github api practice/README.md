# 🐙 GitHub REST API Testing (Short 4-Chapter Practice)

Welcome! This is a short, beginner-friendly **4-chapter** practice using the real **GitHub REST API** (`https://api.github.com`).

> 💡 **Good news:** You can start **Chapters 1 & 2 immediately** with **no token**! You only need a GitHub token when you reach Chapter 3.

---

## ⚡ Quick Setup in Postman
1. **Import the Environment**:
   * Open Postman → click **Import** → select [github-environment.postman_environment.json](file:///c:/Users/amaln/Downloads/post-man-testing-pratice/github%20api%20practice/github-environment.postman_environment.json).
   * Select **GitHub Environment** in the top-right dropdown.
   * *(Optional)* Change `username` to your own GitHub username!
2. **Import the 4-Chapter Collection**:
   * Click **Import** → select [GitHub-Practice-Course.postman_collection.json](file:///c:/Users/amaln/Downloads/post-man-testing-pratice/github%20api%20practice/GitHub-Practice-Course.postman_collection.json).

---

## 📚 4 Simple Chapters

| Chapter | Folder | Token Needed? | What You Will Do |
| :--- | :--- | :--- | :--- |
| **01** | [chapter-01-public-profile-and-repos](file:///c:/Users/amaln/Downloads/post-man-testing-pratice/github%20api%20practice/chapter-01-public-profile-and-repos/README.md) | ❌ No | Fetch a real GitHub user profile, list repos, and check rate-limit headers. |
| **02** | [chapter-02-search-repositories](file:///c:/Users/amaln/Downloads/post-man-testing-pratice/github%20api%20practice/chapter-02-search-repositories/README.md) | ❌ No | Search GitHub repos by keyword, sort by stars, and limit results (`per_page=5`). |
| **03** | [chapter-03-issues-crud-with-token](file:///c:/Users/amaln/Downloads/post-man-testing-pratice/github%20api%20practice/chapter-03-issues-crud-with-token/README.md) | ✅ Yes | Use a Personal Access Token to create (`POST`) and update/close (`PATCH`) a real Issue. |
| **04** | [chapter-04-negative-testing](file:///c:/Users/amaln/Downloads/post-man-testing-pratice/github%20api%20practice/chapter-04-negative-testing/README.md) | ✅ For Issue test | Test `404 Not Found` and `422 Unprocessable Entity` (validation error). |
