# 🎬 TMDB Real-World API Testing Practice

Welcome to **Phase 2** of your Postman journey!
Now that you've mastered the basics with mock APIs, it's time to test a **real production API** with live movie data: **The Movie Database (TMDB)**.

---

## 🧠 Why TMDB?
Mock APIs (like JSONPlaceholder) always return fake data and don't enforce real authentication or strict validation. TMDB gives you:
* **Real Bearer Token Authentication**
* **Live search, pagination, and complex nested JSON** (movies, cast, genres)
* **Real POST & DELETE workflows** using Guest Sessions
* **Real error responses** (`401 Unauthorized`, `404 Not Found`, `400 Bad Request`)

---

## 🔑 Before You Start: Get Your Free TMDB Token (2 Minutes)
1. Go to [themoviedb.org](https://www.themoviedb.org/) and create a free account (verify your email).
2. Click your **Profile Icon (top right) → Settings → API** (in the left menu).
3. Click **Create** (choose **Developer**), accept the terms, and fill in simple details (e.g., Application Name: `Postman Practice`, URL: `http://localhost`).
4. Copy your **API Read Access Token** (the long string — this is your **Bearer Token**).

> ⚠️ **Important Security Tip:** Never share your real token publicly or upload it to GitHub!

---

## ⚡ Quick Setup in Postman
1. **Import the Environment**:
   * Open Postman → click **Import** → select [tmdb-environment.postman_environment.json](file:///c:/Users/amaln/Downloads/post-man-testing-pratice/tmdb%20api%20practice/tmdb-environment.postman_environment.json).
   * Open **TMDB Environment** in Postman, paste your **API Read Access Token** into the `tmdb_token` **Current Value** field, and click **Save**.
   * Select **TMDB Environment** in the top-right environment dropdown!
2. **Import the Full Course Collection**:
   * Click **Import** → select [TMDB-Practice-Course.postman_collection.json](file:///c:/Users/amaln/Downloads/post-man-testing-pratice/tmdb%20api%20practice/TMDB-Practice-Course.postman_collection.json).
   * *(Or import each chapter's `.postman_collection.json` one by one as you go.)*

---

## 📚 Chapters Roadmap

| Chapter | Folder | What You Will Learn & Test |
| :--- | :--- | :--- |
| **01** | [chapter-01-setup-and-first-request](file:///c:/Users/amaln/Downloads/post-man-testing-pratice/tmdb%20api%20practice/chapter-01-setup-and-first-request/README.md) | Set up Bearer Token auth and fetch live Popular Movies. |
| **02** | [chapter-02-search-and-query-params](file:///c:/Users/amaln/Downloads/post-man-testing-pratice/tmdb%20api%20practice/chapter-02-search-and-query-params/README.md) | Search real movies with query parameters and test empty search results. |
| **03** | [chapter-03-request-chaining](file:///c:/Users/amaln/Downloads/post-man-testing-pratice/tmdb%20api%20practice/chapter-03-request-chaining/README.md) | Chain requests: Search Movie → Save `movie_id` → Get Details → Get Cast/Credits. |
| **04** | [chapter-04-discover-and-filtering](file:///c:/Users/amaln/Downloads/post-man-testing-pratice/tmdb%20api%20practice/chapter-04-discover-and-filtering/README.md) | Filter & sort movies by year, rating, and vote count; loop-test every item in an array. |
| **05** | [chapter-05-guest-session-and-ratings](file:///c:/Users/amaln/Downloads/post-man-testing-pratice/tmdb%20api%20practice/chapter-05-guest-session-and-ratings/README.md) | Create a Guest Session, `POST` a real movie rating, and `DELETE` it. |
| **06** | [chapter-06-negative-testing](file:///c:/Users/amaln/Downloads/post-man-testing-pratice/tmdb%20api%20practice/chapter-06-negative-testing/README.md) | Test real API error codes: `401 Unauthorized`, `404 Not Found`, and `400 Bad Request`. |
| **07** | [chapter-07-data-driven-testing](file:///c:/Users/amaln/Downloads/post-man-testing-pratice/tmdb%20api%20practice/chapter-07-data-driven-testing/README.md) | Search and validate multiple movies automatically from a CSV file (`movies.csv`). |
