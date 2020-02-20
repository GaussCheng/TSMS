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
        text: qsTr("Module Safety Factor Change(a/min)")
        color: "#FFFFFF"
        y:12
        x:12
    }

    backgroundRoundness: 0
    backgroundColor: "#194584"
    legend.visible: false
    BarSeries{
        id: barSeries
        axisX: BarCategoryAxis{
            labelsColor: "#FFFFFF"
            labelsFont.pointSize: 9
            categories: ["1#", "2#", "3#", "4#", "5#", "6#", "7#", "8#","9#", "10#", "11#", "12#"]}
        axisY: ValueAxis{
            labelsColor: "#FFFFFF"
            labelsFont.pointSize: 9
        }
        BarSet {label:"Bob";values:[2,2,3,4,5,6,2,3,8,9,8,1]}
    }

}
