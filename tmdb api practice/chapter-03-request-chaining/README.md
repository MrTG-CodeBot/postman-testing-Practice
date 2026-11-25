# Chapter 03: Request Chaining (Search → Movie Details → Credits)

## 🎯 What You Will Do
Build a **3-step dynamic workflow** using real TMDB data:
1. **Search** for a movie using `{{search_query}}`.
2. Automatically extract its `id` and save it into `{{movie_id}}`.
3. Fetch the **Movie Details** and **Cast/Credits** using `{{movie_id}}` without copying anything manually!

---

## 💡 About This Chapter (For Beginners)
In real apps, users don't know movie IDs like `27205`. They type a name (like `"Inception"`), the app searches for it, gets the ID behind the scenes, and loads the movie's details page and actors list.

In Postman, **Request Chaining** lets you mimic that exact user journey by saving a value from one response into your active Environment:
```javascript
pm.environment.set("movie_id", firstMovieId);
```

---

## 🛠️ How to Do It (Step-by-Step)

*(Remember to set **Authorization → Bearer Token → `{{tmdb_token}}`** on each request, and make sure **TMDB Environment** is selected!)*

### Step 1: Search Movie & Save ID
* **Method**: `GET`
* **URL**: `{{baseUrl}}/search/movie?query={{search_query}}`
* **Test Script**:
  ```javascript
  pm.test("Status code is 200 OK", function () {
      pm.response.to.have.status(200);
  });

  var data = pm.response.json();
  pm.test("Found at least one movie", function () {
      pm.expect(data.results).to.be.an("array").that.is.not.empty;
  });

  // Save the first movie's ID to the environment
  var firstMovieId = data.results[0].id;
  pm.environment.set("movie_id", firstMovieId);
  console.log("Saved movie_id:", firstMovieId);
  ```
* Click **Send**. (Check the eye icon 👁️ in the top right — `movie_id` is now filled!)

### Step 2: Get Full Movie Details
* **Method**: `GET`
* **URL**: `{{baseUrl}}/movie/{{movie_id}}`
* **Test Script**:
  ```javascript
  pm.test("Status code is 200 OK", function () {
      pm.response.to.have.status(200);
  });

  pm.test("Movie ID matches saved environment variable", function () {
      var expectedId = parseInt(pm.environment.get("movie_id"));
      pm.expect(pm.response.json().id).to.eql(expectedId);
  });

  pm.test("Movie has genres and runtime", function () {
      var movie = pm.response.json();
      pm.expect(movie.genres).to.be.an("array").that.is.not.empty;
      pm.expect(movie.runtime).to.be.a("number").and.above(0);
  });
  ```
* Click **Send**.

### Step 3: Get Movie Cast & Crew (Credits)
* **Method**: `GET`
* **URL**: `{{baseUrl}}/movie/{{movie_id}}/credits`
* **Test Script**:
  ```javascript
  pm.test("Status code is 200 OK", function () {
      pm.response.to.have.status(200);
  });

  pm.test("Cast and crew arrays exist", function () {
      var credits = pm.response.json();
      pm.expect(credits.cast).to.be.an("array").that.is.not.empty;
      pm.expect(credits.crew).to.be.an("array").that.is.not.empty;
  });

  pm.test("First cast member has name and character", function () {
      var leadActor = pm.response.json().cast[0];
      pm.expect(leadActor.name).to.be.a("string");
      pm.expect(leadActor.character).to.be.a("string");
  });
  ```
* Click **Send**.

---

## 🏆 Mini Challenge
Change `search_query` in **TMDB Environment** from `Inception` to `The Matrix` (or any movie you like), and run all 3 requests in order using the **Collection Runner** (click the collection → **Run**)!
