import QtQuick 2.0
import QtQuick.XmlListModel 2.0

Item {
    width: 1626
    height: 116

    property string feed;
    property bool loading: feedModel.status == XmlListModel.Loading

    XmlListModel {
        id: feedModel
        source: parent.feed
        query: "/rss/channel/item"

        XmlRole { name: "title"; query: "title/string()" }
        XmlRole { name: "description"; query: "description/string()" }
    }

    Row  {
        spacing: 4

        Text {
            text: "Annonces"
            font.family: "Helvetica"
            font.pixelSize: 72
            font.bold: true
            color: "#acacae"

        }

//        Item {
    }
}
