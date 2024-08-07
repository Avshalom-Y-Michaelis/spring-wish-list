import QtQuick

Item {
    id: root
    property ListModel regionsSprings

    Item {
        id: constans
        readonly property int minWidth: 400
    }

    GridView {
        id: regionsPage
        model: regionsSprings
        delegate: spring
        anchors.fill: parent
        cellWidth: SizesStore.dinemicGridWidth(root.width, constans.minWidth)
        cellHeight: cellWidth

        // cellHeight: cellWidth * 0.5
        layoutDirection: Qt.RightToLeft
        flow: GridView.FlowLeftToRight
    }

    Component {
        id: spring
        Item {
            width: regionsPage.cellWidth - 20
            height: regionsPage.cellHeight - 20
            Spring {
                springData: regionsSprings.get(index)
                anchors.fill: parent
            }
        }
    }
}
