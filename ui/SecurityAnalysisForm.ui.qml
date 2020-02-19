import QtQuick 2.4
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3

Rectangle {
    id: container
    width: 900
    height: 740
    color: "#030f48"

    Rectangle{
        id: headerContainer
        width: container.width
        height: 80
        color: "#030f48"
        Row{
            x:50
            y:20
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
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
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
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 18
            }
            ComboBox {
                id: comboBox2
                model: ["#01", "#02", "#03", "#04", "#05", "#06", "#07", "#08", "#09", "#10", "#11", "#12"]
            }
        }
    }

    Rectangle{
        id: bodyContainer
        width: container.width
        height: container.height-100
        anchors.top: headerContainer.bottom
        color: "#030f48"
        SafetyFactorChangeCurve{
            id: safetyFactorChangeCurve
            width: parent.width*0.43
            height: parent.height*0.4
            anchors.left: parent.left
            anchors.leftMargin: parent.width*0.02

            Rectangle {
                id: rectangle
                width: 10
                height: bodyContainer.height
                anchors.left: safetyFactorChangeCurve.right
                anchors.leftMargin: bodyContainer.width*0.04-5
                color: "#ded5cc"
            }

            Rectangle {
                id: rectangle1
                width: bodyContainer.width
                height: 10
                color: "#ded5cc"
                anchors.top: safetyFactorChangeCurve.bottom
                anchors.topMargin: parent.width*0.04
            }
        }

        SafetyVoltageCurve {
            id: safetyVoltageCurve
            width: parent.width*0.43
            height: parent.height*0.4
            anchors.left: safetyFactorChangeCurve.right
            anchors.leftMargin: parent.width*0.08
        }

        MaximumTemperatureCurve {
            id: maximumTemperatureCurve
            width: parent.width*0.43
            height: parent.height*0.4
            anchors.left: parent.left
            anchors.leftMargin: parent.width*0.02
            anchors.top: safetyFactorChangeCurve.bottom
            anchors.topMargin: parent.height*0.08
        }

        IndividualSafetyFactor {
            id: individualSafetyFactor
            width: parent.width*0.43
            height: parent.height*0.4
            anchors.left: maximumTemperatureCurve.right
            anchors.leftMargin: parent.width*0.08
            anchors.top: safetyVoltageCurve.bottom
            anchors.topMargin: parent.height*0.08
        }
    }


}
