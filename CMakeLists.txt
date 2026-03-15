cmake_minimum_required(VERSION 3.31)

project(maze_api)

# Add all .cc files in src
aux_source_directory(src SOURCES)
add_executable(maze_api_cpp ${SOURCES})

# Add libjpeg
find_package(JPEG REQUIRED)
target_link_libraries(maze_api_cpp jpeg)

# Make cmake --install work for dockerfile
install(TARGETS maze_api_cpp DESTINATION bin)
