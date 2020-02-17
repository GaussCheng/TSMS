import QtQuick 2.4
import QtQuick.Controls 2.3
import Theme 1.0

Label {
    id: container
    property string statusText: ""
    property string unit: ""
    text: statusText + " " + unit
    color: Theme.statusText
    horizontalAlignment: Text.AlignRight
    background: Rectangle {
        color: Theme.statusTextBG
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
