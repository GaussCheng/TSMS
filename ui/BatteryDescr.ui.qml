import QtQuick 2.4
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3

Item {
    id: batteryDescr
    width: 75
    height: 107
    property double percent: 95.00
    property alias titleText: title.text
    anchors.left: gridLayout.left
    anchors.leftMargin: 0
    anchors.top: gridLayout.bottom
    anchors.topMargin: 4

    Rectangle {
        id: rectangle1
        x: 29
        y: 0
        width: 28
        height: 11
        color: "#00000000"
        anchors.horizontalCenter: parent.horizontalCenter
        border.color: "#ffffff"
    }

    Rectangle {
        id: rectangle2
        color: "#00000000"
        radius: 8
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.top: rectangle1.bottom
        anchors.topMargin: -1
        border.color: "#ffffff"

        Rectangle {
            id: p1
            y: 8
            height: (parent.height - 16) / 5
            color: "yellow"
            anchors.bottom: p2.top
            anchors.bottomMargin: 2
            anchors.right: parent.right
            anchors.rightMargin: 4
            anchors.left: parent.left
            anchors.leftMargin: 4
            border.color: "#00000000"
            visible: percent > 99
        }

        Rectangle {
            id: p2
            x: 1
            y: 9
            height: p1.height
            color: "#ffff00"
            visible: percent > 80.00
            anchors.bottom: p3.top
            anchors.bottomMargin: 2
            anchors.leftMargin: 4
            anchors.rightMargin: 4
            anchors.right: parent.right
            anchors.left: parent.left
            border.color: "#00000000"
        }

        Rectangle {
            id: p3
            x: 6
            y: 9
            height: p1.height
            color: "#ffff00"
            anchors.bottom: p4.top
            anchors.bottomMargin: 2
            anchors.leftMargin: 4
            anchors.rightMargin: 4
            anchors.right: parent.right
            anchors.left: parent.left
            border.color: "#00000000"
            visible: percent > 60
        }

        Rectangle {
            id: p4
            x: 0
            y: 15
            height: p1.height
            color: "#ffff00"
            anchors.bottom: p5.top
            anchors.bottomMargin: 2
            anchors.leftMargin: 4
            anchors.rightMargin: 4
            anchors.right: parent.right
            anchors.left: parent.left
            border.color: "#00000000"
            visible: percent > 40
        }

        Rectangle {
            id: p5
            x: 9
            y: 12
            height: p1.height
            color: "#ffff00"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 4
            anchors.leftMargin: 4
            anchors.rightMargin: 4
            anchors.right: parent.right
            anchors.left: parent.left
            border.color: "#00000000"
            visible: percent > 5
        }
    }

    Label {
        id: percentLabel
        width: 42
        color: "#ffffff"
        text: percent.toFixed(2)
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: rectangle2.right
        anchors.leftMargin: 0

        Label {
            id: label
            y: 0
            color: "#ffffff"
            text: qsTr("%")
            anchors.left: parent.right
            anchors.leftMargin: 0
        }
    }

    Label {
        id: label1
        color: "#ffffff"
        text: qsTr("SOC")
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 16
        anchors.left: parent.right
        anchors.leftMargin: 0
    }

    Label {
        id: title
        color: "#ffffff"
        text: qsTr("type")
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.bottom
        anchors.topMargin: 0
    }
}

/*##^##
Designer {
    D{i:3;anchors_width:200;anchors_x:17}D{i:4;anchors_width:200;anchors_x:17}D{i:5;anchors_width:200;anchors_x:17}
D{i:6;anchors_width:200;anchors_x:17}D{i:7;anchors_width:200;anchors_x:17}D{i:9;anchors_x:26}
}
##^##*/

