QT += qml
TARGET = TransparentView
TEMPLATE = app

SOURCES += \
    main.cpp

DISTFILES += \
    qml/main.qml \
    qml/ColorStar.qml

QMAKE_LFLAGS_WINDOWS += /SUBSYSTEM:WINDOWS,5.01

RESOURCES += \
    res.qrc

RC_FILE = app.rc
