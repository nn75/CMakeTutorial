# Step3 Adding Usage Requirements for Library

#### 1. Simple Run

#### 2. Key Points
- We hate always adding the header search path in the top-level CMakeLists.txt, so we add the header search path
with the library `MathFuncions`, and then we can use it like a package.
- Before Optimization
```
# In the CMakeLists.txt
target_include_directories(Tutorial PUBLIC
                          "${PROJECT_BINARY_DIR}"
                          "${PROJECT_SOURCE_DIR}/MathFunctions"
                          )
```
- After Optimization
```
# In the CMakeLists.txt
target_include_directories(Tutorial PUBLIC
                          "${PROJECT_BINARY_DIR}"
                          )
# In the MathFunctions/CMakeLists.txt
target_include_directories(MathFunctions
        INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}
        )
```
- `INTERFACE` means things that consumers require but the producer doesn't. For example, `Tutorial` links the library `MathFunctions`, so it needs to know the search path of 'MathFuncion.h'
- The primary commands that leverage usage requirements are:
```
target_compile_definitions()
target_compile_options()
target_include_directories()
target_link_libraries()
```

