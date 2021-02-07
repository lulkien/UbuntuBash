import QtQuick 2.0

Item {
    anchors.fill: parent
    Rectangle {
        id: mainArea
        anchors.fill: parent
        anchors.margins: 30

        border.color: "#000000"
        clip: true
        TextEdit {
            id: text
            width: 500
            height: 400
            anchors.margins: 10
            wrapMode: Text.Wrap
            text: AppModel.bashrcText
        }
    }
}
