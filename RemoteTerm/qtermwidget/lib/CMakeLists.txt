# qtermwidget库的CMakeLists.txt
cmake_minimum_required(VERSION 3.16)

# 设置项目名称和版本
project(qtermwidget VERSION 0.14.1 LANGUAGES CXX)

# 设置C++标准
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

# 设置Qt相关选项
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

# 查找Qt包
find_package(Qt5 COMPONENTS Core Widgets REQUIRED)

# 操作系统无关的源文件
set(SRCS_OS_INDEPENDENT
    os_independent/BlockArray.cpp
    os_independent/ColorScheme.cpp
    os_independent/Emulation.cpp
    os_independent/Filter.cpp
    os_independent/History.cpp
    os_independent/HistorySearch.cpp
    os_independent/KeyboardTranslator.cpp
    os_independent/Screen.cpp
    os_independent/ScreenWindow.cpp
    os_independent/SearchBar.cpp
    os_independent/Session.cpp
    os_independent/TerminalCharacterDecoder.cpp
    os_independent/TerminalDisplay.cpp
    os_independent/Vt102Emulation.cpp
    os_independent/konsole_wcwidth.cpp
    os_independent/qtermwidget.cpp
    os_independent/tools.cpp
)

# 操作系统相关的源文件
set(SRCS_OS_DEPENDENT
    os_dependent/Pty.cpp
    os_dependent/ShellCommand.cpp
    os_dependent/kprocess.cpp
    os_dependent/kpty.cpp
    os_dependent/kptydevice.cpp
    os_dependent/kptyprocess.cpp
)

# 头文件
set(HDRS_OS_INDEPENDENT
    os_independent/BlockArray.h
    os_independent/Character.h
    os_independent/CharacterColor.h
    os_independent/ColorScheme.h
    os_independent/ColorTables.h
    os_independent/DefaultTranslatorText.h
    os_independent/Emulation.h
    os_independent/ExtendedDefaultTranslator.h
    os_independent/Filter.h
    os_independent/History.h
    os_independent/HistorySearch.h
    os_independent/KeyboardTranslator.h
    os_independent/LineFont.h
    os_independent/Screen.h
    os_independent/ScreenWindow.h
    os_independent/SearchBar.h
    os_independent/Session.h
    os_independent/TerminalCharacterDecoder.h
    os_independent/TerminalDisplay.h
    os_independent/Vt102Emulation.h
    os_independent/konsole_wcwidth.h
    os_independent/qtermwidget.h
    os_independent/tools.h
)

set(HDRS_OS_DEPENDENT
    os_dependent/Pty.h
    os_dependent/ShellCommand.h
    os_dependent/kprocess.h
    os_dependent/kpty.h
    os_dependent/kpty_p.h
    os_dependent/kptydevice.h
    os_dependent/kptyprocess.h
)

# UI文件
set(UI_FILES
    os_independent/SearchBar.ui
)

# 资源文件
set(RESOURCES_FILES
    resources/color-schemes
    resources/default.keytab
    resources/kb-layouts
    resources/qtermwidget.json
    resources/qtermwidget_interface.h
    resources/qtermwidget_version.h.in
    resources/translations
)

# 平台特定配置
if(UNIX)
    if(APPLE)
        # macOS特定配置
        add_definitions(-DHAVE_UTMPX -D_UTMPX_COMPAT)
    else()
        # Linux/Unix特定配置
        add_definitions(-DHAVE_UTMPX)
    endif()
elseif(WIN32)
    # Windows特定配置
    add_definitions(-DUNICODE -D_UNICODE)
endif()

# 创建库
add_library(qtermwidget SHARED
    ${SRCS_OS_INDEPENDENT}
    ${SRCS_OS_DEPENDENT}
    ${HDRS_OS_INDEPENDENT}
    ${HDRS_OS_DEPENDENT}
    ${UI_FILES}
)

# 设置库的属性
set_target_properties(qtermwidget PROPERTIES
    VERSION ${PROJECT_VERSION}
    SOVERSION ${PROJECT_VERSION_MAJOR}
)

# 包含目录
target_include_directories(qtermwidget PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}/os_independent
    ${CMAKE_CURRENT_SOURCE_DIR}/os_dependent
    ${CMAKE_CURRENT_SOURCE_DIR}/resources
)

# 链接库
target_link_libraries(qtermwidget PRIVATE
    Qt5::Core
    Qt5::Widgets
)

# 平台特定链接
if(UNIX)
    if(APPLE)
        # macOS特定链接
        target_link_libraries(qtermwidget PRIVATE util)
    else()
        # Linux/Unix特定链接
        target_link_libraries(qtermwidget PRIVATE util)
    endif()
endif()

# 安装规则
install(TARGETS qtermwidget
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
    RUNTIME DESTINATION bin
)

# 安装头文件
install(FILES
    os_independent/qtermwidget.h
    DESTINATION include/qtermwidget
)

# 安装资源文件
install(DIRECTORY
    resources/color-schemes
    resources/kb-layouts
    resources/translations
    DESTINATION share/qtermwidget
)

install(FILES
    resources/default.keytab
    DESTINATION share/qtermwidget
)