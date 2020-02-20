import QtQuick 2.6
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3


Rectangle {
    id: container
    width: 1200
    height: 740
    color: "#030f48"

    Rectangle{
        id: headerContainer
        width: container.width
        height: 80
        color: "#030f48"
        Row{
            x:30
            y:20
            spacing: 10
            Text {
                id: element
                width: 100
                height: 40
                color: "#ffffff"
                text: qsTr("Battery Type")
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 18

            }
            ComboBox {
                id: comboBox
                model: [qsTr("Lithium iron"), qsTr("Tri-battery")]
            }

            Text {
                id: element1
                width: 110
                height: 40
                color: "#ffffff"
                text: qsTr("Battery Module")
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 18
            }

            ComboBox {
                id: comboBox1
                property string batteryGroupIndexItemName: qsTr("Battery Module")
                model: [["#01" + batteryGroupIndexItemName, "#02" + batteryGroupIndexItemName, "#03" + batteryGroupIndexItemName, "#04" + batteryGroupIndexItemName, "#05"
                         + batteryGroupIndexItemName, "#06" + batteryGroupIndexItemName, "#07" + batteryGroupIndexItemName, "#08" + batteryGroupIndexItemName, "#09"
                         + batteryGroupIndexItemName, "#10" + batteryGroupIndexItemName, "#11" + batteryGroupIndexItemName, "#12" + batteryGroupIndexItemName], ["#01" + batteryGroupIndexItemName, "#02" + batteryGroupIndexItemName, "#03" + batteryGroupIndexItemName, "#04" + batteryGroupIndexItemName, "#05" + batteryGroupIndexItemName, "#06" + batteryGroupIndexItemName, "#07" + batteryGroupIndexItemName, "#08" + batteryGroupIndexItemName, "#09" + batteryGroupIndexItemName, "#10" + batteryGroupIndexItemName, "#11" + batteryGroupIndexItemName, "#12" + batteryGroupIndexItemName, , "#13" + batteryGroupIndexItemName, , "#14" + batteryGroupIndexItemName, , "#15" + batteryGroupIndexItemName, , "#16" + batteryGroupIndexItemName]][comboBox.currentIndex]

            }

            Text {
                id: element2
                width: 70
                height: 40
                color: "#ffffff"
                text: qsTr("Battery")
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 18
            }

            ComboBox {
                id: comboBox2
                model: ["#01", "#02", "#03", "#04", "#05", "#06", "#07", "#08", "#09", "#10", "#11", "#12"]
            }

            Text {
                id: element3
                width: 100
                height: 40
                color: "#ffffff"
                text: qsTr("Alarm History")
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 18
            }

            ComboBox {
                id: comboBox3
                model: [qsTr("Last Day"), qsTr("Past Week"), qsTr("Last Month"), qsTr("Last Year")]
            }

            Button {
                id: button
                text: qsTr("Find")
            }


        }

    }
    Rectangle{
        id: bodyContainer
        width: container.width
        height: container.height-80
        anchors.top: headerContainer.bottom
        AlarmInfoTable{
            anchors.fill: parent
        }
    }



}
