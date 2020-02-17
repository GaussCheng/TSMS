import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.VirtualKeyboard 2.4
//import QtQuick.Window 2.2
import QtQuick.Layouts 1.3
import Theme 1.0


ApplicationWindow {
    id: window
    visible: true
    width: 1024
    height: 768
    title: qsTr("TSMS")
    Rectangle{
        id:header
        width: parent.width
        height: 48
        color: Theme.headerColor
        Image {
            id: logo
            source: "images/logo.png"
            height: 46
            width: 46
            anchors.verticalCenter: parent.verticalCenter
        }
        Label{
            text: qsTr("TSMS")
            font.pointSize: 24
            color: Theme.mainTextColor
            anchors.left: logo.right
            anchors.leftMargin: 4
            anchors.verticalCenter: parent.verticalCenter
        }
        Label{
            id:timeShowLabel
            font.pointSize: 12
            color: Theme.mainTextColor
            anchors.right: parent.right
            anchors.rightMargin: 4
            anchors.verticalCenter: parent.verticalCenter
            Timer{
                running: true
                repeat: true
                interval: 1000
                onTriggered:{
                    var d = new Date();
                    timeShowLabel.text = d.getFullYear() + "-" + d.getMonth() + "-" + d.getDate() +"\n"
                            + d.getHours() + ":" + d.getMinutes() + ":" + d.getSeconds() ;
                }
            }
        }
        Label{
            id:subPageTitle
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 16
            color: Theme.mainTextColor
            text: stackView.children[stackView.currentIndex].pageTitle
        }
    }
    Rectangle{
        id: headerSplitLine
        height: 1
        width: parent.width
        color: Theme.splitLineColor
        anchors.top: header.bottom
    }

    Rectangle {
        id:menuContainer
        height: parent.height - header.height
        anchors.top: headerSplitLine.bottom
        width: 96
        color: Theme.menuBarColor
        ColumnLayout{
            property int btnFontSize: 10
            property int btnWidth: 64
            property int btnHeight: 64
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: 24
            y : 24
//            anchors.verticalCenter: parent.verticalCenter
            Button {
                id: monitorBtn
                text: qsTr("Monitor")
                font.pointSize: parent.btnFontSize
                display:AbstractButton.TextUnderIcon
                implicitWidth: parent.btnWidth
                implicitHeight:parent.btnHeight
                autoExclusive: true
                checkable: true
                checked: true
                onCheckedChanged: {
                    if(checked)
                        stackView.currentIndex = 0;
                }
            }
            Button{
                id: temperaturBtn
                text: qsTr("Temperature")
                font.pointSize: parent.btnFontSize
                display:AbstractButton.TextUnderIcon
                implicitWidth: parent.btnWidth
                implicitHeight:parent.btnHeight
                autoExclusive: true
                checkable: true
                onCheckedChanged: {
                    if(checked)
                        stackView.currentIndex = 1;
                }
            }
            Button{
                id: securityAnaBtn
                text: qsTr("Security Ana")
                font.pointSize: parent.btnFontSize
                display:AbstractButton.TextUnderIcon
                implicitWidth: parent.btnWidth
                implicitHeight:parent.btnHeight
                autoExclusive: true
                checkable: true


            }
            Button{
                id: dataQueryBtn
                text: qsTr("Data Query")
                font.pointSize: parent.btnFontSize
                display:AbstractButton.TextUnderIcon
                implicitWidth: parent.btnWidth
                implicitHeight:parent.btnHeight
                autoExclusive: true
                checkable: true
                onCheckedChanged: {
                    if(checked)
                        stackView.currentIndex = 3;
                }

            }
            Button{
                id: alarmBtn
                text: qsTr("Alarm")
                font.pointSize: parent.btnFontSize
                display:AbstractButton.TextUnderIcon
                implicitWidth: parent.btnWidth
                implicitHeight:parent.btnHeight
                autoExclusive: true
                checkable: true

            }
        }
    }
    Rectangle{
        id: menuBarSplitLine
        color: Theme.splitLineColor
        width: 1
        height: subPageContainer.height
        anchors.left: menuContainer.right
        anchors.top: menuContainer.top
    }

    Rectangle{
        id:subPageContainer
        anchors.left: menuBarSplitLine.right
        anchors.top: menuContainer.top
        width: parent.width - menuContainer.width
        height: parent.height - header.height
        color: Theme.mainColor



        StackLayout {
            id: stackView
            anchors.fill: parent
            Monitor{
                id: monitorPage
                width: stackView.width
                height: stackView.height
                property string pageTitle: qsTr("Monitor")
            }
            TemperatureDistribution{
                id:temperatureDistributionPage
                width: stackView.width
                height: stackView.height
                property string pageTitle: qsTr("Temp Distr")
            }
            Rectangle{
                id: securityAna
                width: stackView.width
                height: stackView.height
                property string pageTitle: qsTr("Security Ana")
            }

            DataQuery{
                id:dataQuery
                width: stackView.width
                height: stackView.height
                property string pageTitle: qsTr("Data Query")
            }
        }
    }

    InputPanel {
        id: inputPanel
        z: 99
        x: 0
        y: window.height
        width: window.width

        states: State {
            name: "visible"
            when: inputPanel.active
            PropertyChanges {
                target: inputPanel
                y: window.height - inputPanel.height
            }
        }
        transitions: Transition {
            from: ""
            to: "visible"
            reversible: true
            ParallelAnimation {
                NumberAnimation {
                    properties: "y"
                    duration: 250
                    easing.type: Easing.InOutQuad
                }
            }
        }
    }
}
