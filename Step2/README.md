# Step2 Adding a Library

### 1. Simple Run
```
cd Step2_Build
cmake .. -DUSE_MYMATH=OFF //or -DUSE_MYMATH=ON
cmake --build .
```

### 2. Key Points
- We can use -D to change option, for example `-DUSE_MYMATH=OFF` can close the use of macro USE_MYMATH
