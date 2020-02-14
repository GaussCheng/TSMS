import QtQuick 2.12
import QtCharts 2.3
import QtQuick.Controls 2.3

ChartView{
    antialiasing: true
    margins.left: 0
    margins.top: 16
    margins.right: 2
    margins.bottom: 2
    Text{
        id:titleText
        text: qsTr("t/10kWh")
        color: "#FFFFFF"
        y:12
        x:12
//        visible: false
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
    HorizontalBarSeries{
        axisY: BarCategoryAxis{
            labelsColor: "#FFFFFF"
            labelsFont.pointSize: 5
            labelsAngle: 90
            categories: ["1", "2", "3", "4",
                                            "5", "6", "7", "8",
                                            "9", "10", "11", "12",
                                            "13", "14", "15", "16",
                                            "17", "18", "19", "20",
                                            "21", "22", "23", "24"]}
        axisX: ValueAxis{
            labelsColor: "#FFFFFF"
            labelsFont.pointSize: 9
            labelFormat: "%.2f"
            tickType:ValueAxis.TicksFixed
            min: -100
            max:100
        }

        BarSet{
            id:liiBar
            label: qsTr("Charge")
            values: [0, 10, 20, 30, 40,70]
            color: "#B9DCA3"
        }
        BarSet{
            id:triBar
            label: qsTr("Discharge")
            values: [0, -50, -40, -30,60]
            color: "#E9681B"
        }
    }
}
