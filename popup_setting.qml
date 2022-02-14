import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Window 2.12
/*
  title = 메인화면[0], 데이터[1], 교정 실행[2], 운전 확인[3], 분석 설정[4], 자료 전송[5]
  menu = 메인화면[0] : 없음.
         데이터[1]   : 없음.
         교정 실행[2]: cal : 교정포이트[0](0:zero, 1:span), 반복횟수[1](1~5), 기준용액[2](keypad)
                    robot : 미정
         운전 확인[3]: robot arm[0], syringe[1], sonic[2], sample pump[3], sample valve[4], furnace valve[5], air valve[6], di valve[7], overflow valve[8], drain valve[9], hcl valve[10], reset[11]
         분석 설정[4]: total[0]     : 분석주기[0], 분석모드[1]
                      sampling[1] : 샘플링 린스[0](keypad), 샘플링[1](keypad), 시약주입[2](keypad),에어&소닉[3](keypad),안정화[4](keypad),only sonic[5](keypad,x)
                      furnace[2]  : 니를 린스[0](keypad),  샘플주입양[1](keypad,double), 분할주입[2](keypad,x), 주입속도[3](keypad), 에어 유속[4](keypad,double), 주입간격[5](keypad,x)
                      cleaning[3] : 샘플클리닝 횟수[0](keypad), 에어주입[1](keypad,x), HCL[2](keypad,x), sonic[3](keypad,x)
                                   DI 클리링 횟수[4](keypad), Cleaning[5](keypad), HCL[6](keypad), Sonic[7](keypad)
                                   가열로 클리닝 횟수[8](keypad), 에어 유속[9](keypad, double), 주입 횟수[10](keypad), 딜레이[11](keypad)
         자료 전송[5] : TOC data[0] : 교정 기울기[0](keypad,double), 교정 절편[1](keypad,double), 보정 기울기[2](keypad,double), 보정 절편[3](keypad,double), 측정범위[4](Keypad,double)
                         output[1] : 아날로그 출력 4mA[5](keypad,double), 아날로그 출력 20mA[6](keypad,double), 출력 확인[7](keypad,double)
  */


