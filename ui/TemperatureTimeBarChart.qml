import QtQuick 2.12
import QtCharts 2.3
import QtQuick.Controls 2.3

ChartView{
    antialiasing: true
    margins.left: 2
    margins.top: 16
    margins.right: 4
    margins.bottom: 2
    Text{
        id:titleText
        text: qsTr("Max Temperature(°C/t)")
        color: "#FFFFFF"
        y:12
        x:12
    }
    Row{
        spacing: 5
        anchors.right: parent.right
        anchors.rightMargin: 16
        anchors.top: titleText.top
        Label{
            color: liiBar.color
            text: liiBar.label
        }
        Label{
            color: triBar.color
            text: triBar.label
        }
    }

//    theme: ChartView.ChartThemeBlueIcy
    backgroundRoundness: 0
    backgroundColor: "#194584"
    legend.visible: false
//    plotArea.x : 0
//    plotArea.y : 0
//    plotArea.width: width
//    plotArea.height: height
    BarSeries{
        axisX: BarCategoryAxis{
            labelsColor: "#FFFFFF"
            labelsFont.pointSize: 9
            categories: ["1", "2", "3", "4",
                                            "5", "6", "7", "8",
                                            "9", "10", "11", "12",
                                            "13", "14", "15", "16",
                                            "17", "18", "19", "20",
                                            "21", "22", "23", "24"]}
        axisY: ValueAxis{
            labelsColor: "#FFFFFF"
            labelsFont.pointSize: 9
        }

        BarSet{
            id:liiBar
            label: qsTr("Lithium iron")
            values: [10.00, 20, 30, 40,70]
            color: "#B9DCA3"
        }
        BarSet{
            id:triBar
            label: qsTr("Tri-battery")
            values: [50, 40, 30]
            color: "#E9681B"
        }
    }
}
