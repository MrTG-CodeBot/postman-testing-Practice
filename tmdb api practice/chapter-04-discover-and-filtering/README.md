# Chapter 04: Discover, Filtering & Loop Assertions

## 🎯 What You Will Do
Test TMDB's `/discover/movie` endpoint with filters (release year, genre, minimum votes, sorting) and learn how to **loop over every item in an array** inside a Postman test to prove the filter actually worked!

---

## 💡 About This Chapter (For Beginners)
Checking only `results[0]` isn't enough for real QA testing. What if item #1 matches your filter, but item #5 doesn't?
Using JavaScript's `.forEach(...)` inside `pm.test()`, you can verify **all 20 movies** on the page at once!

---

## 🛠️ How to Do It (Step-by-Step)

### Request 1: Get Genre List (Reference)
Before filtering by genre, let's see what genre IDs TMDB uses (e.g., `28` = Action, `35` = Comedy, `878` = Sci-Fi):
* **Method**: `GET`
* **URL**: `{{baseUrl}}/genre/movie/list?language=en`
* **Auth**: Bearer Token `{{tmdb_token}}`
* **Test Script**:
  ```javascript
  pm.test("Status code is 200 OK", function () {
      pm.response.to.have.status(200);
  });

  pm.test("Genres list is not empty", function () {
      var genres = pm.response.json().genres;
      pm.expect(genres).to.be.an("array").that.is.not.empty;
  });
  ```

### Request 2: Discover Top Sci-Fi Movies from 2010+
* **Method**: `GET`
* **URL**: `{{baseUrl}}/discover/movie`
* **Params**:
  * `with_genres`: `878` (Science Fiction)
  * `primary_release_date.gte`: `2010-01-01`
  * `vote_count.gte`: `500`
  * `sort_by`: `vote_average.desc`
* **Auth**: Bearer Token `{{tmdb_token}}`
* **Test Script**:
  ```javascript
  pm.test("Status code is 200 OK", function () {
      pm.response.to.have.status(200);
  });

  pm.test("Every movie has at least 500 votes and Sci-Fi genre (878)", function () {
      var movies = pm.response.json().results;
      pm.expect(movies).to.be.an("array").that.is.not.empty;

      movies.forEach(function (movie) {
          pm.expect(movie.vote_count).to.be.at.least(500);
          pm.expect(movie.genre_ids).to.include(878);
      });
  });

  pm.test("Results are sorted by vote_average descending", function () {
      var movies = pm.response.json().results;
      for (var i = 0; i < movies.length - 1; i++) {
          pm.expect(movies[i].vote_average).to.be.at.least(movies[i + 1].vote_average);
      }
  });
  ```
* Click **Send** and see all 3 tests pass!

---

## 🏆 Mini Challenge
Pick another genre ID from Request 1 (for example, `35` for Comedy or `27` for Horror), update `with_genres` in Request 2, and update the `pm.expect(movie.genre_ids).to.include(...)` assertion to match!
