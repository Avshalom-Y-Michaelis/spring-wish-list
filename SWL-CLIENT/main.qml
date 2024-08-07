import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "qrc:"

ApplicationWindow {
    id: rootWindow
    width: 640
    height: 480
    title: "Hello World"
    visible: true
    property alias mainStackView: mainStackViewId

    header: ToolBar {
        RowLayout {
            ToolButton {
                id: themButtom
                icon.source: "qrc:/icons/darkIcon.png"
                onClicked: {
                    thems.state = thems.state === "light" ? "dark" : "light"
                }
            }

            ToolButton {
                id: goBackButton
                icon.source: "qrc:/icons/goBackIcon.png"
                onClicked: {
                    rootWindow.mainStackView.pop()
                }
            }

            ToolButton {
                id: editeButton
                icon.source: "qrc:/icons/editIcon.png"
                onClicked: {
                    const currentItem = rootWindow.mainStackView.currentItem
                    if (currentItem instanceof Spring) {
                        currentItem.edit()
                    }
                }
            }
        }
        ToolButton {
            icon.source: "qrc:/icons/drawerIcon.png"
            anchors.right: parent.right
            onClicked: {
                sidePanel.id.open()
            }
        }
    }

    StackView {
        id: mainStackViewId
        anchors.centerIn: parent

        width: rootWindow.width - 100
        height: rootWindow.height - 100
        initialItem: Item {

            // Spring {}
            // Region {}
            // TryComponent {
            //     anchors.fill: parent
            // }
            AllRegions {
                anchors.fill: parent
            }
            // AllRegionsSprings {}
            // RegionSpringsList {}
        }
    }

    SidePanel {
        anchors.fill: parent
        id: sidePanel
        mainStackView: mainStackViewId
        drawrWidth: rootWindow.width * 0.3
    }

    Item {
        id: thems
        state: "dark"

        states: [
            State {
                name: "dark"
                PropertyChanges {
                    target: rootWindow
                    color: "darkslategrey"
                }
                PropertyChanges {
                    target: themButtom
                    icon.source: "qrc:/icons/lightIcon.png"
                }
            },
            State {
                name: "light"
                PropertyChanges {
                    target: rootWindow
                    color: "blanchedalmond"
                }
                PropertyChanges {
                    target: themButtom
                    icon.source: "qrc:/icons/darkIcon.png"
                }
            }
        ]
    }
}
