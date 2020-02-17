import QtQuick 2.4
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import Theme 1.0

Rectangle {
    id: container
    width: 900
    height: 600
    color: "#00000000"
    property alias batteryGroupStatusFrame: batteryGroupStatusFrame

    property alias batteryTypeIndex: batteryTypeSel.currentIndex

    BatteryGroupStatusFrame {
        id: batteryGroupStatusFrame
        x: 8
        width: 639
        anchors.top: batteryTypeSel.bottom
        anchors.topMargin: 6
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        colCount: 12
        rowCount: 12
    }

    ComboBox {
        id: batteryTypeSel
        x: 156
        height: 40
        anchors.top: parent.top
        anchors.topMargin: 9
        anchors.right: batteryGroupStatusFrame.right
        anchors.rightMargin: 0
        model: [qsTr("Lithium iron"), qsTr("Tri-battery")]

        Label {
            id: label4
            x: -83
            y: 21
            color: Theme.mainTextColor
            text: qsTr("Battery Type")
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: batteryTypeSel.left
            anchors.rightMargin: 6
            verticalAlignment: Text.AlignVCenter
        }
    }

    ComboBox {
        id: batteryGroupIndex
        x: 754
        y: 9
        height: batteryTypeSel.height
        property string batteryGroupIndexItemName: qsTr("Battery Module")
        anchors.right: parent.right
        anchors.rightMargin: 6
        model: [["#01" + batteryGroupIndexItemName, "#02" + batteryGroupIndexItemName, "#03" + batteryGroupIndexItemName, "#04" + batteryGroupIndexItemName, "#05"
                 + batteryGroupIndexItemName, "#06" + batteryGroupIndexItemName, "#07" + batteryGroupIndexItemName, "#08" + batteryGroupIndexItemName, "#09"
                 + batteryGroupIndexItemName, "#10" + batteryGroupIndexItemName, "#11" + batteryGroupIndexItemName, "#12" + batteryGroupIndexItemName], ["#01" + batteryGroupIndexItemName, "#02" + batteryGroupIndexItemName, "#03" + batteryGroupIndexItemName, "#04" + batteryGroupIndexItemName, "#05" + batteryGroupIndexItemName, "#06" + batteryGroupIndexItemName, "#07" + batteryGroupIndexItemName, "#08" + batteryGroupIndexItemName, "#09" + batteryGroupIndexItemName, "#10" + batteryGroupIndexItemName, "#11" + batteryGroupIndexItemName, "#12" + batteryGroupIndexItemName, , "#13" + batteryGroupIndexItemName, , "#14" + batteryGroupIndexItemName, , "#15" + batteryGroupIndexItemName, , "#16" + batteryGroupIndexItemName]][batteryTypeSel.currentIndex]

        Label {
            id: label5
            x: -98
            y: 21
            color: Theme.mainTextColor
            text: qsTr("Battery Module")
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: batteryGroupIndex.left
            anchors.rightMargin: 6
            verticalAlignment: Text.AlignVCenter
        }
    }

    Label {
        id: label
        x: 727
        y: 136
        width: 167
        height: 16
        text: qsTr("Battery Module Information")
        anchors.right: parent.right
        anchors.rightMargin: 6
        horizontalAlignment: Text.AlignRight
        color: "#F9D24B"
    }

    GridLayout {
        id: gridLayout
        x: 727
        y: 166
        width: 167
        height: 81
        rows: 3
        columns: 2
        anchors.right: parent.right
        anchors.rightMargin: 6

        Label {
            id: label1
            color: Theme.mainTextColor
            text: qsTr("Max Temp")
        }

        StatusLabel {
            id: maxTemp
            x: 450
            y: 235
            width: 51
            height: 16
            statusText: "28.97"
            unit: qsTr("°C")
        }

        Label {
            id: label2
            color: Theme.mainTextColor
            text: qsTr("Min Temp")
        }

        StatusLabel {
            id: minTemp
            x: 450
            y: 235
            width: 51
            height: 16
            statusText: "20.97"
            unit: qsTr("°C")
        }

        Label {
            id: label3
            color: Theme.mainTextColor
            text: qsTr("Avg Temp")
        }

        StatusLabel {
            id: avgTemp
            x: 450
            y: 235
            width: 51
            height: 16
            statusText: "23.99"
            unit: qsTr("°C")
        }
    }

    TemperatureChangeRateCurve {
        id: temperatureChangeRateCurve
        y: 289
        height: 158
        anchors.left: batteryGroupStatusFrame.right
        anchors.leftMargin: 20
        anchors.right: parent.right
        anchors.rightMargin: 6
    }
}

/*##^##
Designer {
    D{i:3;anchors_y:21}D{i:2;anchors_y:9}D{i:5;anchors_y:21}D{i:4;invisible:true}
}
##^##*/

