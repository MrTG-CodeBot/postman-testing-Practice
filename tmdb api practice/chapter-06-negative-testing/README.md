# Chapter 06: Negative Testing & Error Handling on a Real API

## 🎯 What You Will Do
Intentionally break requests on TMDB to verify that the API rejects bad inputs cleanly with accurate HTTP error codes (`401`, `404`, `400`) and clear error messages.

---

## 💡 About This Chapter (For Beginners)
Real QA testers spend just as much time testing **error cases** as success cases!
Notice how TMDB returns structured JSON error objects with `success: false`, `status_code` (TMDB's internal error code), and `status_message`:
```json
{
  "success": false,
  "status_code": 34,
  "status_message": "The resource you requested could not be found."
}
```

---

## 🛠️ How to Do It (Step-by-Step)

### Test 1: Invalid Bearer Token (`401 Unauthorized`)
1. Method: **GET**
2. URL: `{{baseUrl}}/movie/popular`
3. **Authorization**: **Bearer Token** → type `invalid_fake_token_123` (instead of `{{tmdb_token}}`).
4. **Test Script**:
   ```javascript
   pm.test("Status code is 401 Unauthorized", function () {
       pm.response.to.have.status(401);
   });

   pm.test("Response reports invalid API key/token", function () {
       var data = pm.response.json();
       pm.expect(data.success).to.be.false;
       pm.expect(data.status_code).to.eql(7);
   });
   ```

### Test 2: Non-Existent Movie ID (`404 Not Found`)
1. Method: **GET**
2. URL: `{{baseUrl}}/movie/999999999`
3. **Authorization**: **Bearer Token** → `{{tmdb_token}}`
4. **Test Script**:
   ```javascript
   pm.test("Status code is 404 Not Found", function () {
       pm.response.to.have.status(404);
   });

   pm.test("Response reports resource not found", function () {
       var data = pm.response.json();
       pm.expect(data.success).to.be.false;
       pm.expect(data.status_code).to.eql(34);
   });
   ```

### Test 3: Invalid Rating Value (`400 Bad Request`)
TMDB only allows movie ratings between `0.5` and `10.0`. What happens if we send `999`?
1. Method: **POST**
2. URL: `{{baseUrl}}/movie/27205/rating?guest_session_id={{guest_session_id}}`
3. **Authorization**: **Bearer Token** → `{{tmdb_token}}`
4. **Body** (`raw` → `JSON`):
   ```json
   {
     "value": 999
   }
   ```
5. **Test Script**:
   ```javascript
   pm.test("Status code is 400 Bad Request", function () {
       pm.response.to.have.status(400);
   });

   pm.test("Response rejects out-of-range rating", function () {
       var data = pm.response.json();
       pm.expect(data.success).to.be.false;
   });
   ```

---

## 🏆 Mini Challenge
Try sending a rating of `0` or `-5` in Test 3. Does TMDB also reject it with `400 Bad Request`?
