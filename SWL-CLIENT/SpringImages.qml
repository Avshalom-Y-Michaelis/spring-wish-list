import QtQuick
import QtQuick.Controls

Item {
    property string backroundColor

    Item {
        id: consts

        readonly property var _model: {
            "image1": {
                "source": "qrc:images/1.JPG"
            },
            "image2": {
                "source": "qrc:images/2.JPG"
            },
            "image3": {
                "source": "qrc:images/4.JPG"
            },
            "image4": {
                "source": "qrc:images/6.JPG"
            }
        }
    }

    Rectangle {
        color: backroundColor
        anchors.fill: parent
        radius: 20

        Flickable {
            id: flickable
            anchors.fill: parent
            anchors.margins: 10
            contentHeight: pictursCulomn.implicitHeight
            clip: true

            // ScrollBar.vertical: ScrollBar {

            // }
            Column {
                id: pictursCulomn
                spacing: 20
                width: parent.width
                height: /*parent.visibleArea.heightRatio **/ parent.height

                Repeater {
                    model: Object.keys(consts._model)

                    Image {
                        id: o
                        width: parent.width
                        height: o.width
                        source: consts._model[modelData].source
                    }
                }
            }
        }
    }
}
