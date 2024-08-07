# QT += qml quick quickcontrols2 widgets location gui positioning network
QT += quick
QT += network
QT += location
QT += webview
# QT += webengine
# QT += webenginecore


SOURCES += \
        main.cpp

resources.files = main.qml 
resources.prefix = /$${TARGET}
RESOURCES += resources \
    Icons.qrc \
    Store.qrc \
    images.qrc \
    jsFiles.qrc \
    resource.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =


# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    AllRegions.qml \
    AllRegionsSprings.qml \
    ColorStore.qml \
    HttpReqestUtils.js \
    Region.qml \
    RegionSpringsList.qml \
    SidePanel.qml \
    SizesStore.qml \
    Spring.qml \
    TextInputResponsiv.qml \
    TryComponent.qml \
    qmldir
