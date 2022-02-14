import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Window 2.12

Item {
    width: 430
    height: 193
    x:-20
    y:-20

    signal yesorno_press_signal (int no)


    Rectangle {
        id: rectangle
        x: 0
        y: 0
        width: 430
        height: 193
        color: "#282828"
        radius: 10
        border.width: 0

        Rectangle {
            id: rectangle1
            x: 8
            y: 8
            width: 415
            height: 40
            color: "#0c1a1e"
            radius: 10

            Text {
                id: text_yesorno_title
                x: 8
                y: 8
                width: 399
                height: 28
                color: "#ffffff"
                text: qsTr("측정을 시작 할까요?")
                font.pixelSize: 21
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.weight: Font.Normal
                font.bold: true
            }
        }

        Rectangle {
            id: rectangle2
            x: 8
            y: 52
            width: 415
            height: 137
            color: "#0c1a1e"
            radius: 10
            Text {
                id: text_yesorno_sub_title
                x: 8
                y: 8
                width: 399
                height: 29
                color: "#c65b5b"
                text: qsTr("설정값을 저장하지 않았습니다.")
                font.pixelSize: 21
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                font.weight: Font.Normal
            }

            Button {
                id: button_yesorno_yes
                x: 55
                y: 75
                width: 115
                height: 40
                text: qsTr("예")
                font.pointSize: 21
                font.bold: true
                onClicked: {
                    yesorno_dialog.close()
                    yesorno_press_signal(1)
                }
            }

            Button {
                id: button_yesorno_no
                x: 241
                y: 75
                width: 115
                height: 40
                text: qsTr("아니요")
                font.pointSize: 21
                font.bold: true
                onClicked: {
                    yesorno_dialog.close()
                    yesorno_press_signal(0)
                }
            }
        }
    }

}
