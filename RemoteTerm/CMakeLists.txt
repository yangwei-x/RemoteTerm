cmake_minimum_required(VERSION 3.10)
project(RemoteTerm)

# Set C++ standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Enable automatic processing of .ui files
set(CMAKE_AUTOUIC ON)

# Find Qt packages
find_package(Qt6 COMPONENTS Core Gui Widgets Network REQUIRED)

# Enable AUTOMOC for Qt classes
set(CMAKE_AUTOMOC ON)

# Source files
set(SOURCES
    main.cpp
    remoteterm.cpp
    remoteterm.h  # Important to include the header here
)

# Create executable
add_executable(${PROJECT_NAME} ${SOURCES}
    mainwindow.h mainwindow.cpp mainwindow.ui
)

# Link libraries
target_link_libraries(${PROJECT_NAME} PRIVATE
    Qt6::Core
    Qt6::Gui
    Qt6::Widgets
    Qt6::Network
    qtermwidget6
)

# Use embedded qtermwidget
add_subdirectory(qtermwidget)

# Platform specific config
if(WIN32)
    target_compile_definitions(${PROJECT_NAME} PRIVATE WIN32_LEAN_AND_MEAN)
endif()
