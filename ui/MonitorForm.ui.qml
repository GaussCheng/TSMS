import QtQuick 2.4
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQuick.Templates 2.5

Rectangle {
    id: container
    width: 900
    height: 740
    color: "#030f48"
    property alias elementHeight: container.height
    property alias elementWidth: container.width

    Rectangle {
        id: verSplitLine
        y: 0
        width: 1
        height: container.height
        color: "gray"
        anchors.left: monitorTreeContainer.right
        anchors.leftMargin: 0
    }

    Rectangle {
        id: batteryStatusContainer
        y: 0
        height: 251
        color: "#00000000"
        anchors.right: parent.right
        anchors.rightMargin: 0
        border.color: "#00000000"
        anchors.left: verSplitLine.left
        anchors.leftMargin: 0

        Label {
            id: label13
            x: 0
            y: 0
            height: 24
            color: "#ffffff"
            text: qsTr("Battery Status")
            verticalAlignment: Text.AlignVCenter
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            background: Rectangle {
                color: "#194584"
            }
        }

        GridLayout {
            id: gridLayout
            width: 271
            height: 76
            rowSpacing: 5
            rows: 3
            columns: 3
            anchors.top: label13.bottom
            anchors.topMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 4

            Label {
                id: label5
                width: 97
                height: 16
                color: "#ffffff"
                text: qsTr("Current Status")
            }

            Label {
                id: currentBatteryStatus
                width: 50
                height: 16
                color: "#a2c8e5"
                text: qsTr("OFF")
                Layout.minimumWidth: 50
                styleColor: "#194584"
                horizontalAlignment: Text.AlignRight
                padding: 0
                background: Rectangle {
                    color: "#194584"
                }
            }

            Label {
                id: label8
                width: 97
                height: 16
                color: "#ffffff"
            }

            Label {
                id: label6
                width: 97
                height: 16
                color: "#ffffff"
                text: qsTr("Calc Charge")
            }

            Label {
                id: calcCharge
                width: 50
                height: 16
                color: "#a2c8e5"
                text: qsTr("1.3")
                Layout.minimumWidth: 50
                styleColor: "#194584"
                horizontalAlignment: Text.AlignRight
                padding: 0
                background: Rectangle {
                    color: "#194584"
                }
            }

            Label {
                id: label7
                width: 97
                height: 16
                color: "#ffffff"
                text: qsTr("10kWh")
            }

            Label {
                id: label9
                width: 97
                height: 16
                color: "#ffffff"
                text: qsTr("Calc discharge")
            }

            Label {
                id: calcCharge1
                width: 50
                height: 16
                color: "#a2c8e5"
                text: qsTr("1.3")
                Layout.minimumWidth: 50
                styleColor: "#194584"
                horizontalAlignment: Text.AlignRight
                padding: 0
                background: Rectangle {
                    color: "#194584"
                }
            }

            Label {
                id: label10
                width: 97
                height: 16
                color: "#ffffff"
                text: qsTr("10kWh")
            }
        }

        BatteryDescr {
            id: batteryType1
            percent: 100
            titleText: qsTr("Lithium iron\n")
        }

        BatteryDescr {
            id: batteryType2
            x: 142
            y: 104
            anchors.leftMargin: 140
            anchors.topMargin: 4
            titleText: qsTr("Tri-battery")
        }
    }

    Rectangle {
        id: chargeCurveContainer
        x: 3
        color: "#00000000"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.top: batteryStatusContainer.bottom
        anchors.topMargin: 0
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        Label {
            id: label14
            x: 0
            y: 0
            height: 24
            color: "#ffffff"
            text: qsTr("Battery Charge Curve")
            anchors.leftMargin: 0
            anchors.rightMargin: 0
            anchors.right: parent.right
            anchors.left: parent.left
            verticalAlignment: Text.AlignVCenter
            background: Rectangle {
                color: "#194584"
            }
        }

        ChargeCalcBarChart {
            id: chargeCalcBarChart
            x: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 2
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.top: label14.bottom
            anchors.topMargin: 2
        }
        anchors.right: parent.right
        anchors.left: verSplitLine.left
        border.color: "#00000000"
    }

    Rectangle {
        id: monitorTreeContainer
        x: 0
        y: 0
        width: parent.width * 0.68
        height: 340
        color: "#00000000"

        Image {
            id: image
            x: -39
            y: -342
            width: 416
            height: 324
            anchors.top: parent.top
            anchors.topMargin: 8
            anchors.left: parent.left
            anchors.leftMargin: 8
            source: "images/deploy.png"
            fillMode: Image.PreserveAspectFit

            Label {
                id: label12
                x: 0
                y: 184
                width: 46
                height: 16
                color: "#ffffff"
                text: qsTr("H₂")
                anchors.left: gasConcH2.right
                anchors.leftMargin: 6
            }

            Label {
                id: label11
                x: 503
                y: 162
                width: 46
                height: 16
                color: "#ffffff"
                text: qsTr("CO")
                anchors.left: gasConcCo.right
                anchors.leftMargin: 6
            }

            Label {
                id: coolSystem
                x: 450
                y: 309
                width: 51
                height: 16
                color: "#f12424"
                text: qsTr("ON")
                anchors.left: maxTemp.left
                anchors.leftMargin: 0
                styleColor: "#194584"
                horizontalAlignment: Text.AlignRight
                padding: 0
                renderType: Text.QtRendering
                background: Rectangle {
                    color: "#194584"
                }
            }

            Label {
                id: ffSystem
                x: 450
                y: 272
                width: 51
                height: 16
                color: "#a2c8e5"
                text: qsTr("OFF")
                anchors.left: maxTemp.left
                anchors.leftMargin: 0
                styleColor: "#194584"
                horizontalAlignment: Text.AlignRight
                padding: 0
                renderType: Text.QtRendering
                background: Rectangle {
                    color: "#194584"
                }
            }

            Label {
                id: smokeConc
                x: 450
                y: 235
                width: 51
                height: 16
                color: "#a2c8e5"
                text: qsTr("800PPM")
                anchors.left: maxTemp.left
                anchors.leftMargin: 0
                styleColor: "#194584"
                horizontalAlignment: Text.AlignRight
                background: Rectangle {
                    color: "#194584"
                }
            }

            Label {
                id: gasConcH2
                x: 450
                y: 183
                width: 51
                height: 16
                color: "#a2c8e5"
                text: qsTr("80PPm")
                anchors.left: maxTemp.left
                anchors.leftMargin: 0
                styleColor: "#194584"
                horizontalAlignment: Text.AlignRight
                background: Rectangle {
                    color: "#194584"
                }
            }

            Label {
                id: gasConcCo
                x: 450
                y: 162
                width: 51
                height: 16
                color: "#a2c8e5"
                text: qsTr("55PPm")
                anchors.left: maxTemp.left
                anchors.leftMargin: 0
                styleColor: "#194584"
                horizontalAlignment: Text.AlignRight
                background: Rectangle {
                    color: "#194584"
                }
            }

            Label {
                id: label1
                y: 170
                width: 79
                height: 16
                color: "#99cb78"
                text: qsTr("Gas Conc")
                anchors.left: label.left
                anchors.leftMargin: 0
            }

            Label {
                id: label
                y: 113
                width: 79
                height: 16
                color: "#99cb78"
                text: qsTr("Max Temp")
                anchors.left: parent.right
                anchors.leftMargin: -8
            }

            Label {
                id: maxTemp
                x: 450
                y: 113
                width: 51
                height: 16
                color: "#a2c8e5"
                text: qsTr("25°C")
                anchors.left: label2.right
                anchors.leftMargin: 0
                horizontalAlignment: Text.AlignRight
                styleColor: "#194584"
                background: Rectangle {
                    color: "#194584"
                }
            }

            Label {
                id: label4
                y: 309
                width: 79
                height: 16
                color: "#99cb78"
                text: qsTr("Cool System")
                anchors.left: label.left
                anchors.leftMargin: 0
            }

            Label {
                id: label3
                y: 272
                width: 79
                height: 16
                color: "#99cb78"
                text: qsTr("FF System")
                anchors.left: label.left
                anchors.leftMargin: 0
            }

            Label {
                id: label2
                y: 235
                width: 79
                height: 16
                color: "#99cb78"
                text: qsTr("Smoke Conc")
                anchors.left: label.left
                anchors.leftMargin: 0
            }
        }
    }

    Rectangle {
        id: monitorCurveContainer
        x: 0
        width: monitorTreeContainer.width
        color: "#00000000"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.top: monitorTreeContainer.bottom
        anchors.topMargin: 0

        TemperatureTimeBarChart {
            id: temperatureTimeBarChart
            x: 8
            y: 2
            width: parent.width - 16
            height: parent.height * 0.48
        }

        SafetyRateCurve {
            id: safetyRateCurve
            width: temperatureTimeBarChart.width
            height: temperatureTimeBarChart.height
            anchors.top: temperatureTimeBarChart.bottom
            anchors.topMargin: 0
            anchors.left: temperatureTimeBarChart.left
            anchors.leftMargin: 0
        }
    }
}

/*##^##
Designer {
    D{i:1;anchors_x:625}D{i:5;anchors_x:23;anchors_y:4}D{i:2;anchors_height:200;anchors_width:200;anchors_x:645;anchors_y:0}
D{i:23;anchors_x:2;anchors_y:2}D{i:20;anchors_height:200;anchors_width:200;anchors_x:645;anchors_y:8}
D{i:38;anchors_x:369}D{i:39;anchors_x:369}D{i:42;anchors_x:369}D{i:43;anchors_x:369}
D{i:44;anchors_x:369}D{i:25;anchors_x:8;anchors_y:8}D{i:47;anchors_x:56;anchors_y:224}
D{i:45;anchors_height:200;anchors_y:373}
}
##^##*/

