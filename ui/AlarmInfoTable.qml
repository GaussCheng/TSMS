import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Rectangle {
    color: "#030f48"
    ListModel {
        id: tablemode
        ListElement {
            number: "1"
            material: "磷酸铁锂"
            module: "#04电池簇"
            battery: "#01电池组"
            bnumber: "#12"
            downtime: "2020-1-1,01:01:01"
            ftype: "Ⅲ型"
            duration: "00:35:23"
        }
        ListElement {
            number: "2"
            material: "磷酸铁锂"
            module: "#04电池簇"
            battery: "#01电池组"
            bnumber: "#12"
            downtime: "2020-1-1,01:01:01"
            ftype: "Ⅲ型"
            duration: "00:35:23"
        }
        ListElement {
            number: "3"
            material: "磷酸铁锂"
            module: "#04电池簇"
            battery: "#01电池组"
            bnumber: "#12"
            downtime: "2020-1-1,01:01:01"
            ftype: "Ⅱ型"
            duration: "00:35:23"
        }
        ListElement {
            number: "4"
            material: "磷酸铁锂"
            module: "#04电池簇"
            battery: "#01电池组"
            bnumber: "#12"
            downtime: "2020-1-1,01:01:01"
            ftype: "Ⅲ型"
            duration: "00:35:23"
        }
        ListElement {
            number: "5"
            material: "磷酸铁锂"
            module: "#04电池簇"
            battery: "#01电池组"
            bnumber: "#12"
            downtime: "2020-1-1,01:01:01"
            ftype: "Ⅲ型"
            duration: "00:35:23"
        }
        ListElement {
            number: "6"
            material: "磷酸铁锂"
            module: "#04电池簇"
            battery: "#01电池组"
            bnumber: "#12"
            downtime: "2020-1-1,01:01:01"
            ftype: "Ⅰ型"
            duration: "00:35:23"
        }
        ListElement {
            number: "7"
            material: "磷酸铁锂"
            module: "#04电池簇"
            battery: "#01电池组"
            bnumber: "#12"
            downtime: "2020-1-1,01:01:01"
            ftype: "Ⅲ型"
            duration: "00:35:23"
        }
        ListElement {
            number: "8"
            material: "磷酸铁锂"
            module: "#04电池簇"
            battery: "#01电池组"
            bnumber: "#12"
            downtime: "2020-1-1,01:01:01"
            ftype: "Ⅲ型"
            duration: "00:35:23"
        }
    }

    Rectangle{
        id: tablebody
        anchors.centerIn: parent
        width: parent.width-40
        height: parent.height-140
        border.color: "#ffffff"
        TableView{
            id :tableView
            anchors.fill: parent
            alternatingRowColors : false
            TableViewColumn {
                 role: "number"
                 title: qsTr("Number")
                 width: tableView.viewport.width/tableView.columnCount
            }
            TableViewColumn {
                 role: "material"
                 title: qsTr("Battery Material")
                 width: tableView.viewport.width/tableView.columnCount
            }
            TableViewColumn {
                 role: "module"
                 title: qsTr("Battery Module")
                 width: tableView.viewport.width/tableView.columnCount
            }
            TableViewColumn {
                 role: "battery"
                 title: qsTr("Battery")
                 width: tableView.viewport.width/tableView.columnCount
            }
            TableViewColumn {
                 role: "bnumber"
                 title: qsTr("Battery Number")
                 width: tableView.viewport.width/tableView.columnCount
            }
            TableViewColumn {
                 role: "downtime"
                 title: qsTr("Downtime")
                 width: tableView.viewport.width/tableView.columnCount
            }
            TableViewColumn {
                 role: "ftype"
                 title: qsTr("Fault type")
                 width: tableView.viewport.width/tableView.columnCount
            }
            TableViewColumn {
                 role: "duration"
                 title: qsTr("Duration")
                 width: tableView.viewport.width/tableView.columnCount
            }
            model: tablemode

            headerDelegate:
            Rectangle{
               gradient: Gradient {
                   GradientStop { position: 0.0; color: "#FFC000" }
                   GradientStop { position: 1.0; color: "#FFB90F" }
               }
               width: 100;
               height: 40
               border.color: "black"
               Text
               {
                   anchors.centerIn : parent
                   text: styleData.value
                   font.pixelSize: parent.height*0.4
                   font.weight: Font.Bold
               }
            }


           rowDelegate: Rectangle {
               height: 40
               color: "#030f48"
               anchors.leftMargin: 2
           }
           itemDelegate: Rectangle{
               border.width: 1
               color : styleData.selected?"#FFDEAD":(styleData.alternate?"#FFE8CB":"#FFF4E7")
               Text {
                    text: styleData.value
//                    anchors.verticalCenter: parent.verticalCenter
//                    horizontalAlignment: Text.AlignHCenter
                    anchors.centerIn: parent
                    anchors.leftMargin: 5
                    color: styleData.selected? "red" : styleData.textColor//color : "#00CCFE"
                    font.pixelSize: parent.height*0.4
                }
           }
//           itemDelegate:Text{//设置每个单元格的字体样式
//               text: styleData.value
//               color: styleData.selected? "red" : styleData.textColor
//               elide: styleData.elideMode
//           }

//           style: TableViewStyle{
//                textColor: "#000000"
//                highlightedTextColor : "#00CCFE"  //选中的颜色
//                backgroundColor : "#ffffff"
//           }
        }

    }

    Rectangle{
        width: tablebody.width
        height: 40
        anchors.top: tablebody.bottom
        anchors.left: tablebody.left
        border.color: "#ffffff"
        color: "#FFB90F"
        Row{
            anchors.centerIn: parent
            Text {
                width: 130
                height: 40
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 18
                text: qsTr("共8页，第1页")
            }
            Row{
                Button{
                    width: 90
                    height: 40
                    text: qsTr("Last")
                    enabled: false
                }
                Button{
                    width: 90
                    height: 40
                    text: qsTr("Next")
                }
            }
        }
    }

}
