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
        text: qsTr("Temperature Change Rate(°C/min/min)")
        color: "#FFFFFF"
        y:12
        x:12
    }

//    theme: ChartView.ChartThemeBlueIcy
    backgroundRoundness: 0
    backgroundColor: "#194584"
    legend.visible: false
//    plotArea.x : 0
//    plotArea.y : 0
//    plotArea.width: width
//    plotArea.height: height
    LineSeries{
        id:liiLine
        name:qsTr("Temperature Change Rate")
        color: "#B9DCA3"
        width:2
        axisX: ValueAxis{
            labelsColor: "#FFFFFF"
            labelsFont.pointSize: 9
            min: 1
            max: 60
            labelFormat: "%d"
        }
        axisY: ValueAxis{
            labelsColor: "#FFFFFF"
            labelsFont.pointSize: 9

        }
        XYPoint { x: 1; y: 50.21 }
        XYPoint { x: 2; y: 55 }
        XYPoint { x: 3; y: 60 }
        XYPoint { x: 4; y: 40 }
        XYPoint { x: 5; y: 70 }
        XYPoint { x: 6; y: 80 }
        XYPoint { x: 60; y: 91 }

    }

}
