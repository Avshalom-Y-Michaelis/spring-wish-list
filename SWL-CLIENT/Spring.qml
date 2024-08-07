import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import "qrc:"
import "."

Item {
    id: springid

    property var springData

    Item {
        id: constans

        readonly property string descriptionPlaceHolderText: "כתוב כאן את תיאור המעיין..."
        readonly property string noDescriptionText: "אין תיאור למעיין"
        readonly property string noRating: "אין דירוג למעיין"
        readonly property var ratingFormat: rating => rating + "/10"
        readonly property string saveBottunText: "לשמור שינויים"

        readonly property string hasVisitedIcon: "✓"
        readonly property string hasNotVisitedIcon: "✘"
    }

    Rectangle {
        id: springBackround
        anchors.fill: parent
        color: ColorStore.mainDarkColor

        GridLayout {
            id: mainGrid
            anchors.fill: parent
            columns: 3
            layoutDirection: Qt.RightToLeft

            Rectangle {
                id: titel
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.columnSpan: 2
                radius: SizesStore.boxRadius
                color: ColorStore.mainGreenColor

                TextInputResponsiv {
                    id: titelText
                    anchors.fill: parent
                    difultText: springData.name
                    minSize: 10
                    wordSpacing: 10
                    fontWeight: 1000
                    textcolor: ColorStore.mainDarkColor
                }
            }

            Rectangle {
                id: description
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.column: 1
                Layout.row: 1
                radius: SizesStore.boxRadius
                color: ColorStore.mainGreenColor

                Component.onCompleted: {
                    if (springData.description) {
                        descriptionView.visible = true
                        noDescription.visible = false
                    } else {
                        descriptionView.visible = false
                        noDescription.visible = true
                    }
                }

                ScrollView {
                    id: descriptionView
                    anchors.fill: parent
                    anchors.margins: 5

                    ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
                    ScrollBar.vertical.policy: ScrollBar.AlwaysOff

                    TextArea {
                        id: descriptionText
                        text: springData.description ? springData.description : ""
                        enabled: false

                        font.weight: 1000
                        font.pixelSize: 14

                        color: ColorStore.mainDarkColor
                        background.opacity: 0
                        z: 1

                        wrapMode: TextEdit.Wrap
                        horizontalAlignment: TextEdit.AlignRight

                        placeholderText: constans.descriptionPlaceHolderText
                        placeholderTextColor: ColorStore.mainDarkColor
                    }
                }

                TextInputResponsiv {
                    id: noDescription
                    anchors.fill: parent
                    difultText: constans.noDescriptionText
                    minSize: 10
                    fontWeight: 1000
                    textcolor: ColorStore.mainDarkColor
                }
            }

            Rectangle {
                id: rating
                Layout.column: 1
                Layout.row: 2

                Layout.fillHeight: true
                Layout.fillWidth: true
                color: ColorStore.mainGreenColor

                radius: SizesStore.boxRadius

                TextInputResponsiv {
                    id: ratingText
                    anchors.fill: parent

                    difultText: springData.rating ? constans.ratingFormat(
                                                        springData.rating) : constans.noRating
                    // difultText: constans.ratingFormat(rationgSlider.value)
                    minSize: 10
                    fontWeight: 1000
                    textcolor: ColorStore.mainDarkColor
                    edibel: false
                }

                Slider {
                    id: rationgSlider
                    width: parent.width * (2 / 3)
                    anchors.bottom: parent.bottom
                    anchors.horizontalCenter: parent.horizontalCenter
                    from: 0
                    to: 10
                    stepSize: 1
                    snapMode: Slider.SnapAlways

                    handle: Rectangle {
                        width: rationgSlider.width / rationgSlider.to
                        height: parent.height - 2
                        x: (rationgSlider.width / (rationgSlider.to + 1)) * rationgSlider.value
                        color: ColorStore.mainDarkColor
                        radius: SizesStore.boxRadius
                    }

                    onValueChanged: {
                        ratingText.difultText = constans.ratingFormat(
                                    rationgSlider.value)
                    }
                }
            }

            Rectangle {
                id: hasVisited
                Layout.fillWidth: true
                Layout.fillHeight: true
                Layout.column: 1
                Layout.row: 3
                color: springData.hasBeenVisited ? ColorStore.mainGreenColor : ColorStore.mainRedColor
                radius: SizesStore.boxRadius

                TextInputResponsiv {
                    id: hasVisitedText
                    anchors.fill: parent
                    difultText: springData.hasBeenVisited ? constans.hasVisitedIcon : constans.hasNotVisitedIcon
                    minSize: 90
                    fontWeight: 100
                    textcolor: ColorStore.mainDarkColor
                }

                MouseArea {
                    id: hasVisitedMouse
                    anchors.fill: parent
                    enabled: false

                    onClicked: {
                        springData.hasBeenVisited = !springData.hasBeenVisited
                    }
                }
            }

            Rectangle {
                id: pictures
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.rowSpan: 4
                Layout.row: 0
                Layout.columnSpan: 1
                Layout.column: 2
                radius: SizesStore.boxRadius

                SpringImages {
                    anchors.fill: parent
                    backroundColor: ColorStore.mainGreenColor
                }
            }
        }
    }

    Rectangle {
        id: saveEditBottun
        width: springid.width / 4
        anchors.right: parent.right
        height: 30
        color: ColorStore.mainGreenColor
        anchors.top: springid.bottom
        anchors.bottomMargin: 10
        radius: SizesStore.boxRadius

        TextInputResponsiv {
            id: saveBottunText
            anchors.fill: parent
            difultText: constans.saveBottunText
            minSize: 5
            fontWeight: 1000
            textcolor: ColorStore.mainDarkColor
        }

        MouseArea {
            anchors.fill: parent

            onClicked: {
                springid.state = "read"
            }
        }
    }

    state: "read"

    states: [
        State {
            name: "edit"
            PropertyChanges {
                target: titelText
                edibel: true
            }
            PropertyChanges {
                target: saveEditBottun
                visible: true
            }
            PropertyChanges {
                target: descriptionText
                enabled: true
            }
            PropertyChanges {
                target: descriptionView
                visible: true
            }

            PropertyChanges {
                target: noDescription
                visible: false
            }
            PropertyChanges {
                target: hasVisitedMouse
                enabled: true
            }
            PropertyChanges {
                target: ratingText
                edibel: true
            }
            PropertyChanges {
                target: rationgSlider
                enabled: true
            }
            PropertyChanges {
                target: rationgSlider
                visible: true
            }
        },
        State {
            name: "read"
            PropertyChanges {
                target: titelText
                edibel: false
            }
            PropertyChanges {
                target: saveEditBottun
                visible: false
            }
            PropertyChanges {
                target: descriptionText
                enabled: false
            }
            PropertyChanges {
                target: noDescription
                visible: !descriptionText.text
            }
            PropertyChanges {
                target: descriptionView
                visible: descriptionText.text
            }
            PropertyChanges {
                target: hasVisitedMouse
                enabled: false
            }
            PropertyChanges {
                target: ratingText
                edibel: false
            }
            PropertyChanges {
                target: rationgSlider
                enabled: false
            }
            PropertyChanges {
                target: rationgSlider
                visible: false
            }
        }
    ]

    function edit() {
        springid.state = "edit"
    }
}
