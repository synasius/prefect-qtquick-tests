import QtQuick 2.10


Rectangle {
    id: root
    width: 50; height: width
    radius: width / 2

    color: Qt.rgba(Math.random(), Math.random(), Math.random(), 1);

    MouseArea {
        anchors.fill: parent
        onClicked: {
           root.width = root.width * 1.1
        }
    }
}
