pragma Singleton
import QtQuick

QtObject {
    property int boxRadius: 20

    function dinemicGridWidth(windowWidth, minWidth) {
        const regionsInLineNum = Math.floor(windowWidth / minWidth)

        return regionsInLineNum > 0 ? windowWidth / regionsInLineNum : minWidth
    }
}
