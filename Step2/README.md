# Step2 Adding a Library

### 1. Simple Run
```
cd Step2_Build
cmake .. -DUSE_MYMATH=OFF //or -DUSE_MYMATH=ON
cmake --build .
```

### 2. Key Points
- We can use `-D` to change option, for example `-DUSE_MYMATH=OFF` can close `USE_MYMATH`
- `option(USE_MYMATH "Use tutorial provided math implementation" ON)` This option will be displayed in the cmake-gui and ccmake with a default value of ON that can be changed by the user. You can run `ccmake ..` to check the value.
