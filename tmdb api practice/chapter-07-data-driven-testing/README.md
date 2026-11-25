# Chapter 07: Data-Driven Testing on TMDB with CSV & Newman

## 🎯 What You Will Do
Run a single Postman request **4 times automatically** using a real dataset (`movies.csv`) to verify that TMDB returns the right release year and title for multiple famous movies!

---

## 💡 About This Chapter (For Beginners)
Instead of writing 4 separate search requests for *Inception*, *The Matrix*, *Interstellar*, and *Parasite*, you store the test cases in a **CSV spreadsheet** (`movies.csv`):
```csv
movie_title,expected_year
Inception,2010
The Matrix,1999
Interstellar,2014
Parasite,2019
```
Postman reads each row with `pm.iterationData.get("...")` and checks the live TMDB API against your expected values!

---

## 🛠️ How to Do It (Step-by-Step)

### Option A: Run Inside Postman UI (Collection Runner)
1. Import `chapter-07.postman_collection.json` into Postman.
2. Make sure **TMDB Environment** (with your `tmdb_token`) is selected in the top right.
3. Click the **TMDB Chapter 07 - Data-Driven Testing** collection → click **Run**.
4. Under **Data**, click **Select File** and choose `movies.csv` from this folder.
5. Click **Preview** to confirm 4 rows are loaded.
6. Click **Run TMDB Chapter 07 - Data-Driven Testing**.
7. All 4 iterations and 12 assertions will execute automatically!

### Option B: Run from Terminal with Newman
In PowerShell inside this folder:
```powershell
newman run chapter-07.postman_collection.json -e ../tmdb-environment.postman_environment.json -d movies.csv --env-var "tmdb_token=YOUR_REAL_TOKEN_HERE"
```

---

## 🏆 Graduation Challenge!
Add 2 of your own favorite movies and their release years to `movies.csv`, then re-run the Collection Runner to verify they pass!
