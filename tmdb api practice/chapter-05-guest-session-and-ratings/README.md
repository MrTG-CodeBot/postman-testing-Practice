# Chapter 05: Real POST & DELETE (Guest Session & Movie Rating)

## 🎯 What You Will Do
Perform **real write operations** (`POST` and `DELETE`) on TMDB by creating a temporary **Guest Session**, submitting a rating for a movie, and then deleting that rating!

---

## 💡 About This Chapter (For Beginners)
On mock APIs, anyone can send a `POST` request and it always succeeds.
On a real API like TMDB, you **cannot** `POST` a movie rating unless you prove who you are with a **Session ID**.
Fortunately, TMDB provides a **Guest Session** endpoint so developers and testers can practice `POST` and `DELETE` safely without touching their personal account!

Here is the 3-step workflow:
1. `GET /authentication/guest_session/new` → get a `guest_session_id` and save it.
2. `POST /movie/{{movie_id}}/rating?guest_session_id={{guest_session_id}}` → submit rating `8.5`.
3. `DELETE /movie/{{movie_id}}/rating?guest_session_id={{guest_session_id}}` → clean up your test data!

---

## 🛠️ How to Do It (Step-by-Step)

*(Note: Make sure `movie_id` is set in **TMDB Environment** from Chapter 03, or set it to `27205` for Inception.)*

### Step 1: Create a Guest Session
* **Method**: `GET`
* **URL**: `{{baseUrl}}/authentication/guest_session/new`
* **Auth**: Bearer Token `{{tmdb_token}}`
* **Test Script**:
  ```javascript
  pm.test("Status code is 200 OK", function () {
      pm.response.to.have.status(200);
  });

  var data = pm.response.json();
  pm.test("Guest session created successfully", function () {
      pm.expect(data.success).to.be.true;
      pm.expect(data.guest_session_id).to.be.a("string");
  });

  pm.environment.set("guest_session_id", data.guest_session_id);
  ```
* Click **Send**.

### Step 2: Rate the Movie (POST)
* **Method**: `POST`
* **URL**: `{{baseUrl}}/movie/{{movie_id}}/rating?guest_session_id={{guest_session_id}}`
* **Auth**: Bearer Token `{{tmdb_token}}`
* **Body** (`raw` → `JSON`):
  ```json
  {
    "value": 8.5
  }
  ```
* **Test Script**:
  ```javascript
  pm.test("Status code is 201 Created", function () {
      pm.response.to.have.status(201);
  });

  pm.test("Rating saved successfully", function () {
      var data = pm.response.json();
      pm.expect(data.success).to.be.true;
  });
  ```
* Click **Send**.

### Step 3: Delete the Rating (DELETE)
* **Method**: `DELETE`
* **URL**: `{{baseUrl}}/movie/{{movie_id}}/rating?guest_session_id={{guest_session_id}}`
* **Auth**: Bearer Token `{{tmdb_token}}`
* **Test Script**:
  ```javascript
  pm.test("Status code is 200 OK", function () {
      pm.response.to.have.status(200);
  });

  pm.test("Rating deleted successfully", function () {
      var data = pm.response.json();
      pm.expect(data.success).to.be.true;
  });
  ```
* Click **Send**.

---

## 🏆 Mini Challenge
Why is it a good QA practice to **DELETE** test data at the end of a test suite? *(Think about keeping test environments clean so repeated test runs don't fail or pollute the database!)*
