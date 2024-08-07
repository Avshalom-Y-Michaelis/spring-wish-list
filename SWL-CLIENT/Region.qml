import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import "HttpReqestUtils.js" as Http
import "."

Item {
    id: region
    anchors.fill: parent
    property int regionId
    property string regionName

    Item {
        id: constans

        readonly property var progresBarText: (value, to) => value + "/" + to
    }

    GridLayout {
        id: mainGrid
        anchors.fill: parent
        layoutDirection: Qt.RightToLeft
        columns: 4

        Rectangle {
            Layout.columnSpan: mainGrid.columns
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: ColorStore.mainGreenColor
            radius: SizesStore.boxRadius

            Text {
                id: titelid
                readonly property string titel: region.regionName + " " + region.regionId

                text: titelid.titel
                color: ColorStore.mainDarkColor

                anchors.fill: parent
                fontSizeMode: Text.Fit
                minimumPixelSize: 5
                font.pixelSize: 40
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.wordSpacing: 40

                bottomPadding: titelid.height * 0.05
                topPadding: titelid.bottomPadding

                font.weight: 1000
            }
        }

        Rectangle {
            Layout.columnSpan: 3
            Layout.column: 0
            Layout.row: 1
            Layout.rowSpan: 2

            Layout.fillHeight: true
            Layout.fillWidth: true
            color: ColorStore.mainDarkColor

            RegionSpringsList {

                Layout.fillWidth: true
                Layout.fillHeight: true

                regionsSprings: regionsSprings

                // MouseArea {
                //     anchors.fill: parent
                //     onClicked: console.log("clickd")
                // }
            }
        }

        Rectangle {
            Layout.columnSpan: 1
            Layout.column: 3
            Layout.row: 1
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: ColorStore.mainGreenColor
            radius: SizesStore.boxRadius

            TextInputResponsiv {
                id: saveBottunText
                anchors.fill: parent
                difultText: "לרשימה המלאה
של כול המעינות"
                minSize: 5
                fontWeight: 1000
                textcolor: ColorStore.mainDarkColor
            }

            MouseArea {
                anchors.fill: parent

                z: 1
                onClicked: {
                    rootWindow.mainStackView.push(allSprings, {
                                                      "opacity": 1
                                                  })
                }
            }

            AllRegionsSprings {
                id: allSprings
                regionsSprings: regionsSprings
                anchors.fill: parent
                opacity: 0
            }
        }

        Rectangle {
            Layout.columnSpan: 1
            Layout.column: 3
            Layout.row: 2
            Layout.fillHeight: true
            Layout.fillWidth: true

            id: springProgressBar
            property int from: 0
            property int to: 8
            property int value: 4
            radius: SizesStore.boxRadius
            border.color: ColorStore.mainGreenColor
            border.width: 10

            color: ColorStore.mainRedColor

            Rectangle {
                anchors.right: parent.right
                color: ColorStore.mainGreenColor
                height: parent.height - 4
                radius: SizesStore.boxRadius
                width: (springProgressBar.width / springProgressBar.to) * springProgressBar.value

                TextInputResponsiv {
                    id: ratingText
                    anchors.fill: parent
                    difultText: constans.progresBarText(
                                    springProgressBar.value,
                                    springProgressBar.to)
                    minSize: 10
                    fontWeight: 1000
                    textcolor: ColorStore.mainDarkColor
                    edibel: false
                }
            }
        }
    }

    ListModel {
        id: regionsSprings
    }

    Component.onCompleted: {
        Http.sendRequestJson(
                    "GET",
                    "http://localhost:8080/regions/" + region.regionName + "/springs",
                    respons => {
                        respons.forEach(spring => regionsSprings.append({
                                                                            "id": spring.id,
                                                                            "name": spring.name,
                                                                            "description": spring.description,
                                                                            "rating": spring.rating,
                                                                            "hasBeenVisited": spring.hasBeenVisited,
                                                                            "regionId": spring.regionId
                                                                        }))
                    })
    }
}
