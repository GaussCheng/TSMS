import QtQuick 2.4
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQuick.Templates 2.5
import Theme 1.0

Frame {
    id: container
    width: 900
    height: 740
    property alias elementHeight: container.height
    property alias elementWidth: container.width

    Rectangle {
        id: verSplitLine
        y: 0
        width: 1
        height: container.height
        color: Theme.splitLineColor
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
            color: Theme.mainTextColor
            text: qsTr("Battery Status")
            verticalAlignment: Text.AlignVCenter
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0
            background: Rectangle {
                color: Theme.groupBoxTitleBG
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
                color: Theme.mainTextColor
                text: qsTr("Current Status")
            }

            StatusLabel {
                id: currentBatteryStatus
                width: 50
                height: 16
                statusText: qsTr("OFF")
                Layout.minimumWidth: 50
                horizontalAlignment: Text.AlignRight
            }

            Label {
                id: label8
                width: 97
                height: 16
                color: Theme.mainTextColor
            }

            Label {
                id: label6
                width: 97
                height: 16
                color: Theme.mainTextColor
                text: qsTr("Calc Charge")
            }

            StatusLabel {
                id: calcCharge
                width: 50
                height: 16
                statusText: "1.3"
                Layout.minimumWidth: 50
                horizontalAlignment: Text.AlignRight
                padding: 0
            }

            Label {
                id: label7
                width: 97
                height: 16
                color: Theme.mainTextColor
                text: qsTr("10kWh")
            }

            Label {
                id: label9
                width: 97
                height: 16
                color: Theme.mainTextColor
                text: qsTr("Calc discharge")
            }

            StatusLabel {
                id: calcDischarge
                width: 50
                height: 16
                statusText: "1.3"
                Layout.minimumWidth: 50
                horizontalAlignment: Text.AlignRight
            }

            Label {
                id: label10
                width: 97
                height: 16
                color: Theme.mainTextColor
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
            color: Theme.mainTextColor
            text: qsTr("Battery Charge Curve")
            anchors.leftMargin: 0
            anchors.rightMargin: 0
            anchors.right: parent.right
            anchors.left: parent.left
            verticalAlignment: Text.AlignVCenter
            background: Rectangle {
                color: Theme.groupBoxTitleBG
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
                color: Theme.mainTextColor
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
                color: Theme.mainTextColor
                text: qsTr("CO")
                anchors.left: gasConcCo.right
                anchors.leftMargin: 6
            }

            StatusLabel {
                id: coolSystem
                x: 450
                y: 309
                width: 51
                height: 16
                statusText: qsTr("ON")
                color: "red"
                anchors.left: maxTemp.left
                anchors.leftMargin: 0
                horizontalAlignment: Text.AlignRight
            }

            StatusLabel {
                id: ffSystem
                x: 450
                y: 272
                width: 51
                height: 16
                statusText: qsTr("OFF")
                anchors.left: maxTemp.left
                anchors.leftMargin: 0
                horizontalAlignment: Text.AlignRight
            }

            StatusLabel {
                id: smokeConc
                x: 450
                y: 235
                width: 51
                height: 16
                statusText: "800"
                unit: "PPM"
                anchors.left: maxTemp.left
                anchors.leftMargin: 0
                horizontalAlignment: Text.AlignRight
            }

            StatusLabel {
                id: gasConcH2
                x: 450
                y: 183
                width: 51
                height: 16
                unit: qsTr("PPM")
                statusText: "80"
                anchors.left: maxTemp.left
                anchors.leftMargin: 0
                horizontalAlignment: Text.AlignRight
            }

            StatusLabel {
                id: gasConcCo
                x: 450
                y: 162
                width: 51
                height: 16
                unit: qsTr("PPM")
                statusText: "55"
                anchors.left: maxTemp.left
                anchors.leftMargin: 0
                horizontalAlignment: Text.AlignRight
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

            StatusLabel {
                id: maxTemp
                y: 113
                width: 51
                height: 16
                unit: qsTr("°C")
                anchors.left: label2.right
                anchors.leftMargin: 2
                statusText: "25"
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
D{i:20;anchors_height:200;anchors_width:200;anchors_x:645;anchors_y:8}D{i:17;anchors_height:200;anchors_width:200;anchors_x:645;anchors_y:8}
D{i:23;anchors_x:2;anchors_y:2}D{i:25;anchors_x:8;anchors_y:8}D{i:30;anchors_x:369}
D{i:31;anchors_x:369}D{i:33;anchors_x:369}D{i:34;anchors_x:369}D{i:35;anchors_x:369}
D{i:22;anchors_x:8;anchors_y:8}D{i:37;anchors_height:200;anchors_x:369;anchors_y:373}
D{i:38;anchors_x:56;anchors_y:224}D{i:36;anchors_height:200;anchors_x:369;anchors_y:373}
}
##^##*/

