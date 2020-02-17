import QtQuick 2.12
import QtCharts 2.3
import QtQuick.Controls 2.3
import Theme 1.0

ChartView{
    antialiasing: true
    margins.left: 2
    margins.top: 16
    margins.right: 4
    margins.bottom: 2
    property int batteryType: 0
    Text{
        id:titleText
        text: qsTr("Battery Module Sate Rate")
        color: Theme.mainTextColor
        y:12
        x:12
    }
//    Row{
//        spacing: 5
//        anchors.right: parent.right
//        anchors.rightMargin: 16
//        anchors.top: titleText.top
//        Label{
//            color: liiBar.color
//            text: liiBar.label
//        }
//    }

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
            labelsColor: Theme.mainTextColor
            labelsFont.pointSize: 9
//            categories: [["1", "2", "3", "4",
//                          "5", "6", "7", "8",
//                          "9", "10", "11", "12"],
//                ["1", "2", "3", "4",
//                 "5", "6", "7", "8",
//                 "9", "10", "11", "12",
//                 "13", "14", "15", "16"]][batteryType]
            categories: ["1", "2", "3", "4",
                          "5", "6", "7", "8",
                          "9", "10", "11", "12"]
        }
        axisY: ValueAxis{
            labelsColor: Theme.mainTextColor
            labelsFont.pointSize: 9
        }

        BarSet{
            id:liiBar
            label: qsTr("Lithium iron")
            values: [0.5, 0.9, 0.4, 0.7,0.9]
            color: "#B9DCA3"
        }
    }
}
