# 🚀 Postman API Testing: Complete 10-Practice Beginner Course

Welcome! This repository is specially organized for beginners learning **API Testing with Postman**. It takes you from sending your very first `GET` request all the way to **Automated Data-Driven Testing** and running headless tests with **Newman**.

---

## 🗺️ Learning Roadmap (10 Practices in 10 Folders)

| # | Practice Folder | Focus Area | What You Will Learn |
| :--- | :--- | :--- | :--- |
| **01** | [01-first-get-request](file:///c:/Users/amaln/Downloads/post-man-testing-pratice/01-first-get-request/README.md) | **HTTP Basics & GET** | Sending a request, understanding HTTP 200, inspecting JSON responses, writing `pm.test`. |
| **02** | [02-post-request-and-json-body](file:///c:/Users/amaln/Downloads/post-man-testing-pratice/02-post-request-and-json-body/README.md) | **Creating Data (POST)** | Crafting JSON request bodies, setting `Content-Type`, validating HTTP 201 Created. |
| **03** | [03-put-patch-delete-crud](file:///c:/Users/amaln/Downloads/post-man-testing-pratice/03-put-patch-delete-crud/README.md) | **CRUD Lifecycle** | Difference between `PUT` (full replace) vs `PATCH` (partial update) and `DELETE`. |
| **04** | [04-postman-assertions-deep-dive](file:///c:/Users/amaln/Downloads/post-man-testing-pratice/04-postman-assertions-deep-dive/README.md) | **Chai Matchers** | Validating response times, data types (numbers, strings, arrays), nested schemas. |
| **05** | [05-variables-and-environments](file:///c:/Users/amaln/Downloads/post-man-testing-pratice/05-variables-and-environments/README.md) | **Environments** | Stop hardcoding! Using `{{baseUrl}}` and `{{postId}}` across Dev, Staging, and Prod. |
| **06** | [06-request-chaining](file:///c:/Users/amaln/Downloads/post-man-testing-pratice/06-request-chaining/README.md) | **Dynamic Workflows** | Extracting data from Response 1 (e.g. ID) with `pm.environment.set` and passing to Request 2. |
| **07** | [07-api-authentication](file:///c:/Users/amaln/Downloads/post-man-testing-pratice/07-api-authentication/README.md) | **API Security** | How to configure **Basic Auth**, **Bearer Token (JWT)**, and **API Key** in Postman. |
| **08** | [08-query-params-and-path-variables](file:///c:/Users/amaln/Downloads/post-man-testing-pratice/08-query-params-and-path-variables/README.md) | **URL Parameters** | Using query parameters (`?postId=1&_limit=3`) for filtering, sorting, and pagination. |
| **09** | [09-negative-and-edge-case-testing](file:///c:/Users/amaln/Downloads/post-man-testing-pratice/09-negative-and-edge-case-testing/README.md) | **QA Mindset** | Intentionally testing failure scenarios: `404 Not Found`, `401 Unauthorized`, `400 Bad Request`. |
| **10** | [10-data-driven-testing-and-newman](file:///c:/Users/amaln/Downloads/post-man-testing-pratice/10-data-driven-testing-and-newman/README.md) | **Automation & CI/CD** | Running automated tests across a CSV dataset with the Postman Runner and **Newman CLI**. |

---

## ⚡ Quick Start: How to Import Everything into Postman

### Option A: Import All 10 Practices in 1 Click (Recommended!)
1. Open Postman.
2. Click the **Import** button (top left corner).
3. Drag and drop [All-Practices-Bundle.postman_collection.json](file:///c:/Users/amaln/Downloads/post-man-testing-pratice/All-Practices-Bundle.postman_collection.json) into Postman.
4. You will see a new collection named **"Postman Testing Complete Course (10 Practices)"** with 10 organized folders!

### Option B: Import One by One
You can also navigate into any folder (e.g., `01-first-get-request`) and import its individual `.postman_collection.json` file.

### Setting Up the Environment
1. In Postman, click **Import** and select [dev-environment.json](file:///c:/Users/amaln/Downloads/post-man-testing-pratice/05-variables-and-environments/dev-environment.json).
2. Select **Dev Environment** from the environment dropdown in the top-right corner.

---

## 💡 How Each Practice Folder is Structured

Every single practice folder contains:
1. `README.md`:
   * 🎯 **Goal**: What skill you will gain.
   * 💡 **Concepts for Beginners**: Simple explanation with zero jargon.
   * 🛠️ **Step-by-Step Instructions**: Exact buttons to click, URLs to enter, and test scripts to paste.
   * 🏆 **Challenge**: A mini-exercise to try on your own.
2. `practice-XX.postman_collection.json`: The ready-to-run Postman collection file.
3. Extra supporting files where relevant (e.g., [cheatsheet.md](file:///c:/Users/amaln/Downloads/post-man-testing-pratice/04-postman-assertions-deep-dive/cheatsheet.md), CSV datasets, environment configs, batch scripts).

---

## 🧪 Free Public Practice APIs Used
* **JSONPlaceholder**: `https://jsonplaceholder.typicode.com` (Zero setup, fake online REST API for prototyping)
* **Postman Echo**: `https://postman-echo.com` (Postman's official testing utility for authentication, headers, and status codes)
