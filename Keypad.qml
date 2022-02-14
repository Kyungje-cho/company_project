import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Window 2.12

Item {
	id:keypad_popup
    width: 430
    height: 545
    x:-20
    y:-20

    property int 		button_gap: 20
	
	
	property string 	keypad_title_name : qsTr("Zero 시약")
    property string 	keypad_old_value: "---"
    property string 	keypad_new_value: "---"
    property int 		keypad_mode: 0
	
	property int 		keypad_new_value_length : 0
	
	
	function keypad_press_add_function ( no )
	{
		if ( keypad_new_value_length == 0 )
		{
			keypad_new_value = no
		}
		else
		{
			keypad_new_value = keypad_new_value + no
		}
		keypad_new_value_length++
	}
	
	function keypad_press_delete_function ()
	{
		if ( keypad_new_value_length < 2 )
		{
			keypad_new_value_length = 0 ;
			keypad_new_value = "---"
		}
		else
		{
			keypad_new_value_length--
			keypad_new_value = keypad_new_value.substr(0,keypad_new_value_length)
		}
	}
	
	
	function keypad_press_minus_function ()
	{
		if ( keypad_new_value_length == 0 )
		{
			keypad_new_value_length = 1 ;
			keypad_new_value = "-"
		}
		else
		{
			if ( keypad_new_value[0] == "-" )
			{
				keypad_new_value_length--
				keypad_new_value = keypad_new_value.substr(1,keypad_new_value_length)
			}
			else
			{
				keypad_new_value = "-" + keypad_new_value.substr(0,keypad_new_value_length)
				keypad_new_value_length++ ;
			}
		}
	}
	

    function keypad_old_value_function ( s )
    {
        keypad_old_value = s
    }

    function keypad_new_value_function ( s )
    {
        keypad_new_value = s
    }

    function keypad_mode_function ( no )
    {
        keypad_mode = no
        switch ( keypad_mode)
        {
            case 0:
                button_keypad_minus.visible = true
                button_keypad_dot.visible   = true
            break

            case 1:
                button_keypad_minus.visible = false
                button_keypad_dot.visible   = true
            break

            case 2:
                button_keypad_minus.visible = true
                button_keypad_dot.visible   = false
            break

            default:
                button_keypad_minus.visible = false
                button_keypad_dot.visible   = false
            break
        }
    }

    signal keypad_press_signal(int no)

    Rectangle {
        id: rectangle
        x: 0
        y: 0
        width: 430
        height: 545
        color: "#282828"
        radius: 10
        border.width: 0

        Rectangle {
            id: rectangle1
            x: 8
            y: 8
            width: 415
            height: 530
            color: "#0c1a1e"
            radius: 10

            Text {
                id: text_keypad_title
                x: 8
                y: 8
                width: 399
                height: 28
                color: "#ffffff"
                text: keypad_title_name //qsTr("Zero 시약")
                font.pixelSize: 21
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.weight: Font.Normal
                font.bold: true
            }

            Text {
                id: text_keypad_message_1
                x: 8
                y: 53
                width: 99
                height: 27
                color: "#ffffff"
                text: qsTr("기존 값")
                font.pixelSize: 21
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                font.weight: Font.Normal
            }

            Rectangle{
            id:rectangle2
            x: 126
            y: 53
            width: 275
            height: 27
            color: "#ffffff"
            Text {
                id: text_keypad_oldvalue
                anchors.fill:parent
                color: "black"
                text: keypad_old_value
                font.pixelSize: 21
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                font.weight: Font.Normal
            }
            }

            Text {
                id: text_keypad_message_2
                x: 8
                y: 90
                width: 99
                height: 27
                color: "#ffffff"
                text: qsTr("입력 값")
                font.pixelSize: 21
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                font.weight: Font.Normal
            }

            Rectangle{
            id:rectangle3
            x: 126
            y: 90
            width: 275
            height: 27
            color: "#ffffff"
            Text {
                id: text_keypad_newvalue
                anchors.fill:parent
                color: "black"
                text: keypad_new_value
                font.pixelSize: 21
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.bold: true
                font.weight: Font.Normal
            }
            }

            /*
  123 clr
  456 del
  789
  -0. enter
  */

            Button{
                id:button_keypad_1
                x: 20
                y: 136
                width: 80
                height: 80
                Text {
                    id: text_button_keypad_1
                    anchors.fill:parent
                    color: "black"
                    text: qsTr("1")
                    font.pixelSize: 27
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.bold: true
                    font.weight: Font.Normal
                }
                onClicked: {
					keypad_press_add_function("1")
					keypad_press_signal(1)
				}
            }

                Button {
                    id: button_keypad_2
                    x: button_keypad_1.x + button_keypad_1.width + button_gap
                    y: button_keypad_1.y
                    width: 80
                    height: 80
                    Text {
                        id: text_button_keypad_2
                        color: "#000000"
                        text: qsTr("2")
                        anchors.fill: parent
                        font.pixelSize: 27
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.bold: true
                        font.weight: Font.Normal
                    }
                    onClicked: {
						keypad_press_add_function("2")
						keypad_press_signal(2)
					}
                }

                Button {
                    id: button_keypad_3
                    x: button_keypad_2.x + button_keypad_2.width + button_gap
                    y: button_keypad_1.y
                    width: 80
                    height: 80
                    Text {
                        id: text_button_keypad_3
                        color: "#000000"
                        text: qsTr("3")
                        anchors.fill: parent
                        font.pixelSize: 27
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.bold: true
                        font.weight: Font.Normal
                    }
                    onClicked: {
						keypad_press_add_function("3")
						keypad_press_signal(3)
					}
                }

                Button {
                    id: button_keypad_clear
                    x: button_keypad_3.x + button_keypad_3.width + button_gap
                    y: button_keypad_1.y
                    width: 80
                    height: 80
                    Text {
                        id: text_button_keypad_clear
                        color: "#000000"
                        text: qsTr("Clr")
                        anchors.fill: parent
                        font.pixelSize: 27
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.bold: true
                        font.weight: Font.Normal
                    }
                    onClicked: {
						keypad_new_value_length = 0 ;
						keypad_new_value = "---"
						keypad_press_signal(10) //clear
					}
                }



                Button {
                    id: button_keypad_4
                    x: button_keypad_1.x
                    y: button_keypad_1.y + button_keypad_1.height + button_gap
                    width: 80
                    height: 80
                    Text {
                        id: text_button_keypad_4
                        color: "#000000"
                        text: qsTr("4")
                        anchors.fill: parent
                        font.pixelSize: 27
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.bold: true
                        font.weight: Font.Normal
                    }
                    onClicked: {
						keypad_press_add_function("4")
						keypad_press_signal(4)
					}
                }

                Button {
                    id: button_keypad_5
                    x: button_keypad_2.x
                    y: button_keypad_4.y
                    width: 80
                    height: 80
                    Text {
                        id: text_button_keypad_5
                        color: "#000000"
                        text: qsTr("5")
                        anchors.fill: parent
                        font.pixelSize: 27
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.bold: true
                        font.weight: Font.Normal
                    }
                    onClicked: {
						keypad_press_add_function("5")
						keypad_press_signal(5)
					}
                }

                Button {
                    id: button_keypad_6
                    x: button_keypad_3.x
                    y: button_keypad_4.y
                    width: 80
                    height: 80
                    Text {
                        id: text_button_keypad_6
                        color: "#000000"
                        text: qsTr("6")
                        anchors.fill: parent
                        font.pixelSize: 27
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.bold: true
                        font.weight: Font.Normal
                    }
                    onClicked: {
						keypad_press_add_function("6")
						keypad_press_signal(6)
					}
                }

                Button {
                    id: button_keypad_del
                    x: button_keypad_clear.x
                    y: button_keypad_4.y
                    width: 80
                    height: 80
                    Text {
                        id: text_button_keypad_del
                        color: "#000000"
                        text: qsTr("Del")
                        anchors.fill: parent
                        font.pixelSize: 27
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.bold: true
                        font.weight: Font.Normal
                    }
                    onClicked: {
						keypad_press_delete_function()
						keypad_press_signal(11) //delete
					}
                }

                Button {
                    id: button_keypad_7
                    x: button_keypad_1.x
                    y: button_keypad_4.y + button_keypad_4.height + button_gap
                    width: 80
                    height: 80
                    Text {
                        id: text_button_keypad_7
                        color: "#000000"
                        text: qsTr("7")
                        anchors.fill: parent
                        font.pixelSize: 27
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.bold: true
                        font.weight: Font.Normal
                    }
                    onClicked: {
						keypad_press_add_function("7")
						keypad_press_signal(7)
					}
                }

                Button {
                    id: button_keypad_8
                    x: button_keypad_2.x
                    y: button_keypad_7.y
                    width: 80
                    height: 80
                    Text {
                        id: text_button_keypad_8
                        color: "#000000"
                        text: qsTr("8")
                        anchors.fill: parent
                        font.pixelSize: 27
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.bold: true
                        font.weight: Font.Normal
                    }
                    onClicked: {
						keypad_press_add_function("8")
						keypad_press_signal(8)
					}
                }

                Button {
                    id: button_keypad_9
                    x: button_keypad_3.x
                    y: button_keypad_7.y
                    width: 80
                    height: 80
                    Text {
                        id: text_button_keypad_9
                        color: "#000000"
                        text: qsTr("9")
                        anchors.fill: parent
                        font.pixelSize: 27
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.bold: true
                        font.weight: Font.Normal
                    }
                    onClicked: {
						keypad_press_add_function("9")
						keypad_press_signal(9)
					}
                }

                Button {
                    id: button_keypad_cancel
                    x: button_keypad_clear.x
                    y: button_keypad_7.y
                    width: 80
                    height: 80
                    Text {
                        id: text_button_keypad_cancel
                        color: "#000000"
                        text: qsTr("Exit")
                        anchors.fill: parent
                        font.pixelSize: 27
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.bold: true
                        font.weight: Font.Normal
                    }
                    onClicked:
                    {
                        keypad_press_signal(12) //cancel
                        keypad_dialog.close()
                    }
                }

                Button {
                    id: button_keypad_minus
                    x: button_keypad_1.x
                    y: button_keypad_7.y + button_keypad_7.height + button_gap
                    width: 80
                    height: 80
                    Text {
                        id: text_button_keypad_minus
                        color: "#000000"
                        text: qsTr("-")
                        anchors.fill: parent
                        font.pixelSize: 27
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.bold: true
                        font.weight: Font.Normal
                    }
                    onClicked: {
						keypad_press_minus_function()
						keypad_press_signal(13) //minus
					}
                }

                Button {
                    id: button_keypad_0
                    x: button_keypad_2.x
                    y: button_keypad_minus.y
                    width: 80
                    height: 80
                    Text {
                        id: text_button_keypad_0
                        color: "#000000"
                        text: qsTr("0")
                        anchors.fill: parent
                        font.pixelSize: 27
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.bold: true
                        font.weight: Font.Normal
                    }
                    onClicked: {
						keypad_press_add_function("0")
						keypad_press_signal(0)
					}
                }

                Button {
                    id: button_keypad_dot
                    x: button_keypad_3.x
                    y: button_keypad_minus.y
                    width: 80
                    height: 80
                    Text {
                        id: text_button_keypad_dot
                        color: "#000000"
                        text: qsTr(".")
                        anchors.fill: parent
                        font.pixelSize: 27
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.bold: true
                        font.weight: Font.Normal
                    }
                    onClicked: {
						keypad_press_add_function(".")
						keypad_press_signal(14)
					}
                }

                Button {
                    id: button_keypad_Enter
                    x: button_keypad_clear.x
                    y: button_keypad_minus.y
                    width: 80
                    height: 80
                    Text {
                        id: text_button_keypad_Enter
                        color: "#000000"
                        text: qsTr("Ent")
                        anchors.fill: parent
                        font.pixelSize: 27
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.bold: true
                        font.weight: Font.Normal
                    }
                    onClicked: {
                        keypad_press_signal(15) //enter
                        keypad_dialog.close()
                    }
                }
        }
    }

}


