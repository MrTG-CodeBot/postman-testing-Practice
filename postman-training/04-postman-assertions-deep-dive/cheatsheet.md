# 🧪 Postman Assertion Cheatsheet (Chai Matchers)

Keep this reference handy whenever you write API test cases!

### 1. Status Codes
```javascript
// Exact status code
pm.response.to.have.status(200);

// One of multiple allowed statuses
pm.expect(pm.response.code).to.be.oneOf([200, 201, 204]);

// Status text
pm.response.to.have.status("OK");
```

### 2. Performance & Response Time
```javascript
// Response speed benchmark (in milliseconds)
pm.expect(pm.response.responseTime).to.be.below(1000);
```

### 3. Headers
```javascript
// Header existence
pm.response.to.have.header("Content-Type");

// Exact header value
pm.expect(pm.response.headers.get("Content-Type")).to.include("application/json");
```

### 4. Response Body & Types
```javascript
var data = pm.response.json();

// Type validations
pm.expect(data.id).to.be.a("number");
pm.expect(data.title).to.be.a("string");
pm.expect(data.isActive).to.be.a("boolean");
pm.expect(data.tags).to.be.an("array");
pm.expect(data.address).to.be.an("object");
```

### 5. Values & Strings
```javascript
// Equality
pm.expect(data.status).to.eql("active");

// Substring check
pm.expect(data.email).to.include("@example.com");

// Existence
pm.expect(data.token).to.exist;
pm.expect(data.error).to.be.undefined;
```

### 6. Arrays
```javascript
// Array length
pm.expect(data.items).to.have.lengthOf(5);
pm.expect(data.items).to.not.be.empty;

// Check array contains an item
pm.expect(data.roles).to.include("admin");
```
