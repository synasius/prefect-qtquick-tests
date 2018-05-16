import QtQuick 2.10
import QtQuick.Window 2.10

import Prefect 1.0


Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Flow {
        anchors.fill: parent
        spacing: 10

        Planet { }
        Planet { }
        Planet { }
        Planet { }
        Planet { }
        Planet { }
    }
}
