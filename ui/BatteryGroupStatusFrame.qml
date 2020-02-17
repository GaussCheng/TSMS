import QtQuick 2.12
import QtQuick.Controls 2.3
import Theme 1.0
import BatteryStatusTableModel 1.0

Rectangle {
    id:container
    property alias rowCount: batteryStatusTableModel.rCount
    property alias colCount: batteryStatusTableModel.cCount
    color: "#00000000"
    Column{
        id: rowTitles
        spacing: 2
        Repeater{
            model: rowCount
            id:content
            Text {
                color: Theme.mainTextColor
                height: batteryTable.batteryStatusHeight
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignRight
                text: (Array(2).join("0") + (index + 1)).slice(-2) + "# " + qsTr("Bat Group");
            }
        }
    }

    Rectangle{
        id:batteryStatusGroup
        anchors.left: rowTitles.right
        BatteryStatusTableModel{
            id: batteryStatusTableModel
        }
        color: "#FFFFFF"
        width: batteryTable.width
        height: batteryTable.height
        TableView{
            id: batteryTable
            property double batteryStatusWidth: (container.width - rowTitles.width -  rowSpacing * colCount) / colCount
            property double batteryStatusHeight: (container.height - colTitles.height -  columnSpacing * rowCount) / rowCount
            model: batteryStatusTableModel
            width: batteryStatusWidth * colCount + rowSpacing * colCount
            height: batteryStatusHeight * rowCount + columnSpacing * rowCount
//            x:1
//            y:1
            rowSpacing: 0
            columnSpacing: 0
            contentWidth: parent.width
            contentHeight: parent.height
            reuseItems: false
            delegate: Button{
                implicitWidth: batteryTable.batteryStatusWidth
                implicitHeight: batteryTable.batteryStatusHeight
                checkable: true
                autoExclusive: true
//                palette.button:"red"
//                palette.dark:"yellow"

                leftPadding: 2
                rightPadding:2
                topPadding:2
                bottomPadding:2
                contentItem:Rectangle{
                    color: "red"
                }

                background: Rectangle{
                    implicitWidth: parent.implicitWidth
                    implicitHeight: parent.implicitHeight
//                    opacity: enabled ? 1 : 0.3
//                    color: parent.down ? "#d0d0d0" : "#e0e0e0"
                    color: parent.checked ? "gray":"#00000000"
                }
                ToolTip{
                    id:tip
                    visible: parent.checked
                }
                onCheckedChanged: {
                    var v = JSON.parse(model.display);
                    tip.text = (Array(2).join("0") + (row + 1)).slice(-2) + "# " + qsTr("Bat Group") + " " +
                            (Array(2).join("0") + (column + 1)).slice(-2) + "# " + qsTr("Bat Module") + ",\n" +
                            v.avgTemp + "°C";
                }
            }
        }
    }

    Row{
        id: colTitles
        anchors.top: batteryStatusGroup.bottom
        anchors.horizontalCenter: batteryStatusGroup.horizontalCenter
        anchors.left: batteryStatusGroup.left
        spacing: 2
        Repeater{
            model: colCount
            Text {
                color:"#FFFFFF"
                width: batteryTable.batteryStatusWidth
                horizontalAlignment: Text.AlignHCenter
                text: (Array(2).join("0") + (index + 1)).slice(-2);
            }
        }
    }

    Rectangle{
        id: legendContainer
        height: batteryStatusGroup.height
        anchors.left: batteryStatusGroup.right
        anchors.top: batteryStatusGroup.top
        anchors.leftMargin: 8
        width: 20 + invalidLegend.width
        color: "#00000000"
        Row{
            id: invalidLegend
            spacing: 2
            Rectangle{
                color: "gray"
                width: 16
                height: 16
            }
            Text {
                color: "#FFFFFF"
                text: qsTr("Invalid Value")
            }
        }
        Row{
            id: large60Legend
            spacing: 2
            anchors.top: invalidLegend.bottom
            anchors.topMargin: 4
            Rectangle{
                width: 16
                height: 16
                color: "#B9DCA3"
            }
            Text {
                color: "#FFFFFF"
                text: qsTr("> 60°C")
            }
        }

        Image{
            id: temperatureBar
            anchors.top: large60Legend.bottom
            anchors.topMargin: 4
            source: "images/temperature_bar.png"
            width: 16
            anchors.bottom: parent.bottom
            Text {
                color: "#FFFFFF"
                text: qsTr("0°C")
                anchors.top: parent.top
                anchors.left: parent.right
                anchors.leftMargin: 2
            }
            Text {
                color: "#FFFFFF"
                text: qsTr("60°C")
                anchors.bottom: parent.bottom
                anchors.left: parent.right
                anchors.leftMargin: 2
            }
        }
    }
}
