import QtQuick 2.12
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.12
import Theme 1.0

TextField{
    text : "2020/01/01 00:00:00"
    inputMask: "9999/99/99 99:99:99"
    color: Theme.mainTextColor
    Material.theme: Material.Dark

}
