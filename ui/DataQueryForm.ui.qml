import QtQuick 2.4
import QtQuick.Controls 2.3
import Theme 1.0

Rectangle {
    id: container
    width: 900
    height: 600
    color: "#00000000"

    Row {
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
            model: [["#01" + batteryGroupIndexItemName, "#02" + batteryGroupIndexItemName, "#03" + batteryGroupIndexItemName, "#04" + batteryGroupIndexItemName, "#05" + batteryGroupIndexItemName, "#06" + batteryGroupIndexItemName, "#07" + batteryGroupIndexItemName, "#08" + batteryGroupIndexItemName, "#09" + batteryGroupIndexItemName, "#10" + batteryGroupIndexItemName, "#11" + batteryGroupIndexItemName, "#12" + batteryGroupIndexItemName], ["#01" + batteryGroupIndexItemName, "#02" + batteryGroupIndexItemName, "#03" + batteryGroupIndexItemName, "#04" + batteryGroupIndexItemName, "#05" + batteryGroupIndexItemName, "#06" + batteryGroupIndexItemName, "#07" + batteryGroupIndexItemName, "#08" + batteryGroupIndexItemName, "#09" + batteryGroupIndexItemName, "#10" + batteryGroupIndexItemName, "#11" + batteryGroupIndexItemName, "#12" + batteryGroupIndexItemName, , "#13" + batteryGroupIndexItemName, , "#14" + batteryGroupIndexItemName, , "#15" + batteryGroupIndexItemName, , "#16" + batteryGroupIndexItemName]][batteryTypeSel.currentIndex]
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
            model: [["#01" + batteryGroupIndexItemName, "#02" + batteryGroupIndexItemName, "#03" + batteryGroupIndexItemName, "#04" + batteryGroupIndexItemName, "#05" + batteryGroupIndexItemName, "#06" + batteryGroupIndexItemName, "#07" + batteryGroupIndexItemName, "#08" + batteryGroupIndexItemName, "#09" + batteryGroupIndexItemName, "#10" + batteryGroupIndexItemName, "#11" + batteryGroupIndexItemName, "#12" + batteryGroupIndexItemName], ["#01" + batteryGroupIndexItemName, "#02" + batteryGroupIndexItemName, "#03" + batteryGroupIndexItemName, "#04" + batteryGroupIndexItemName, "#05" + batteryGroupIndexItemName, "#06" + batteryGroupIndexItemName, "#07" + batteryGroupIndexItemName, "#08" + batteryGroupIndexItemName, "#09" + batteryGroupIndexItemName, "#10" + batteryGroupIndexItemName, "#11" + batteryGroupIndexItemName, "#12" + batteryGroupIndexItemName, , "#13" + batteryGroupIndexItemName, , "#14" + batteryGroupIndexItemName, , "#15" + batteryGroupIndexItemName, , "#16" + batteryGroupIndexItemName]][batteryTypeSel.currentIndex]
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
}
