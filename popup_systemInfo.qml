import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Window 2.12

Item {
    width: 941
    height: 637

//    property string menu_systemInfo_programVersion : "-"
//    property string menu_systemInfo_freeSpace_size : "68,024,164"


    BorderImage {
        id: borderImage
        anchors.fill: parent
        source: "images/menu_system_info.png"
    }

    Text {
                        id: text1
                        x: 441
                        y: 227
                        width: 305
                        height: 59
                        text: dataSource.systemInfo_programVersion // menu_systemInfo_programVersion
                        font.pixelSize: 26
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.bold: true
                    }

    Text {
                        id: text2
                        x: 441
                        y: 409
                        width: 264
                        height: 60
                        text: dataSource.systemInfo_freeSpace_size // menu_systemInfo_freeSpace_size
                        font.pixelSize: 26
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.bold: true
                    }
}
