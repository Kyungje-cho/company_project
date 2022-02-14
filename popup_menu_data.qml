import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Window 2.12



Item {
    width: 941
    height: 637
	
	property string menu_data_start_date : "2020-02-10"
	property string menu_data_finish_date : "2020-02-11"

    BorderImage {
        id: borderImage_popup_menu_data
        anchors.fill: parent
        source: "images/menu_data.png"

        Component{
            id:popup_menu_data_delegate
            Item {
                id: popup_menu_data_delegate_wrapper
                width: parent.width
                height: 32

                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        listView_popup_menu_data.currentIndex = index
                        console.log("listview "+index) ;
                    }
                }

                RowLayout {
                    id: columnLayout_popup_menu_data
                    x: 2
                    //            y: 35
                    y:0
                    width: 890
                    height: 32
                    spacing: 10

                    Text {
                        width: 255
                        height:columnLayout_popup_menu_data.height
                        Text{
                            anchors.fill: parent
                            color: "white"
                            text: text_popup_menu_data_date //qsTr("2020-01-25 09:49:30")
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            font.weight: Font.Bold
                            font.bold: true
                            font.pointSize: 16
                        }
                    }

                    Text {
                        width: 203
                        height:columnLayout_popup_menu_data.height
                        Text{
                            anchors.fill: parent
                            color: "white"
                            text: text_popup_menu_data_toc
                            horizontalAlignment: Text.AlignRight
                            verticalAlignment: Text.AlignVCenter
                            font.weight: Font.Bold
                            font.bold: true
                            font.pointSize: 16
                        }
                    }

                    Text {
                        width: 203
                        height:columnLayout_popup_menu_data.height
                        Text{
                            anchors.fill: parent
                            color: "white"
                            text:  text_popup_menu_data_ndir
                            horizontalAlignment: Text.AlignRight
                            verticalAlignment: Text.AlignVCenter
                            font.weight: Font.Bold
                            font.bold: true
                            font.pointSize: 16
                        }
                    }

                    Text {
                        width: 160
                        height:columnLayout_popup_menu_data.height
                        Text{
                            anchors.fill: parent
                            color: "white"
                            text: text_popup_menu_data_etc
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            font.weight: Font.Bold
                            font.bold: true
                            font.pointSize: 16
                        }
                    }
                }
            }
        }



        ListView{
            id:listView_popup_menu_data
            objectName: "listView_popup_menu_data"
            x: 17
            y: 36
            width: 900 // 912
            height: 520
            keyNavigationWraps: false
            snapMode: ListView.NoSnap
            synchronousDrag: true
            interactive: true
            delegate: popup_menu_data_delegate
            model: popup_menu_data_model
            focus: true
            clip: true
            highlightRangeMode: ListView.NoHighlightRange
            highlight: Rectangle {
                color:"lightblue"
            }
            highlightMoveDuration: 0

            ScrollBar.vertical: ScrollBar{
                width: 18
                anchors.right: listView_popup_menu_data.right
                active: true
                wheelEnabled: true
                enabled: true
                height: listView_popup_menu_data.height
            }
        }

        Button {
            id: button_popup_menu_data_usb
            x: 742
            y: 580
            width: 185
            height: 57
            text: qsTr("USB")
            font.pointSize: 24
            font.bold: true
            display: AbstractButton.TextBesideIcon
            font.weight: Font.Bold
            onClicked: {
                    dataSource.usbBackupViewlistdata();
            }
        }

        Button {
            id: button_popup_menu_data_date
            x: 17
            y: 580
            width: 185
            height: 57
            text: menu_data_start_date //qsTr("2020-02-10")
            font.pointSize: 24
            font.bold: true
            display: AbstractButton.TextBesideIcon
            font.weight: Font.Bold
            onClicked: {
                    dataSource.calendarPopup();
            }
        }
    }
}
