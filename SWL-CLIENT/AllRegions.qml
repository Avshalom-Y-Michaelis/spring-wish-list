import QtQuick
import "HttpReqestUtils.js" as Http

Item {
    id: root

    GridView {
        id: regionsPage
        anchors.fill: parent
        model: regionsData
        delegate: region
        cellWidth: SizesStore.dinemicGridWidth(root.width,
                                               regionsPage.minCellWidth)
        cellHeight: cellWidth * 0.5

        property int minCellWidth: 300

        layoutDirection: Qt.RightToLeft
        flow: GridView.FlowLeftToRight

        // function getCellWidth(windowWidth, minWidth) {
        //     const regionsInLineNum = Math.floor(windowWidth / minWidth)

        //     return regionsInLineNum > 0 ? windowWidth / regionsInLineNum : minWidth
        // }
    }

    Component {
        id: region
        Item {
            width: regionsPage.cellWidth - 20
            height: regionsPage.cellHeight - 20
            Region {
                regionName: name
                regionId: id
            }
        }
    }

    ListModel {
        id: regionsData
    }

    Component.onCompleted: {
        Http.sendRequestJson("GET", "http://localhost:8080/regions",
                             respons => {
                                 respons.forEach(region => regionsData.append({
                                                                                  "id": region.id,
                                                                                  "name": region.name
                                                                              }))
                             })
    }
}
