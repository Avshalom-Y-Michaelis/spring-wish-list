import QtQuick

// import QtLocation
import QtWebEngine
import QtPositioning
import QtLocation 5.11
import QtWebView

// import QtWebEngine
Item {

    // Map {
    //     id: map
    //     anchors.fill: parent
    //     plugin: Plugin {
    //         name: "mapboxgl"
    //         // PluginParameter {
    //         //     name: "mapboxgl.mapping.additional_style_urls"
    //         //     value: "https://api.maptiler.com/maps/streets/style.json?key=KbnpmtljnrjyjQDUsGBH"
    //         // }
    //     }

    //     zoomLevel: 12

    //     MapPolygon {}

    //     // center: QtPositioning.coordinate(31.76, 35.21)

    //     // zoomLevel: 14
    //     // activeMapType: supportedMapTypes[supportedMapTypes.length - 1]
    // }
    WebView {
        id: webview
        url: "file:///C:\Users\avsha\Documents\code\text.html"
        anchors.fill: parent
    }
}
