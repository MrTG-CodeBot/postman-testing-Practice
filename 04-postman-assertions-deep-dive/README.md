# Practice 04: Postman Assertions & Chai Matchers Deep Dive

## 🎯 Goal
Move beyond basic status code tests to writing professional-grade API test suites: verifying response speed, data types, nested JSON structures, headers, and arrays.

---

## 💡 Concepts for Beginners

Postman uses the **Chai Assertion Library** under the hood. You write tests using `pm.expect()`:

* **Checking Status**: `pm.response.to.have.status(200)`
* **Response Time**: `pm.expect(pm.response.responseTime).to.be.below(1000)` (Under 1 second)
* **Data Types**: `pm.expect(user.id).to.be.a("number")` or `to.be.a("string")`
* **Array Length**: `pm.expect(users).to.be.an("array").that.is.not.empty`
* **Nested Properties**: `pm.expect(user.address.geo).to.have.property("lat")`
* **Headers**: `pm.response.to.have.header("Content-Type")`

---

## 🛠️ Step-by-Step Instructions

1. Method: **GET**
2. URL: `https://jsonplaceholder.typicode.com/users`
3. Click the **Scripts** (or **Tests**) tab and paste this comprehensive test suite:

```javascript
// 1. Verify Status
pm.test("Status is 200 OK", function () {
    pm.response.to.have.status(200);
});

// 2. Performance: Response time check (SLA)
pm.test("Response time is under 1500ms", function () {
    pm.expect(pm.response.responseTime).to.be.below(1500);
});

// 3. Headers: Verify Content-Type contains application/json
pm.test("Content-Type header is JSON", function () {
    pm.expect(pm.response.headers.get("Content-Type")).to.include("application/json");
});

// 4. Data Structure: Check array returned with exactly 10 users
pm.test("Returns an array of 10 users", function () {
    var users = pm.response.json();
    pm.expect(users).to.be.an("array").with.lengthOf(10);
});

// 5. Schema / Data Types: Check first user's fields
pm.test("First user has valid data types", function () {
    var firstUser = pm.response.json()[0];
    pm.expect(firstUser.id).to.be.a("number");
    pm.expect(firstUser.name).to.be.a("string");
    pm.expect(firstUser.email).to.include("@");
    pm.expect(firstUser.address).to.be.an("object");
    pm.expect(firstUser.address.geo.lat).to.exist;
});
```

4. Click **Send** and review the **Test Results (5/5 PASS)**.

---

## 🏆 Practice Challenge for You
See `cheatsheet.md` in this folder for 15+ ready-to-use Postman assertion recipes!
