import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Window 2.12

Item {
    width: 430
    height: 528
    x:-20
    y:-20

    property int button_gap: 20
	
    property string passwordcheck_display_string : "---"
	property int 	passwordcheck_display_string_length : 0
    signal 			passwordcheck_press_signal(int no)
	
	function passwordcheck_press_add_function ( )
	{
		if ( passwordcheck_display_string_length == 0 )
		{
			passwordcheck_display_string = "*"
		}
		else
		{
			passwordcheck_display_string = passwordcheck_display_string + "*"
		}
		passwordcheck_display_string_length++
	}
	
	function passwordcheck_press_delete_function ()
	{
		if ( passwordcheck_display_string_length < 2 )
		{
			passwordcheck_display_string_length = 0 ;
            passwordcheck_display_string = "---"
		}
		else
		{
			passwordcheck_display_string_length--
			passwordcheck_display_string = passwordcheck_display_string.substr(0,passwordcheck_display_string_length)
		}
	}

    Rectangle {
        id: rectangle
        x: 0
        y: 0
        width: 430
        height: 528
        color: "#282828"
        radius: 10
        border.width: 0

        Rectangle {
            id: rectangle1
            x: 8
            y: 8
            width: 415
            height: 513
            color: "#0c1a1e"
            radius: 10

            Text {
                id: text_passwordcheck_title
                x: 8
                y: 8
                width: 399
                height: 28
                color: "#ffffff"
                text: qsTr("설정 저장")
                font.pixelSize: 21
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.weight: Font.Normal
                font.bold: true
            }

            Text {
                id: text_passwordcheck_message
                x: 8
                y: 53
                width: 99
                height: 27
                color: "#ffffff"
                text: qsTr("비밀번호")
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
                id: text_passwordcheck_in
                anchors.fill:parent
                color: "black"
                text: passwordcheck_display_string //qsTr("***********")
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
                id:button_passwordcheck_1
                x: 20
                y: 119
                width: 80
                height: 80
                Text {
                    id: text_button_passwordcheck_1
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
					passwordcheck_press_add_function()
					passwordcheck_press_signal(1)
				}
            }

                Button {
                    id: button_passwordcheck_2
                    x: button_passwordcheck_1.x + button_passwordcheck_1.width + button_gap
                    y: button_passwordcheck_1.y
                    width: 80
                    height: 80
                    Text {
                        id: text_button_passwordcheck_2
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
						passwordcheck_press_add_function()
						passwordcheck_press_signal(2)
					}
                }

                Button {
                    id: button_passwordcheck_3
                    x: button_passwordcheck_2.x + button_passwordcheck_2.width + button_gap
                    y: button_passwordcheck_1.y
                    width: 80
                    height: 80
                    Text {
                        id: text_button_passwordcheck_3
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
						passwordcheck_press_add_function()
						passwordcheck_press_signal(3)
					}
                }

                Button {
                    id: button_passwordcheck_clear
                    x: button_passwordcheck_3.x + button_passwordcheck_3.width + button_gap
                    y: button_passwordcheck_1.y
                    width: 80
                    height: 80
                    Text {
                        id: text_button_passwordcheck_clear
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
						passwordcheck_display_string_length = 0 ;
						passwordcheck_display_string = "-"
						passwordcheck_press_signal(10) //clear
					}
                }



                Button {
                    id: button_passwordcheck_4
                    x: button_passwordcheck_1.x
                    y: button_passwordcheck_1.y + button_passwordcheck_1.height + button_gap
                    width: 80
                    height: 80
                    Text {
                        id: text_button_passwordcheck_4
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
						passwordcheck_press_add_function()
						passwordcheck_press_signal(4)
					}
                }

                Button {
                    id: button_passwordcheck_5
                    x: button_passwordcheck_2.x
                    y: button_passwordcheck_4.y
                    width: 80
                    height: 80
                    Text {
                        id: text_button_passwordcheck_5
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
						passwordcheck_press_add_function()
						passwordcheck_press_signal(5)
					}
                }

                Button {
                    id: button_passwordcheck_6
                    x: button_passwordcheck_3.x
                    y: button_passwordcheck_4.y
                    width: 80
                    height: 80
                    Text {
                        id: text_button_passwordcheck_6
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
						passwordcheck_press_add_function()
						passwordcheck_press_signal(6)
					}
                }

                Button {
                    id: button_passwordcheck_del
                    x: button_passwordcheck_clear.x
                    y: button_passwordcheck_4.y
                    width: 80
                    height: 80
                    Text {
                        id: text_button_passwordcheck_del
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
						passwordcheck_press_delete_function()
						passwordcheck_press_signal(11)
					}
                }

                Button {
                    id: button_passwordcheck_7
                    x: button_passwordcheck_1.x
                    y: button_passwordcheck_4.y + button_passwordcheck_4.height + button_gap
                    width: 80
                    height: 80
                    Text {
                        id: text_button_passwordcheck_7
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
						passwordcheck_press_add_function()
						passwordcheck_press_signal(7)
					}
                }

                Button {
                    id: button_passwordcheck_8
                    x: button_passwordcheck_2.x
                    y: button_passwordcheck_7.y
                    width: 80
                    height: 80
                    Text {
                        id: text_button_passwordcheck_8
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
						passwordcheck_press_add_function()
						passwordcheck_press_signal(8)
					}
                }

                Button {
                    id: button_passwordcheck_9
                    x: button_passwordcheck_3.x
                    y: button_passwordcheck_7.y
                    width: 80
                    height: 80
                    Text {
                        id: text_button_passwordcheck_9
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
						passwordcheck_press_add_function()
						passwordcheck_press_signal(9)
					}
                }

                Button {
                    id: button_passwordcheck_cancel
                    x: button_passwordcheck_clear.x
                    y: button_passwordcheck_7.y
                    width: 80
                    height: 80
                    Text {
                        id: text_button_passwordcheck_cancel
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
                        password_check_dialog.close()
                        onClicked: passwordcheck_press_signal(12) //cancel
                    }
                }

                Button {
                    id: button_passwordcheck_minus
                    x: button_passwordcheck_1.x
                    y: button_passwordcheck_7.y + button_passwordcheck_7.height + button_gap
                    width: 80
                    height: 80
                    visible: false
                    Text {
                        id: text_button_passwordcheck_minus
                        color: "#000000"
                        text: qsTr("-")
                        anchors.fill: parent
                        font.pixelSize: 27
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.bold: true
                        font.weight: Font.Normal
                    }
                    onClicked: passwordcheck_press_signal(13) //minus
                }

                Button {
                    id: button_passwordcheck_0
                    x: button_passwordcheck_2.x
                    y: button_passwordcheck_minus.y
                    width: 80
                    height: 80
                    Text {
                        id: text_button_passwordcheck_0
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
						passwordcheck_press_add_function()
						passwordcheck_press_signal(0)
					}
                }

                Button {
                    id: button_passwordcheck_dot
                    x: button_passwordcheck_3.x
                    y: button_passwordcheck_minus.y
                    width: 80
                    height: 80
                    visible: false
                    Text {
                        id: text_button_passwordcheck_dot
                        color: "#000000"
                        text: qsTr(".")
                        anchors.fill: parent
                        font.pixelSize: 27
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        font.bold: true
                        font.weight: Font.Normal
                    }
                    onClicked: passwordcheck_press_signal(14) //dot
                }

                Button {
                    id: button_passwordcheck_Enter
                    x: button_passwordcheck_clear.x
                    y: button_passwordcheck_minus.y
                    width: 80
                    height: 80
                    Text {
                        id: text_button_passwordcheck_Enter
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
                        password_check_dialog.close()
                        passwordcheck_press_signal(15) //enter
                    }
                }
        }
    }
}


