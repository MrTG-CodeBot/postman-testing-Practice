# Practice 05: Variables & Environments in Postman

## 🎯 Goal
Stop hardcoding URLs, tokens, and IDs! Learn how to use Postman Environments and the `{{variable_name}}` syntax to make your tests reusable across Development, Staging, and Production.

---

## 💡 Concepts for Beginners

* **Hardcoding**: Typing `https://jsonplaceholder.typicode.com/posts/1` into every request. If the server or port changes, you have to edit 100 requests manually!
* **Environment Variable**: A key-value pair stored in Postman (e.g., `baseUrl` = `https://jsonplaceholder.typicode.com`).
* **Double Curly Braces `{{...}}`**: Postman's syntax to reference a variable in URLs, headers, or bodies (e.g. `{{baseUrl}}/posts/{{postId}}`).

### Variable Scope Hierarchy
1. **Global**: Available everywhere in all collections.
2. **Environment**: Tied to an active environment (e.g. `Development`, `Staging`, `Production`).
3. **Collection**: Shared across requests in a specific collection.
4. **Data**: Injected from external files (CSV/JSON during runs).
5. **Local**: Temporary within a single request script.

---

## 🛠️ Step-by-Step Instructions

### Step 1: Create an Environment
1. In Postman's left sidebar, click **Environments**.
2. Click **+** (Create Environment) and name it **Dev Environment**.
3. Add these variables:
   * **Variable**: `baseUrl` | **Initial Value**: `https://jsonplaceholder.typicode.com` | **Current Value**: `https://jsonplaceholder.typicode.com`
   * **Variable**: `postId` | **Initial Value**: `1` | **Current Value**: `1`
4. Click **Save** (Ctrl+S).

### Step 2: Select the Environment
In the top-right corner of Postman, find the environment dropdown (it says **No Environment** by default). Click it and select **Dev Environment**.

### Step 3: Use Variables in a Request
1. Open a new request tab.
2. For the URL, enter:
   ```
   {{baseUrl}}/posts/{{postId}}
   ```
   *(Hover your mouse over `{{baseUrl}}` — Postman will show you its current value!)*
3. Click **Send**.
4. It should fetch post #1 successfully!

### Step 4: Write Tests Checking Environment Variables
In the **Scripts / Tests** tab:
```javascript
pm.test("Status is 200", function () {
    pm.response.to.have.status(200);
});

pm.test("Post ID matches environment variable", function () {
    var expectedId = parseInt(pm.environment.get("postId"));
    pm.expect(pm.response.json().id).to.eql(expectedId);
});
```

---

## 🏆 Practice Challenge for You
Change the environment variable `postId` from `1` to `10`. Click **Send** again without touching the URL! Notice how it automatically loads post #10!