Item {
    width: 941
    height: 637

    signal keypad_setting_signal ( int title, int menu, int submenu, int value )
    signal password_setting_signal ( int tile, int menu )

    property int    menu_setting_total_glassRince_no: 3
    property string menu_setting_total_sampleInjection_volume: "0.51"
    property int    menu_setting_total_measurementNo: 1
    property int    menu_setting_total_sampleClean_no: 0
    property int    menu_setting_total_DIClean_no: 2
    property int    menu_setting_total_FurnaceClean_no: 4
    property int    menu_setting_total_measurementPeriod: 15
    property string menu_setting_total_measurementMode: "AUTO"
    property int    menu_setting_total_sampleChannel_no: 1
    property int    menu_setting_total_measurementTime: 285

    property int    menu_setting_total_measurementMode_no: 0
	
	property int    menu_setting_sampling_samplingRince_no: 3
    property int    menu_setting_sampling_sampling_time: 14
    property int    menu_setting_sampling_injection_time: 10
    property int    menu_setting_sampling_airAndSonic_time: 70
    property int    menu_setting_sampling_stability_time: 21
    property int    menu_setting_sampling_onlySonic_time: 0
	
	property int    menu_setting_furnace_niddleRince_no: 3
    property string menu_setting_furnace_sampleInjection_volume: "0.51"
    property int    menu_setting_furnace_partitionInjection_no: 1
    property int    menu_setting_furnace_injectionSpeed: 7
    property string menu_setting_furnace_airFlowRate: "8.0"
    property int    menu_setting_furnace_injectionInterval: 1
	
	property int    menu_setting_cleaning_sampleCleaning_no: 0
	property int    menu_setting_cleaning_sampleCleaningAirInjection_time: 0
	property int    menu_setting_cleaning_sampleCleaningHcl_time: 0
	property int    menu_setting_cleaning_sampleCleaningSonic_time: 0
	
	property int    menu_setting_cleaning_DICleaning_no: 2
	property int    menu_setting_cleaning_DICleaningCleaning_time: 16
	property int    menu_setting_cleaning_DICleaningHcl_time: 1
	property int    menu_setting_cleaning_DICleaningSonic_time: 29
	
	property int    menu_setting_cleaning_furnaceCleaning_no: 1
    property string menu_setting_cleaning_furnaceCleaningAirFlowRate: "60.0"
	property int    menu_setting_cleaning_furnaceCleaningInjection_no: 1
	property int    menu_setting_cleaning_furnaceCleaningDelay_time: 2

    TabBar {
        id:popup_menu_setting_bar
               width:parent.width
               anchors.top: parent.top
               anchors.left: parent.left

        TabButton {
            width: 150
            Rectangle
            {
               anchors.fill: parent
               color: popup_menu_setting_bar.currentIndex == 0 ? "green" : "gray"
            }
            Text{
               anchors.fill: parent
               text:qsTr("TOTAL")
               horizontalAlignment: Text.AlignHCenter
               verticalAlignment: Text.AlignVCenter
               font.bold: true
               font.pointSize: popup_menu_setting_bar.currentIndex == 0 ? 20 : 10
               color: "white"
            }
        }

        TabButton {
            width: 150
            Rectangle
            {
               anchors.fill: parent
               color: popup_menu_setting_bar.currentIndex == 1 ? "green" : "gray"
            }
            Text{
               anchors.fill: parent
               text:qsTr("SAMPLING")
               horizontalAlignment: Text.AlignHCenter
               verticalAlignment: Text.AlignVCenter
               font.bold: true
               font.pointSize: popup_menu_setting_bar.currentIndex == 1 ? 20 : 10
               color: "white"
            }
        }

        TabButton {
            width: 150
            Rectangle
            {
               anchors.fill: parent
               color: popup_menu_setting_bar.currentIndex == 2 ? "green" : "gray"
            }
            Text{
               anchors.fill: parent
               text:qsTr("FURNACE")
               horizontalAlignment: Text.AlignHCenter
               verticalAlignment: Text.AlignVCenter
               font.bold: true
               font.pointSize: popup_menu_setting_bar.currentIndex == 2 ? 20 : 10
               color: "white"
            }
        }

        TabButton {
            width: 150
            Rectangle
            {
               anchors.fill: parent
               color: popup_menu_setting_bar.currentIndex == 3 ? "green" : "gray"
            }
            Text{
               anchors.fill: parent
               text:qsTr("CLEANING")
               horizontalAlignment: Text.AlignHCenter
               verticalAlignment: Text.AlignVCenter
               font.bold: true
               font.pointSize: popup_menu_setting_bar.currentIndex == 3 ? 20 : 10
               color: "white"
            }
        }
    }



    StackLayout {
        id: stackLayout_menu_setting
        x: 88
        y: 130
        width: parent.width
        height: parent.height - popup_menu_setting_bar.height
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        currentIndex: popup_menu_setting_bar.currentIndex
        anchors {
                    top:popup_menu_setting_bar.bottom
                    left: parent.left
                    right: parent.right
                    bottom: parent.bottom
        }


        Rectangle{
            id:stackLayout_menu_setting_total
            BorderImage {
                anchors.fill: parent
                source: "images/menu_setting_total.png"

                Text {
                    id: text1
                    x: 38
                    y: 247
                    width: 134
                    height: 63
                    text: menu_setting_total_glassRince_no.toString()+" 회"
                    font.pixelSize: 26
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                }

                Text {
                    id: text2
                    x: 183
                    y: 247
                    width: 134
                    height: 63
                    text: menu_setting_total_sampleInjection_volume.toString() +" ml"
                    font.pixelSize: 26
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                }

                Text {
                    id: text3
                    x: 326
                    y: 247
                    width: 134
                    height: 63
                    text: menu_setting_total_measurementNo.toString() +" 회"
                    font.pixelSize: 26
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                }

                Text {
                    id: text4
                    x: 471
                    y: 247
                    width: 134
                    height: 63
                    text: menu_setting_total_sampleClean_no.toString() +" 회"
                    font.pixelSize: 26
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                }

                Text {
                    id: text5
                    x: 616
                    y: 247
                    width: 134
                    height: 63
                    text: menu_setting_total_DIClean_no.toString() +" 회"
                    font.pixelSize: 26
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                }

                Text {
                    id: text6
                    x: 760
                    y: 247
                    width: 134
                    height: 63
                    text: menu_setting_total_FurnaceClean_no.toString() + " 회"
                    font.pixelSize: 26
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                }

                Button {
                    id: button2
                    x: 253
                    y: 103
                    width: 144
                    height: 44
                    text: menu_setting_total_measurementPeriod.toString()
                    font.bold: true
                    font.pointSize: 18
                    onClicked: {
                        switch (menu_setting_total_measurementPeriod)
                        {
                        case 15 :
                            menu_setting_total_measurementPeriod = 30
                            break ;

                        case 30 :
                            menu_setting_total_measurementPeriod = 60
                            break

                        default :
                            menu_setting_total_measurementPeriod = 15
                        }
                        keypad_setting_signal(4,0,0,menu_setting_total_measurementPeriod)
                    }
                }

                Button {
                    id: button
                    x: 72
                    y: 398
                    width: 150
                    height: 53
                    text: menu_setting_total_measurementMode
                    font.bold: true
                    font.pointSize: 18
                    onClicked: {
                        if ( menu_setting_total_measurementMode_no == 0 )
                        {
                            menu_setting_total_measurementMode_no = 1 ;
                            menu_setting_total_measurementMode = "MANUAL"
                        }
                        else
                        {
                            menu_setting_total_measurementMode_no = 0 ;
                            menu_setting_total_measurementMode = "AUTO"
                        }
                        keypad_setting_signal(4,0,1,menu_setting_total_measurementMode_no)
                    }
                }

                Text {
                    id: text8
                    x: 368
                    y: 400
                    width: 134
                    height: 53
                    text: "CH." + menu_setting_total_sampleChannel_no.toString()
                    font.pixelSize: 26
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                }

                Text {
                    id: text9
                    x: 663
                    y: 400
                    width: 134
                    height: 53
                    text: menu_setting_total_measurementTime.toString()
                    font.pixelSize: 26
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                }

                Button {
                    id: button1
                    x: 737
                    y: 513
                    width: 165
                    height: 63
                    text: qsTr("저 장")
                    font.pointSize: 20
                    font.bold: true
                    onClicked: {
                        password_setting_signal(4,0)
                        password_check_dialog.open()
                    }
                }
            }
        }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

        Rectangle{
            id:stackLayout_menu_setting_sampling
            BorderImage {
                anchors.fill: parent
                source: "images/menu_setting_sampling.png"

                Button {
                    id: button10
                    x: 115
                    y: 250
                    width: 145
                    height: 52
                    text: menu_setting_sampling_samplingRince_no.toString()
                    font.bold: true
                    font.pointSize: 20
                    onClicked: {
                        keypad_setting_signal(4,1,0,0)
                        keypad_dialog.open()
						keypad_popup.keypad_old_value_function(menu_setting_sampling_samplingRince_no)
                    }
                }

                Button {
                    id: button11
                    x: 406
                    y: 250
                    width: 145
                    height: 52
                    text: menu_setting_sampling_sampling_time.toString()
                    font.pointSize: 20
                    font.bold: true
                    onClicked: {
                        keypad_setting_signal(4,1,1,0)
                        keypad_dialog.open()
                    }
                }

                Button {
                    id: button12
                    x: 699
                    y: 250
                    width: 145
                    height: 52
                    text: menu_setting_sampling_injection_time.toString()
                    font.pointSize: 20
                    font.bold: true
                    onClicked: {
                        keypad_setting_signal(4,1,2,0)
                        keypad_dialog.open()
                    }
                }

                Button {
                    id: button13
                    x: 115
                    y: 402
                    width: 145
                    height: 52
                    text: menu_setting_sampling_airAndSonic_time.toString()
                    font.pointSize: 20
                    font.bold: true
                    onClicked: {
                        keypad_setting_signal(4,1,3,0)
                        keypad_dialog.open()
                    }
                }

                Button {
                    id: button14
                    x: 406
                    y: 402
                    width: 145
                    height: 52
                    text: menu_setting_sampling_stability_time.toString()
                    font.pointSize: 20
                    font.bold: true
                    onClicked: {
                        keypad_setting_signal(4,1,4,0)
                        keypad_dialog.open()
                    }
                }

                Button {
                    id: button15
                    x: 699
                    y: 402
                    width: 145
                    height: 52
                    text: menu_setting_sampling_onlySonic_time.toString()
                    enabled: false
                    font.pointSize: 20
                    font.bold: true
                    onClicked: {
                        keypad_setting_signal(4,1,5,0)
                        keypad_dialog.open()
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
                        password_setting_signal(4,1)
                        password_check_dialog.open()
                    }
                }
            }
        }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		
        Rectangle{
            id:stackLayout_menu_setting_furnace
            BorderImage {
                anchors.fill: parent
                source: "images/menu_setting_furnace.png"

                Button {
                    id: button21
                    x: 115
                    y: 251
                    width: 146
                    height: 50
                    text: menu_setting_furnace_niddleRince_no.toString()
                    font.pointSize: 20
                    font.bold: true
					onClicked: {
                        keypad_setting_signal(4,2,0,0)
                        keypad_dialog.open()
                    }
                }

                Button {
                    id: button22
                    x: 406
                    y: 251
                    width: 146
                    height: 50
                    text: menu_setting_furnace_sampleInjection_volume
                    font.pointSize: 20
                    font.bold: true
					onClicked: {
                        keypad_setting_signal(4,2,1,0)
                        keypad_dialog.open()
                    }
                }

                Button {
                    id: button23
                    x: 698
                    y: 251
                    width: 146
                    height: 50
                    enabled: false
                    text: menu_setting_furnace_partitionInjection_no.toString()
                    font.pointSize: 20
                    font.bold: true
					onClicked: {
                        keypad_setting_signal(4,2,2,0)
                        keypad_dialog.open()
                    }
                }

                Button {
                    id: button24
                    x: 115
                    y: 401
                    width: 146
                    height: 50
                    text: menu_setting_furnace_injectionSpeed.toString()
                    font.pointSize: 20
                    font.bold: true
					onClicked: {
                        keypad_setting_signal(4,2,3,0)
                        keypad_dialog.open()
                    }
                }

                Button {
                    id: button25
                    x: 406
                    y: 401
                    width: 146
                    height: 50
                    text: menu_setting_furnace_airFlowRate
                    font.pointSize: 20
                    font.bold: true
					onClicked: {
                        keypad_setting_signal(4,2,4,0)
                        keypad_dialog.open()
                    }
                }

                Button {
                    id: button26
                    x: 698
                    y: 401
                    width: 146
                    height: 50
                    enabled: false
                    text: menu_setting_furnace_injectionInterval.toString()
                    font.pointSize: 20
                    font.bold: true
					onClicked: {
                        keypad_setting_signal(4,2,5,0)
                        keypad_dialog.open()
                    }
                }
				
				Button {
                    id: button27
                    x: 735
                    y: 513
                    width: 166
                    height: 67
                    text: qsTr("저 장")
                    font.pointSize: 20
                    font.bold: true
                    onClicked:
                    {
                        password_setting_signal(4,2)
                        password_check_dialog.open()
                    }
                }
            }
        }

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


        Rectangle{
            id:stackLayout_menu_setting_cleaning
            BorderImage {
                anchors.fill: parent
                source: "images/menu_setting_cleaning.png"

                Button {
                    id: button30
                    x: 96
                    y: 232
                    width: 165
                    height: 46
                    text: menu_setting_cleaning_sampleCleaning_no.toString()
                    font.bold: true
                    font.pointSize: 20
					onClicked: {
                        keypad_setting_signal(4,3,0,0)
                        keypad_dialog.open()
                    }
                }

                Button {
                    id: button31
                    x: 152
                    y: 291
                    width: 109
                    height: 46
                    enabled: false
                    text: menu_setting_cleaning_sampleCleaningAirInjection_time.toString()
                    font.pointSize: 20
                    font.bold: true
					onClicked: {
                        keypad_setting_signal(4,3,1,0)
                        keypad_dialog.open()
                    }
                }

                Button {
                    id: button32
                    x: 152
                    y: 350
                    width: 109
                    height: 46
                    enabled: false
                    text: menu_setting_cleaning_sampleCleaningHcl_time.toString()
                    font.pointSize: 20
                    font.bold: true
					onClicked: {
                        keypad_setting_signal(4,3,2,0)
                        keypad_dialog.open()
                    }
                }

                Button {
                    id: button33
                    x: 152
                    y: 408
                    width: 109
                    height: 46
                    enabled: false
                    text: menu_setting_cleaning_sampleCleaningSonic_time.toString()
                    font.pointSize: 20
                    font.bold: true
					onClicked: {
                        keypad_setting_signal(4,3,3,0)
                        keypad_dialog.open()
                    }
                }

                Button {
                    id: button34
                    x: 388
                    y: 232
                    width: 165
                    height: 46
                    text: menu_setting_cleaning_DICleaning_no.toString()
                    font.pointSize: 20
                    font.bold: true
					onClicked: {
                        keypad_setting_signal(4,3,4,0)
                        keypad_dialog.open()
                    }
                }

                Button {
                    id: button35
                    x: 444
                    y: 291
                    width: 109
                    height: 46
                    text: menu_setting_cleaning_DICleaningCleaning_time.toString()
                    font.pointSize: 20
                    font.bold: true
					onClicked: {
                        keypad_setting_signal(4,3,5,0)
                        keypad_dialog.open()
                    }
                }

                Button {
                    id: button36
                    x: 444
                    y: 350
                    width: 109
                    height: 46
                    text: menu_setting_cleaning_DICleaningHcl_time.toString()
                    font.pointSize: 20
                    font.bold: true
					onClicked: {
                        keypad_setting_signal(4,3,6,0)
                        keypad_dialog.open()
                    }
                }

                Button {
                    id: button37
                    x: 444
                    y: 408
                    width: 109
                    height: 46
                    text: menu_setting_cleaning_DICleaningSonic_time.toString()
                    font.pointSize: 20
                    font.bold: true
					onClicked: {
                        keypad_setting_signal(4,3,7,0)
                        keypad_dialog.open()
                    }
                }

                Button {
                    id: button38
                    x: 686
                    y: 232
                    width: 165
                    height: 46
                    text: menu_setting_cleaning_furnaceCleaning_no.toString()
                    font.pointSize: 20
                    font.bold: true
					onClicked: {
                        keypad_setting_signal(4,3,8,0)
                        keypad_dialog.open()
                    }
                }

                Button {
                    id: button39
                    x: 742
                    y: 291
                    width: 109
                    height: 46
                    text: menu_setting_cleaning_furnaceCleaningAirFlowRate
                    font.pointSize: 20
                    font.bold: true
					onClicked: {
                        keypad_setting_signal(4,3,9,0)
                        keypad_dialog.open()
                    }
                }

                Button {
                    id: button3a
                    x: 742
                    y: 350
                    width: 109
                    height: 46
                    text: menu_setting_cleaning_furnaceCleaningInjection_no.toString()
                    enabled: false
                    font.pointSize: 20
                    font.bold: true
					onClicked: {
                        keypad_setting_signal(4,3,10,0)
                        keypad_dialog.open()
                    }
                }

                Button {
                    id: button3b
                    x: 742
                    y: 408
                    width: 109
                    height: 46
                    text: menu_setting_cleaning_furnaceCleaningDelay_time.toString()
                    enabled: false
                    font.pointSize: 20
                    font.bold: true
					onClicked: {
                        keypad_setting_signal(4,3,11,0)
                        keypad_dialog.open()
                    }
                }
				
				Button {
                    id: button3c
                    x: 735
                    y: 513
                    width: 166
                    height: 67
                    text: qsTr("저 장")
                    font.pointSize: 20
                    font.bold: true
                    onClicked:
                    {
                        password_setting_signal(4,3)
                        password_check_dialog.open()
                    }
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


