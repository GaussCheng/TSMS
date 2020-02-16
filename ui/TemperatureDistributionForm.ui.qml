import QtQuick 2.4
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3

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
        height: 32
        anchors.top: parent.top
        anchors.topMargin: 9
        anchors.right: batteryGroupStatusFrame.right
        anchors.rightMargin: 0
        model: [qsTr("Lithium iron"), qsTr("Tri-battery")]
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
            color: "#ffffff"
            text: qsTr("Max Temp")
        }

        Label {
            id: maxTemp
            x: 450
            y: 235
            width: 51
            height: 16
            color: "#a2c8e5"
            text: qsTr("28.97°C")

            styleColor: "#194584"
            horizontalAlignment: Text.AlignRight
            background: Rectangle {
                color: "#194584"
            }
        }

        Label {
            id: label2
            color: "#ffffff"
            text: qsTr("Min Temp")
        }

        Label {
            id: minTemp
            x: 450
            y: 235
            width: 51
            height: 16
            color: "#a2c8e5"
            text: qsTr("20.97°C")

            styleColor: "#194584"
            horizontalAlignment: Text.AlignRight
            background: Rectangle {
                color: "#194584"
            }
        }

        Label {
            id: label3
            color: "#ffffff"
            text: qsTr("Avg Temp")
        }

        Label {
            id: avgTemp
            x: 450
            y: 235
            width: 51
            height: 16
            color: "#a2c8e5"
            text: qsTr("23.99°C")
            styleColor: "#194584"
            horizontalAlignment: Text.AlignRight
            background: Rectangle {
                color: "#194584"
            }
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

    Label {
        id: label4
        x: 424
        height: batteryTypeSel.height
        color: "#ffffff"
        text: qsTr("Battery Type")
        anchors.right: batteryTypeSel.left
        anchors.rightMargin: 6
        verticalAlignment: Text.AlignVCenter
        anchors.top: batteryTypeSel.top
        anchors.topMargin: 0
    }

    Label {
        id: label5
        x: 706
        height: batteryTypeSel.height
        color: "#ffffff"
        text: qsTr("Battery Module")
        anchors.right: batteryGroupIndex.left
        anchors.rightMargin: 6
        verticalAlignment: Text.AlignVCenter
        anchors.top: batteryGroupIndex.top
        anchors.topMargin: 0
    }
}

/*##^##
Designer {
    D{i:2;anchors_y:9}D{i:16;anchors_y:21}D{i:17;anchors_y:21}
}
##^##*/

