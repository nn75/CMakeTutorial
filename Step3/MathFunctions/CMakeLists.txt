add_library(MathFunctions mysqrt.cxx)

# print all path we use
message(STATUS "CMAKE_CURRENT_SOURCE_DIR====${CMAKE_CURRENT_SOURCE_DIR}")

# state that anybody linking to us needs to include the current source dir
# to find MathFunctions.h, while we don't
target_include_directories(MathFunctions
        INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}
        )