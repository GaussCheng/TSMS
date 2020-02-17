import QtQuick 2.4

DataQueryForm {
    onBatteryTypeIndexChanged: {
        if(batteryTypeIndex == 0)
        {
            batteryGroupStatusFrame.rowCount = 12;
            batteryGroupStatusFrame.colCount = 12;
        }
        else
        {
            batteryGroupStatusFrame.rowCount = 16;
            batteryGroupStatusFrame.colCount = 16;
        }
    }
}
