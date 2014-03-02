import QtQuick 2.0
import "Clock"

Item {
    width: 1366
    height: 768

    Image {
        width: parent.width
        height: parent.height
        source: "Images/background.png"

        Image {
            width: parent.width
            height: parent.height
            source: "Images/frame.png"
        }

    }

    Item {
        id: clockcontainer
        anchors.centerIn: parent

        Clock { id: clock; x: 509; y: -360; width: 150; height: 151}
    }
}
