# print all path we use
message(STATUS "CMAKE_CURRENT_SOURCE_DIR====${CMAKE_CURRENT_SOURCE_DIR}")
message(STATUS "CMAKE_CURRENT_BINARY_DIR====${CMAKE_CURRENT_BINARY_DIR}")

# first we add the executable that generates the table
add_executable(MakeTable MakeTable.cxx)

# add the command to generate the source code
add_custom_command(
        OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/Table.h
        COMMAND MakeTable ${CMAKE_CURRENT_BINARY_DIR}/Table.h
        DEPENDS MakeTable
)

# add the main library
# let CMake know that mysqrt.cxx depends on the generated file Table.h
# so add it to the list of sources for the library MathFunctions
add_library(MathFunctions
        mysqrt.cxx
        ${CMAKE_CURRENT_BINARY_DIR}/Table.h
        )

# 1. state that anybody linking to us needs to include the current source dir
# to find MathFunctions.h, while we don't
# 2. state tht we depend on Tutorial_BINARY_DIR but consumers don't. as the
# TutorialConfig.h include is an implementation detail
# 3. state that we depend on our binary dir to find Table.h
target_include_directories(MathFunctions
        INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}
        PRIVATE ${CMAKE_CURRENT_BINARY_DIR}
        )

# does this system provide the log and exp functions?
include(CheckSymbolExists)
check_symbol_exists(log "math.h" HAVE_LOG)
check_symbol_exists(exp "math.h" HAVE_EXP)
if(NOT (HAVE_LOG AND HAVE_EXP))
    unset(HAVE_LOG CACHE)
    unset(HAVE_EXP CACHE)
    set(CMAKE_REQUIRED_LIBRARIES "m")
    check_symbol_exists(log "math.h" HAVE_LOG)
    check_symbol_exists(exp "math.h" HAVE_EXP)
    if(HAVE_LOG AND HAVE_EXP)
        target_link_libraries(MathFunctions PRIVATE m)
    endif()
endif()

# add compile definitions
if(HAVE_LOG AND HAVE_EXP)
    target_compile_definitions(MathFunctions
            PRIVATE "HAVE_LOG" "HAVE_EXP")
endif()

# install rules
install(TARGETS MathFunctions DESTINATION lib)
install(FILES MathFunctions.h DESTINATION include)
