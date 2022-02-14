import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Window 2.12

Item {
    width: 941
    height: 637

    property int robot_move_range: 0

    property string menu_calibration_cal_point_name : "ZERO"
    property string menu_calibration_cal_repeat_no : "1"
    property string menu_calibration_cal_reference_value : "5.12"

    property string menu_calibration_cal_point_name_color: "#457b9d"
	
	
	property string menu_calibration_cal_slope_value : qsTr("0.0012456")
	property string menu_calibration_cal_intercept_value : qsTr("-1.2326584")
	property string menu_calibration_cal_zero_value : qsTr("10.0")
	property string menu_calibration_cal_span_value : qsTr("202.5")
	

    signal robot_move_range_signal ( int no )
	signal robot_setting_signal ( int method, int position, int action )
	/*
			method : 0 - program
			         1 - manual
			position:0 - furnace
			         1 - drain
			action : 0 - reading
			         1 - setting
	*/
	signal robot_position_increase_signal ( int axis, int step ) //x = 0, y = 1, z = 2
	signal robot_position_decrease_signal ( int axis, int step )

    TabBar {
        id:popup_menu_calibration_bar
        width:300
        anchors.top: parent.top
        anchors.left: parent.left

        TabButton{
            Rectangle
            {
                anchors.fill: parent
                color: popup_menu_calibration_bar.currentIndex == 0 ? "green" : "gray"
            }

            Text{
                anchors.fill: parent
                text:qsTr("CAL.")
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                font.pointSize: popup_menu_calibration_bar.currentIndex == 0 ? 20 : 10
                color: "white"
            }
        }
        TabButton{
            Rectangle
            {
                anchors.fill: parent
                color: popup_menu_calibration_bar.currentIndex == 1 ? "green" : "gray"
            }

            Text{
                anchors.fill: parent
                text:qsTr("ROBOT")
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                font.pointSize: popup_menu_calibration_bar.currentIndex == 1 ? 20 : 10
                color: "white"
            }
        }
    }

    Rectangle {
        id:popup_menu_calibration_tab_empty
        anchors.left: popup_menu_calibration_bar.right
        anchors.top: parent.top
        width:620
        height: 42
        BorderImage {
            id: borderImage
            anchors.fill: parent
            source: "images/popup_menu_calibration_tab_empty.png"
        }
    }

    StackLayout {
        id: stackLayout_menu_calibration
        width: parent.width
        height: parent.height-popup_menu_calibration_bar.height
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        currentIndex: popup_menu_calibration_bar.currentIndex

        anchors {
            top:popup_menu_calibration_bar.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }


        Rectangle {
            id:stackLayout_menu_calibration_cal

            BorderImage {
                id: borderImage_menu_calibration_cal
                anchors.fill: parent
                source: "images/menu_calibraion_cal.png"
            }

            Button {
                id: button_menu_calibration_cal_point_name
                x: 129
                y: 230
                width: 118
                height: 52
                onClicked: {
                    if ( menu_calibration_cal_point_name == "ZERO")
                    {
                        menu_calibration_cal_point_name = "SPAN"
                    }
                    else
                    {
                        menu_calibration_cal_point_name = "ZERO"
                    }
                }

                onPressed:{
                    menu_calibration_cal_point_name_color = "#2e549b"
                }
                onReleased:{
                    menu_calibration_cal_point_name_color = "#457b9d"
                }
                onCanceled:{
                    menu_calibration_cal_point_name_color = "#457b9d"
                }
                background: Rectangle{
                    color: menu_calibration_cal_point_name_color
                    radius: 2
                }
                Text{
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.pointSize: 18
                    font.bold: true
                    text:menu_calibration_cal_point_name
                    color: "white"
                }
            }

            Button {
                id: button_menu_calibration_cal_repeat
                x: 129
                y: 311
                width: 118
                height: 52
                text: menu_calibration_cal_repeat_no
                font.pixelSize: 18
                font.bold: true
                onClicked: {
                    keypad_dialog.open()
                }
            }

            Button {
                id: button_menu_calibration_cal_reference
                x: 129
                y: 392
                width: 118
                height: 52
                text: menu_calibration_cal_reference_value
                font.pixelSize: 18
                font.bold: true
                onClicked: {
                    keypad_dialog.open()
                }
            }

            Text {
                id: text_menu_calibration_cal_slope
                x: 515
                y: 416
                width: 153
                height: 49
                color: "#000000"
                text: menu_calibration_cal_slope_value //qsTr("0.0012456")
                font.pixelSize: 21
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                font.bold: true
            }

            Text {
                id: text_menu_calibration_cal_intercept
                x: 744
                y: 416
                width: 153
                height: 49
                color: "#000000"
                text: menu_calibration_cal_intercept_value //qsTr("-1.2326584")
                font.pixelSize: 21
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                font.bold: true
            }

	
            Text {
                id: text_menu_calibration_cal_zero_value
                x: 503
                y: 232
                width: 73
                height: 29
                color: "#ffffff"
                text: menu_calibration_cal_zero_value //qsTr("10.0")
                font.pixelSize: 19
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                font.bold: true
            }

	
            Text {
                id: text_menu_calibration_cal_span_value
                x: 750
                y: 232
                width: 72
                height: 29
                color: "#ffffff"
                text: menu_calibration_cal_span_value //qsTr("202.5")
                font.pixelSize: 19
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignTop
                font.bold: true
            }

            Button {
                id: button
                x: 738
                y: 516
                width: 161
                height: 61
                text: qsTr("저장및실행")
                font.pointSize: 20
                onClicked: {
					password_setting_signal(2,0)
                    password_check_dialog.open()
				}
            }

            Button {
                id: button1
                x: 538
                y: 516
                width: 161
                height: 61
                visible: false
                text: qsTr("저장")
                font.pointSize: 20
                onClicked: password_check_dialog.open()
            }

	
            ListModel{
                id:menu_calibration_cal_list_element
                ListElement{
                    no_index: "1"
                    zero_value: "0.0001"
                    span_value: "0.0010"
                }
                ListElement{
                    no_index: "2"
                    zero_value: "0.0002"
                    span_value: "0.0020"
                }
                ListElement{
                    no_index: "3"
                    zero_value: "0.0003"
                    span_value: "0.0030"
                }
                ListElement{
                    no_index: "4"
                    zero_value: "0.0004"
                    span_value: "0.0040"
                }
                ListElement{
                    no_index: "5"
                    zero_value: "0.0005"
                    span_value: "0.0050"
                }
            }

            ColumnLayout {
                id: columnLayout_menu_calibration_cal
                x: 336
                y: 260
                width: 560
                height: 150

                Repeater
                {
                    model:menu_calibration_cal_list_element
            RowLayout {
                id: rowLayout_menu_calibration_cal
                x: 336
                y: 266
                width: 560
                height: 26
                spacing: 13

                Text {
                    id: rowLayout_menu_calibration_cal_no
                    width: 73
                    height:rowLayout_menu_calibration_cal.height
                    Text{
                        anchors.fill: parent
                        color: "white"
                        text: no_index //qsTr("1")
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.weight: Font.Bold
                        font.bold: true
                        font.pointSize: 16
                    }
                }

                Text {
                    id: rowLayout_menu_calibration_cal_zero
                    width: 225
                    height:rowLayout_menu_calibration_cal.height
                    Text{
                        anchors.fill: parent
                        color: "white"
                        text: zero_value //qsTr("0.00000001")
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.weight: Font.Bold
                        font.bold: true
                        font.pointSize: 16
                    }
                }
                Text {
                    id: rowLayout_menu_calibration_cal_span
                    width: 225
                    height:rowLayout_menu_calibration_cal.height
                    Text{
                        anchors.fill: parent
                        color: "white"
                        text: span_value //qsTr("0.00000002")
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
        }


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

        Rectangle {
            id:stackLayout_menu_calibration_robot

            BorderImage {
                id: borderImage_menu_calibration_robot
                anchors.fill: parent
                source: "images/menu_calibration_robot.png"
            }

            Text {
                id: text1
                x: 340
                y: 260
                text: qsTr("이동 거리")
                font.pixelSize: 26
                font.bold: true
            }

            Button {
                id: button_menu_calibration_robot_set
                x: 102
                y: 386
                width: 147
                height: 64
                text: qsTr("설 정")
                font.bold: true
                font.pointSize: 20
				onClicked:{
					robot_setting_signal(0)
				}
            }

            CheckBox {
                id: checkBox_menu_calibration_robot_10mm
                x: 325
                y: 260+40
                checkState: robot_move_range == 0 ? Qt.Checked : Qt.Unchecked
                Text{
                    x: 39
                    y: 0
                    width: 110
                    height: 40
                    text: qsTr("10 mm")
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 20
                }
                onClicked: {
                    robot_move_range = 0
                    robot_move_range_signal(robot_move_range)
                }
            }

            CheckBox {
                id: checkBox_menu_calibration_robot_1mm
                x: 325
                y: 300+40
                checkState: robot_move_range == 1 ? Qt.Checked : Qt.Unchecked
                Text{
                    x: 39
                    y: 0
                    width: 110
                    height: 40
                    text: qsTr("1 mm")
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 20
                }
                onClicked: {
                    robot_move_range = 1
                    robot_move_range_signal(robot_move_range)
                }
            }

            CheckBox {
                id: checkBox_menu_calibration_robot_01mm
                x: 325
                y: 340+40
                checkState: robot_move_range == 2 ? Qt.Checked : Qt.Unchecked
                Text{
                    x: 39
                    y: 0
                    width: 110
                    height: 40
                    text: qsTr("0.1 mm")
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 20
                }
                onClicked: {
                    robot_move_range = 2
                    robot_move_range_signal(robot_move_range)
                }
            }

            CheckBox {
                id: checkBox_menu_calibration_robot_001mm
                x: 325
                y: 380+40
                checkState: robot_move_range == 3 ? Qt.Checked : Qt.Unchecked
                Text{
                    x: 39
                    y: 0
                    width: 110
                    height: 40
                    text: qsTr("0.01 mm")
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.pointSize: 20
                }
                onClicked: {
                    robot_move_range = 3
                    robot_move_range_signal(robot_move_range)
                }
            }

            Button {
                id: button_menu_calibration_robot_x_up
                x: 479
                y: 263
                width: 127
                height: 47
                text: qsTr("증 가")
                font.pointSize: 20
                font.bold: true
				onClicked:{
					robot_position_increase_signal(0,robot_move_range)
				}
            }

            Button {
                id: button_menu_calibration_robot_x_down
                x: 479
                y: 321
                width: 127
                height: 47
                text: qsTr("감 소")
                font.pointSize: 20
                font.bold: true
				onClicked:{
					robot_position_decrease_signal(0,robot_move_range)
				}
            }

            Button {
                id: button_menu_calibration_robot_y_up
                x: 621
                y: 263
                width: 127
                height: 47
                text: qsTr("증 가")
                font.pointSize: 20
                font.bold: true
				onClicked:{
					robot_position_increase_signal(1,robot_move_range)
				}
            }

            Button {
                id: button_menu_calibration_robot_y_down
                x: 621
                y: 321
                width: 127
                height: 47
                text: qsTr("감 소")
                font.pointSize: 20
                font.bold: true
				onClicked:{
					robot_position_decrease_signal(1,robot_move_range)
				}
            }

            Button {
                id: button_menu_calibration_robot_z_up
                x: 761
                y: 263
                width: 127
                height: 47
                text: qsTr("증 가")
                font.pointSize: 20
                font.bold: true
				onClicked:{
					robot_position_increase_signal(2,robot_move_range)
				}
            }

            Button {
                id: button_menu_calibration_robot_z_down
                x: 761
                y: 321
                width: 127
                height: 47
                text: qsTr("감 소")
                font.pointSize: 20
                font.bold: true
				onClicked:{
					robot_position_decrease_signal(2,robot_move_range)
				}
            }

            Button {
                id: button_menu_calibration_robot_reset
                x: 761
                y: 412
                width: 136
                height: 53
                text: qsTr("변경 취소")
                font.pointSize: 20
                font.bold: true
            }

            Button {
                id: button_menu_calibration_robot_save
                x: 734
                y: 512
                width: 168
                height: 67
                text: qsTr("저 장")
                font.pointSize: 20
                font.bold: true
				onClicked: {
					password_setting_signal(2,1)
                    password_check_dialog.open()
				}
            }

            Button {
                id: button_menu_calibration_robot_position
                x: 159
                y: 176
                width: 149
                height: 66
                text: qsTr("FURANCE")
                flat: false
                font.pointSize: 19
                font.bold: true
            }

            Button {
                id: button_menu_calibration_robot_method
                x: 159
                y: 279
                width: 149
                height: 66
                text: qsTr("Manual")
                font.pointSize: 19
                font.bold: true
                flat: false
            }

        }

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

    Popup{
        id:yesorno_dialog
        modal: true
        focus: true
        x:209
        y:200
        width:400 //430
        height:100 // 528
        closePolicy: Popup.NoAutoClose
        Loader{
            anchors.fill:parent
            source: "YesOrNo.qml"
        }
    }

}
