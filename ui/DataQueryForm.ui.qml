import QtQuick 2.4
import QtQuick.Controls 2.3
import Theme 1.0

Rectangle {
    id: container
    property alias batteryGroupStatusFrame: batteryGroupStatusFrame
    property alias batteryTypeIndex: batteryTypeSel.currentIndex

    width: 900
    height: 700
    color: "#00000000"

    Row {
        id: toolBarContainer
        spacing: 6
        Label {
            id: label4
            color: Theme.mainTextColor
            text: qsTr("Battery Type")
            anchors.verticalCenter: parent.verticalCenter
            verticalAlignment: Text.AlignVCenter
        }
        ComboBox {
            id: batteryTypeSel
            height: 40
            model: [qsTr("Lithium iron"), qsTr("Tri-battery")]
        }

        Label {
            color: Theme.mainTextColor
            text: qsTr("Battery Group")
            anchors.verticalCenter: parent.verticalCenter

            verticalAlignment: Text.AlignVCenter
        }
        ComboBox {
            id: batteryGroup
            height: batteryTypeSel.height
            property string batteryGroupIndexItemName: qsTr("Battery Group")
            model: [["#01" + batteryGroupIndexItemName, "#02" + batteryGroupIndexItemName, "#03" + batteryGroupIndexItemName, "#04" + batteryGroupIndexItemName, "#05" + batteryGroupIndexItemName, "#06" + batteryGroupIndexItemName, "#07" + batteryGroupIndexItemName, "#08" + batteryGroupIndexItemName, "#09" + batteryGroupIndexItemName, "#10" + batteryGroupIndexItemName, "#11" + batteryGroupIndexItemName, "#12" + batteryGroupIndexItemName], ["#01" + batteryGroupIndexItemName, "#02" + batteryGroupIndexItemName, "#03" + batteryGroupIndexItemName, "#04" + batteryGroupIndexItemName, "#05" + batteryGroupIndexItemName, "#06" + batteryGroupIndexItemName, "#07" + batteryGroupIndexItemName, "#08" + batteryGroupIndexItemName, "#09" + batteryGroupIndexItemName, "#10" + batteryGroupIndexItemName, "#11" + batteryGroupIndexItemName, "#12" + batteryGroupIndexItemName, "#13" + batteryGroupIndexItemName, "#14" + batteryGroupIndexItemName, "#15" + batteryGroupIndexItemName, "#16" + batteryGroupIndexItemName]][batteryTypeSel.currentIndex]
        }

        Label {
            id: label5
            color: Theme.mainTextColor
            text: qsTr("Battery Module")
            anchors.verticalCenter: parent.verticalCenter
            verticalAlignment: Text.AlignVCenter
        }
        ComboBox {
            id: batteryGroupIndex
            height: batteryTypeSel.height
            property string batteryGroupIndexItemName: qsTr("Battery Module")
            model: [["#01" + batteryGroupIndexItemName, "#02" + batteryGroupIndexItemName, "#03" + batteryGroupIndexItemName, "#04" + batteryGroupIndexItemName, "#05" + batteryGroupIndexItemName, "#06" + batteryGroupIndexItemName, "#07" + batteryGroupIndexItemName, "#08" + batteryGroupIndexItemName, "#09" + batteryGroupIndexItemName, "#10" + batteryGroupIndexItemName, "#11" + batteryGroupIndexItemName, "#12" + batteryGroupIndexItemName], ["#01" + batteryGroupIndexItemName, "#02" + batteryGroupIndexItemName, "#03" + batteryGroupIndexItemName, "#04" + batteryGroupIndexItemName, "#05" + batteryGroupIndexItemName, "#06" + batteryGroupIndexItemName, "#07" + batteryGroupIndexItemName, "#08" + batteryGroupIndexItemName, "#09" + batteryGroupIndexItemName, "#10" + batteryGroupIndexItemName, "#11" + batteryGroupIndexItemName, "#12" + batteryGroupIndexItemName, "#13" + batteryGroupIndexItemName, "#14" + batteryGroupIndexItemName, "#15" + batteryGroupIndexItemName, "#16" + batteryGroupIndexItemName]][batteryTypeSel.currentIndex]
        }
        DateTimeEdit {
            id: dateTimeEdit
            width: 150
            height: batteryTypeSel.height
        }
        Button {
            id: queryBtn
            text: qsTr("Query")
        }
    }

    BatteryGroupStatusFrame {
        id: batteryGroupStatusFrame
        width: 735
        height: 387
        anchors.top: toolBarContainer.bottom
        anchors.topMargin: 6
        anchors.left: parent.left
        anchors.leftMargin: 6
        rowCount: 12
        colCount: 12
    }

    Rectangle {
        id: safeRateContainer
        y: 470
        width: 128
        height: 128
        color: Theme.infoColor
        radius: 64
        anchors.left: parent.left
        anchors.leftMargin: 6

        Text {
            id: element
            x: 14
            text: qsTr("Module Safe Rate")
            anchors.top: moduleSafeRate.bottom
            anchors.topMargin: 4
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 12
        }

        Text {
            id: moduleSafeRate
            x: 36
            y: 38
            width: 77
            height: 62
            color: "#ff0000"
            text: "0.98"
            anchors.horizontalCenterOffset: 0
            anchors.verticalCenterOffset: -7
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 40
        }
    }

    BatteryModuleSafeBarChart {
        id: batteryModuleSafeBarChart
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 6
        anchors.right: parent.right
        anchors.rightMargin: 6
        anchors.left: safeRateContainer.right
        anchors.leftMargin: 4
        anchors.top: batteryGroupStatusFrame.bottom
        anchors.topMargin: 6
    }
}

/*##^##
Designer {
    D{i:10;anchors_width:735;anchors_x:359;anchors_y:6}D{i:12;anchors_y:76}D{i:11;anchors_x:23}
D{i:14;anchors_x:350;anchors_y:534}
}
##^##*/

