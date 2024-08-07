import QtQuick

Item {
    id: root

    property string difultText
    property int minSize
    property int baseSize
    property int wordSpacing
    property int fontWeight
    property bool edibel
    property string textcolor

    TextEdit {
        id: textid
        Text {
            id: fontSixeGiver
            text: textid.text
            visible: false
            anchors.fill: parent

            fontSizeMode: Text.Fit

            minimumPixelSize: root.minSize
            font.pixelSize: 1000

            font.wordSpacing: root.wordSpacing
            font.weight: root.fontWeight
        }

        text: root.difultText

        activeFocusOnPress: edibel
        focus: edibel

        anchors.fill: parent
        color: root.textcolor

        font.pixelSize: fontSixeGiver.fontInfo.pixelSize

        font.wordSpacing: root.wordSpacing
        font.weight: root.fontWeight

        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        anchors.bottomMargin: textid.height * 0.1
        anchors.rightMargin: textid.width * 0.15
        anchors.leftMargin: textid.anchors.rightMargin
    }
}
