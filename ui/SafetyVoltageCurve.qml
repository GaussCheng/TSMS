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
        text: qsTr("Voltage Curve(v/min)")
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
    SplineSeries{
        id:spline
        name:qsTr("Voltage Curve(v/min)")
        color: "#B9DCA3"
        width:2
        axisX: ValueAxis{
            labelsColor: "#FFFFFF"
            labelsFont.pointSize: 9
            min: 0
            max: 1440
            labelFormat: "%d"
        }
        axisY: ValueAxis{
            labelsColor: "#FFFFFF"
            labelsFont.pointSize: 9
            min: 0
            max: 100
        }
        XYPoint { x: 1; y:66 }
        XYPoint { x: 100; y: 50.21 }
        XYPoint { x: 200; y: 55 }
        XYPoint { x: 300; y: 60 }
        XYPoint { x: 400; y: 40 }
        XYPoint { x: 500; y: 70 }
        XYPoint { x: 1440; y: 91 }

    }

}
