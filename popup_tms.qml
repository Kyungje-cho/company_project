import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Window 2.12

Item {
    width: 941
    height: 637
	
	property string menu_tms_data_toc_value :"11.111"
	property string menu_tms_data_ndir_value :"22.222"
	property string menu_tms_data_mfc_flowrate :"33.333"
	property string menu_tms_data_sample_volume :"44.444"
	property string menu_tms_data_zero_solution :"55.555"
	property string menu_tms_data_span_solution :"66.666"
	property string menu_tms_data_systemSlope_value :"77.777"
	property string menu_tms_data_systemIntercept_value : "88.8888"

	property string menu_tms_data_manualSlope_value : "1.0"
	property string menu_tms_data_manualIntercept_value: "0.0"		
    property string menu_tms_dat_maxToc_value: "225.0"
	property int    menu_tms_data_furnaceTemp:1202	
	
	property string menu_tms_output_4ma_value : "0.0"
	property string menu_tms_output_20ma_value : "225.0"
	property string menu_tms_output_mATest_value : "15.102"

    property bool   menu_tms_output_mATest_checked: false

    property string systemLog_start_date : "2020-02-10"
    property string systemLog_finish_date :"2020-02-15"

    signal keypad_setting_signal ( int title, int menu, int submenu, int value )
    signal password_setting_signal ( int tile, int menu )

    TabBar {
            id:popup_menu_tms_bar
                   width:parent.width
                   anchors.top: parent.top
                   anchors.left: parent.left

            TabButton {
                width: 150
                Rectangle
                {
                   anchors.fill: parent
                   color: popup_menu_tms_bar.currentIndex == 0 ? "green" : "gray"
                }
                Text{
                   anchors.fill: parent
                   text:qsTr("TOC DATA")
                   horizontalAlignment: Text.AlignHCenter
                   verticalAlignment: Text.AlignVCenter
                   font.bold: true
                   font.pointSize: popup_menu_tms_bar.currentIndex == 0 ? 20 : 10
                   color: "white"
                }
            }

            TabButton {
                width: 150
                Rectangle
                {
                   anchors.fill: parent
                   color: popup_menu_tms_bar.currentIndex == 1 ? "green" : "gray"
                }
                Text{
                   anchors.fill: parent
                   text:qsTr("OUTPUT")
                   horizontalAlignment: Text.AlignHCenter
                   verticalAlignment: Text.AlignVCenter
                   font.bold: true
                   font.pointSize: popup_menu_tms_bar.currentIndex == 1 ? 20 : 10
                   color: "white"
                }
            }

            TabButton {
                width: 150
                Rectangle
                {
                   anchors.fill: parent
                   color: popup_menu_tms_bar.currentIndex == 2 ? "green" : "gray"
                }
                Text{
                   anchors.fill: parent
                   text:qsTr("LOG")
                   horizontalAlignment: Text.AlignHCenter
                   verticalAlignment: Text.AlignVCenter
                   font.bold: true
                   font.pointSize: popup_menu_tms_bar.currentIndex == 2 ? 20 : 10
                   color: "white"
                }
            }
        }


	StackLayout {
        id: stackLayout_menu_tms
        x: 88
        y: 130
        width: parent.width
        height: parent.height - popup_menu_tms_bar.height
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        currentIndex: popup_menu_tms_bar.currentIndex
        anchors {
                    top:popup_menu_tms_bar.bottom
                    left: parent.left
                    right: parent.right
                    bottom: parent.bottom
        }


        Rectangle{
            id:stackLayout_menu_tms_data
            BorderImage {
                anchors.fill: parent
                source: "images/menu_tms_data.png"

                Text {
                    id: text1
                    x: 53
                    y: 86
                    width: 112
                    height: 58
                    text: menu_tms_data_toc_value
                    font.pixelSize: 26
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                }

                Text {
                    id: text2
                    x: 272
                    y: 85
                    width: 178
                    height: 59
                    text: menu_tms_data_ndir_value
                    font.pixelSize: 26
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                }

                Text {
                    id: text3
                    x: 491
                    y: 85
                    width: 114
                    height: 59
                    text: menu_tms_data_mfc_flowrate
                    font.pixelSize: 26
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                }

                Text {
                    id: text4
                    x: 710
                    y: 85
                    width: 112
                    height: 59
                    text: menu_tms_data_sample_volume
                    font.pixelSize: 26
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                }
				
				
				
				Text {
                    id: text5
                    x: 53
                    y: 238
                    width: 112
                    height: 59
                    text: menu_tms_data_zero_solution
                    font.pixelSize: 26
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                }

                Text {
                    id: text6
                    x: 272
                    y: 239
                    width: 113
                    height: 58
                    text: menu_tms_data_span_solution
                    font.pixelSize: 26
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                }

                Text {
                    id: text7
                    x: 491
                    y: 239
                    width: 175
                    height: 58
                    text: menu_tms_data_systemSlope_value
                    font.pixelSize: 26
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                }

                Text {
                    id: text8
                    x: 710
                    y: 239
                    width: 177
                    height: 58
                    text: menu_tms_data_systemIntercept_value
                    font.pixelSize: 26
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                }
				
				Button {
                    id: button1
                    x: 53
                    y: 391
                    width: 178
                    height: 59
                    text: menu_tms_data_manualSlope_value
                    font.pointSize: 20
                    font.bold: true
                    onClicked: {
                        keypad_setting_signal(5,0,2,0)
                        keypad_dialog.open()
                    }
                }
				
				
				Button {
                    id: button2
                    x: 272
                    y: 392
                    width: 178
                    height: 58
                    text: menu_tms_data_manualIntercept_value
                    font.pointSize: 20
                    font.bold: true
                    onClicked: {
                        keypad_setting_signal(5,0,3,0)
                        keypad_dialog.open()
                    }
                }
				
				Button {
                    id: button3
                    x: 491
                    y: 393
                    width: 121
                    height: 57
                    text: menu_tms_dat_maxToc_value
                    font.pointSize: 20
                    font.bold: true
                    onClicked: {
                        keypad_setting_signal(5,0,4,0)
                        keypad_dialog.open()
                    }
                }
				
				Text {
                    id: text9
                    x: 710
                    y: 391
                    width: 112
                    height: 53
                    text: menu_tms_data_furnaceTemp.toString()
                    font.pixelSize: 26
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                }
				
				
                Button {
                    id: button4
                    x: 737
                    y: 513
                    width: 165
                    height: 63
                    text: qsTr("저 장")
                    font.pointSize: 20
                    font.bold: true
                    onClicked: {
                        password_setting_signal(5,0)
                        password_check_dialog.open()
                    }
                }
            }
        }


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	
        Rectangle{
            id:stackLayout_menu_tms_output
            BorderImage {
                anchors.fill: parent
                source: "images/menu_tms_analog.png"

                Button {
                    id: button10
                    x: 412
                    y: 247
                    width: 145
                    height: 52
                    text: menu_tms_output_4ma_value
                    font.bold: true
                    font.pointSize: 20
                    onClicked: {
                        keypad_setting_signal(5,1,0,0)
                        keypad_dialog.open()
                    }
                }

                Button {
                    id: button11
                    x: 728
                    y: 247
                    width: 145
                    height: 52
                    text: menu_tms_output_20ma_value
                    font.pointSize: 20
                    font.bold: true
                    onClicked: {
                        keypad_setting_signal(5,1,1,0)
                        keypad_dialog.open()
                    }
                }

                Button {
                    id: button12
                    x: 674
                    y: 393
                    width: 205
                    height: 62
                    text: menu_tms_output_mATest_value
                    font.pointSize: 20
                    font.bold: true
                    onClicked: {
                        keypad_setting_signal(5,1,2,0)
                        keypad_dialog.open()
                    }
                }

                CheckBox {
                    id: menu_tms_output_mATest_checkBox
                    x: 250
                    y: 409
                    width: 300
                    height: 30
                    Text {
                        x:100
                        y:0
                        width:menu_tms_output_mATest_checkBox.width-menu_tms_output_mATest_checkBox_name.x
                        height: menu_tms_output_mATest_checkBox.height
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 20
                        font.bold: true
                        id: menu_tms_output_mATest_checkBox_name
                        text: qsTr("시험 출력")
                        color: "white"
                    }
                    checked: menu_tms_output_mATest_checked
                    onClicked: {
                        if ( menu_tms_output_mATest_checked == true )
                        {
                            menu_tms_output_mATest_checked = false
                        }
                        else
                        {
                            menu_tms_output_mATest_checked = true
                        }
                        keypad_setting_signal(5,1,3, menu_tms_output_mATest_checked)
                    }
                }

                Button {
                    id: button16
                    x: 735
                    y: 513
                    width: 166
                    height: 67
                    text: qsTr("저 장")
                    font.pointSize: 20
                    font.bold: true
                    onClicked:
                    {
                        password_setting_signal(5,1)
                        password_check_dialog.open()
                    }
                }

            }
        }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		
        Rectangle{
            id:stackLayout_menu_tms_systemLog
            BorderImage {
                anchors.fill: parent
                source: "images/menu_tms_log.png"
            }

            Button {
                        id: stackLayout_menu_tms_systemLog_startDate
                        x: 43
                        y: 532
                        width: 264
                        height: 57
                        text: systemLog_start_date //qsTr("2020-02-10")
                        font.pointSize: 24
                        font.bold: true
                        display: AbstractButton.TextBesideIcon
                        font.weight: Font.Bold
                        onClicked: {
                                dataSource.calendarPopup();
                        }
                    }


            Button {
                        id: stackLayout_menu_tms_systemLog_FinishDate
                        x: 332
                        y: 532
                        width: 255
                        height: 57
                        text: systemLog_finish_date //qsTr("2020-02-10")
                        font.pointSize: 24
                        font.bold: true
                        display: AbstractButton.TextBesideIcon
                        font.weight: Font.Bold
                        onClicked: {
                                dataSource.calendarPopup();
                        }
                    }


            Button {
                id: button27
                x: 735
                y: 513
                width: 166
                height: 67
                text: qsTr("USB 백업")
                font.pointSize: 20
                font.bold: true
                onClicked:
                {
                }
            }

        }


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    }



    Popup{
        id:password_check_dialog
        modal: true
        focus: true
        x:209
        y:64
        width:400 //430
        height:500 // 528
        closePolicy: Popup.NoAutoClose
        Loader{
            anchors.fill:parent
            source: "PasswordCheck.qml"
        }
    }

    Popup{
        id:keypad_dialog
        modal: true
        focus: true
        x:209
        y:64
        width:400 //430
        height:500 // 528
        closePolicy: Popup.NoAutoClose
        Loader{
            anchors.fill:parent
            source: "Keypad.qml"
        }
    }

}
