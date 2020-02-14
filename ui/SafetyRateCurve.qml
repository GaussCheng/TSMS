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
        text: qsTr("Safety Rate(%/t)")
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
            color: liiLine.color
            text: liiLine.name
        }
        Label{
            color: triLine.color
            text: triLine.name
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
    LineSeries{
        id:liiLine
        name:qsTr("Lithium iron")
        color: "#B9DCA3"
        width:4
        axisX: ValueAxis{
            labelsColor: "#FFFFFF"
            labelsFont.pointSize: 9
            min: 1
            max: 24
            tickInterval: 1
            tickCount: 24
            tickType: ValueAxis.TicksFixed
            labelFormat: "%d"
        }
        axisY: ValueAxis{
            labelsColor: "#FFFFFF"
            labelsFont.pointSize: 9

        }
        XYPoint { x: 1; y: 50 }
        XYPoint { x: 2; y: 55 }
        XYPoint { x: 3; y: 60 }
        XYPoint { x: 4; y: 40 }
        XYPoint { x: 5; y: 70 }
        XYPoint { x: 6; y: 80 }
        XYPoint { x: 7; y: 91 }

    }
    LineSeries{
        id:triLine
        name:qsTr("Tri-battery")
        color: "#E9681B"
        width: 4
        XYPoint { x: 1; y: 30 }
        XYPoint { x: 2; y: 35 }
        XYPoint { x: 3; y: 40 }
        XYPoint { x: 4; y: 50 }
        XYPoint { x: 5; y: 70 }
        XYPoint { x: 6; y: 91 }
        XYPoint { x: 7; y: 23 }
    }
}
