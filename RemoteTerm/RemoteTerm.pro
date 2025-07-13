#-------------------------------------------------
#
# Project created by QtCreator 2017-10-31T00:37:59
#
#-------------------------------------------------

QT       += core gui network

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = RemoteTerm
TEMPLATE = app

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

CONFIG += c++11

SOURCES += \
        main.cpp \
    remoteterm.cpp

HEADERS += \
    remoteterm.h

win32 {
    # Windows特定配置
    LIBS += -lqtermwidget6
    # 可能需要指定qtermwidget的路径
    INCLUDEPATH += C:/path/to/qtermwidget/include
    LIBS += -LC:/path/to/qtermwidget/lib
} else:unix:!macx {
    # Unix特定配置(保留原有配置)
    LIBS += -lqtermwidget6 -lutil
    INCLUDEPATH += qtermwidget/lib qtermwidget/build/lib
} else:macx {
    # macOS特定配置
    LIBS += -lqtermwidget6
    INCLUDEPATH += /usr/local/include/qtermwidget6
}
