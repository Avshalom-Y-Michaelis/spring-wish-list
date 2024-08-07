import QtQuick
import QtQuick.Controls
import "."

Item {
    anchors.fill: parent
    property ListModel regionsSprings

    ListView {
        id: regionsPage
        model: regionsSprings
        delegate: spring
        anchors.fill: parent
        spacing: 10
        clip: true
        focus: true
    }

    Component {
        id: spring

        Rectangle {
            id: ineerString
            height: 20
            width: parent.width
            color: ColorStore.mainGreenColor
            radius: SizesStore.boxRadius

            // anchors.fill: parent
            property variant modelData: model
            property string dec: description ?? "אין עדיין מידע"

            Text {

                anchors.fill: parent
                text: name + ":  " + dec
                elide: Text.ElideRight

                anchors.right: parent.right
                anchors.rightMargin: 10
                font.weight: 1000

                color: ColorStore.mainDarkColor
            }

            MouseArea {
                anchors.fill: parent
                z: 1

                onClicked: {
                    rootWindow.mainStackView.push(springForTest, {
                                                      "opacity": 1
                                                  })
                }
            }

            Spring {
                id: springForTest
                springData: ineerString.modelData
                anchors.fill: parent
                opacity: 0
            }
        }
    }
}
