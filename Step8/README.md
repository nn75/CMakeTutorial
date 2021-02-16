# Step8
## Adding Support for a Dashboard

1. The ctest executable will read in the CTestConfig.cmake file when it runs.

2. Use  the following command to run test:
```
cd Step8_build
cmake ..
ctest [-VV] -D Experimental
```
3. To check results:
```
https://my.cdash.org/index.php?project=CMakeTutorial
```
