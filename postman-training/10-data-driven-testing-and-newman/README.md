# Practice 10: Data-Driven Testing (DDT) & Headless Execution with Newman

## 🎯 Goal
Learn how senior QA automation engineers test:
1. **Data-Driven Testing**: Run the same test request across multiple rows of data from an external CSV file.
2. **Newman**: Run your entire Postman test suite from the command line and integrate it into automated CI/CD pipelines!

---

## 💡 Concepts for Beginners

* **Data-Driven Testing (DDT)**: Rather than duplicating a test 50 times to test 50 different inputs, you create 1 request and feed it a CSV/JSON file. Postman runs an **iteration** for each row in the file.
* **`pm.iterationData.get("columnName")`**: Reads the value of the specified column for the current iteration row.
* **Newman**: Postman's CLI companion. It runs Postman collections in your terminal without opening the graphical UI, ideal for automated test runs on servers like GitHub Actions or Jenkins.

---

## 🛠️ Step-by-Step Instructions

### Part A: Running in Postman UI (Collection Runner)
1. Open Postman.
2. In the left sidebar, click on **Collections**.
3. Select the **10 - Data-Driven Testing and Newman** collection.
4. Click the **Run** button at the top of the collection overview.
5. In the Runner configuration:
   * **Data**: Click **Select File** and pick `test-data.csv` from this folder.
   * Click **Preview** to verify it sees 4 iterations (rows):
     * Row 1: Alice's First Post
     * Row 2: Bob's Bug Report
     * Row 3: Charlie's Feedback
     * Row 4: Diana's Feature Request
6. Click **Run 10 - Data-Driven Testing and Newman**.
7. Watch Postman execute 4 distinct iterations automatically!

---

### Part B: Running Headless from Terminal via Newman
You don't even need to open Postman!

1. Open PowerShell or Terminal in this folder.
2. (If not already installed) Install Newman:
   ```bash
   npm install -g newman
   ```
3. Run the automated suite with this command (or double click `run-tests.bat` on Windows):
   ```bash
   newman run practice-10.postman_collection.json -d test-data.csv
   ```
4. You will see a clean, colorful terminal report table showing:
   * Iterations: 4
   * Requests: 4
   * Assertions: 12
   * Failed: 0

---

## 🏆 Graduation Challenge!
Add a 5th row to `test-data.csv` with your friend's name and re-run Newman. Watch it automatically execute 5 iterations!
Congratulations! You've mastered all 10 core Postman API testing practices! 🎉
