# Practice 07: API Authentication (Basic Auth, Bearer Token, API Key)

## 🎯 Goal
Understand how APIs secure their data and practice configuring the 3 most common authorization types using Postman's built-in **Authorization** tab.

---

## 💡 Concepts for Beginners

Most APIs require authentication so only authorized users can access or change data:

| Auth Type | How it Works | Example Use Case |
| :--- | :--- | :--- |
| **Basic Auth** | Encodes `username:password` in Base64 within the `Authorization` header. | Internal admin dashboards, legacy systems. |
| **Bearer Token (JWT)** | Sends a temporary secret token string (JSON Web Token) in `Authorization: Bearer <token>`. | Modern web apps, mobile apps, OAuth2 logins. |
| **API Key** | Sends a secret key as either a custom Header (e.g. `x-api-key`) or Query Param. | Third-party developer APIs (Stripe, Weather, Maps). |

---

## 🛠️ Step-by-Step Instructions

We use `https://postman-echo.com` (Postman's official testing server) which echoes back your authentication to verify it works!

### 1. Basic Auth
1. Set method to **GET**, URL: `https://postman-echo.com/basic-auth`
2. Click the **Authorization** tab under the URL bar.
3. Select **Type**: **Basic Auth**.
4. Enter:
   * **Username**: `postman`
   * **Password**: `password`
5. Test Script:
   ```javascript
   pm.test("Basic Auth succeeded", function () {
       pm.response.to.have.status(200);
       pm.expect(pm.response.json().authenticated).to.be.true;
   });
   ```

### 2. Bearer Token
1. Set method to **GET**, URL: `https://postman-echo.com/headers`
2. Click the **Authorization** tab.
3. Select **Type**: **Bearer Token**.
4. Enter:
   * **Token**: `super-secret-jwt-token-12345`
5. Test Script:
   ```javascript
   pm.test("Authorization header was delivered", function () {
       pm.response.to.have.status(200);
       pm.expect(pm.response.json().headers.authorization).to.include("Bearer super-secret-jwt-token-12345");
   });
   ```

### 3. API Key in Header
1. Set method to **GET**, URL: `https://postman-echo.com/headers`
2. Click the **Authorization** tab.
3. Select **Type**: **API Key**.
4. Enter:
   * **Key**: `x-api-key`
   * **Value**: `my-test-api-key-999`
   * **Add to**: `Header`
5. Test Script:
   ```javascript
   pm.test("API Key header was sent", function () {
       pm.response.to.have.status(200);
       pm.expect(pm.response.json().headers["x-api-key"]).to.eql("my-test-api-key-999");
   });
   ```

---

## 🏆 Practice Challenge for You
In the Basic Auth request, change the password to `wrong-password` and send the request. What status code does the server return? *(You should see `401 Unauthorized`!)*
