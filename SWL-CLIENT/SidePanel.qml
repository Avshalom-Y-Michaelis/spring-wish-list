import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Item {
    property var id: sidePanel
    property int drawrWidth
    required property StackView mainStackView
    anchors.fill: parent

    Rectangle {
        property int outSideBoundes: parent.width
        property int inSideBoundes: parent.width - sidePanel.width

        id: sidePanel
        height: parent.height
        width: parent.width * 0.3
        x: outSideBoundes
        color: "blue"

        NumberAnimation {
            id: sidePanelAnimation
            target: sidePanel
            property: "x"
            duration: 100
        }

        function open() {
            sidePanelAnimation.to = sidePanel.inSideBoundes
            sidePanelAnimation.start()
            cancelArea.enabled = true
        }

        function close() {
            sidePanelAnimation.to = sidePanel.outSideBoundes
            sidePanelAnimation.start()
            cancelArea.enabled = false
        }

        ColumnLayout {
            width: parent.width
            spacing: 20

            Rectangle {
                property bool isMenuOpen: navigationArea.containsMouse

                id: navigation
                Layout.fillWidth: true
                color: "green"
                height: 50

                onIsMenuOpenChanged: {
                    if (isMenuOpen) {
                        menueAnimation.to = 1
                        menueAnimation.start()
                    } else {
                        menueAnimation.to = 0
                        menueAnimation.start()
                    }
                }

                MouseArea {
                    id: navigationArea
                    hoverEnabled: true
                    anchors.fill: parent
                }

                NumberAnimation {
                    id: menueAnimation
                    target: manue
                    property: "scale"
                    from: manue.scale
                    duration: 200
                }
            }

            Rectangle {
                id: manue

                color: "red"
                height: 100
                width: 100
                scale: 0

                transformOrigin: Item.TopRight

                MouseArea {
                    id: menuArea
                    anchors.fill: parent
                    hoverEnabled: true

                    onHoveredChanged: {
                        navigation.isMenuOpen
                                = containsMouse ? true : Qt.binding(
                                                      () => navigationArea.containsMouse)
                    }
                }
            }
        }
    }

    MouseArea {
        id: cancelArea
        height: parent.height
        anchors.left: parent.left
        anchors.right: sidePanel.left

        onClicked: {
            sidePanel.close()
        }
    }

    // Drawer {
    //     id: sidePanel
    //     width: drawrWidth
    //     height: rootWindow.height
    //     interactive: true
    //     edge: Qt.RightEdge

    //     ColumnLayout {
    //         width: parent.width
    //         spacing: 5

    //         MenuBar {

    //             Menu {
    //                 title: qsTr("new item")
    //                 icon.source: "qtc:icons/newIcon.png"
    //                 width: drawrWidth - 20

    //                 Action {
    //                     text: "new region"
    //                     icon.source: "qrc:icons/regionIcon.jpg"
    //                     onTriggered: {
    //                         sidePanel.close()
    //                     }
    //                 }

    //                 Action {
    //                     text: "new spring"
    //                     icon.source: "qrc:icons/springIcon.png"
    //                     onTriggered: {
    //                         sidePanel.close()
    //                     }
    //                 }
    //             }
    //         }

    //         MenuBar {

    //             Menu {
    //                 title: qsTr("navigtion")
    //                 icon.source: "qtc:icons/newIcon.png"
    //                 width: drawrWidth - 20

    //                 Action {
    //                     text: "springs"
    //                     icon.source: "qrc:icons/springIcon.png"
    //                     onTriggered: {
    //                         sidePanel.close()
    //                         // mainStackView.pop()
    //                         mainStackView.push("qrc:/Spring.qml")
    //                     }
    //                 }

    //                 Action {
    //                     text: "regions"
    //                     icon.source: "qrc:icons/regionIcon.jpg"
    //                     onTriggered: {
    //                         sidePanel.close()
    //                         // mainStackView.pop()
    //                         mainStackView.push("qrc:/Region.qml")
    //                     }
    //                 }
    //             }
    //         }

    //         MenuBar {

    //             Menu {
    //                 title: qsTr("shut dwon")
    //                 icon.source: "qtc:icons/newIcon.png"
    //                 width: drawrWidth - 20

    //                 Action {
    //                     text: "quit"
    //                     icon.source: "qrc:icons/quitIcon.png"
    //                     onTriggered: {
    //                         Qt.quit()
    //                     }
    //                 }
    //             }
    //         }
    //     }
    // }
}
