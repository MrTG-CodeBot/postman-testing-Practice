@echo off
echo ========================================================
echo Running Practice 10 Postman Collection via Newman CLI...
echo ========================================================
npx --yes newman run practice-10.postman_collection.json -d test-data.csv
echo.
pause
