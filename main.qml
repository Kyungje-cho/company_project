/****************************************************************************
**
** Copyright (C) 2016 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the Qt Charts module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:GPL$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3 or (at your option) any later version
** approved by the KDE Free Qt Foundation. The licenses are as published by
** the Free Software Foundation and appearing in the file LICENSE.GPL3
** included in the packaging of this file. Please review the following
** information to ensure the GNU General Public License requirements will
** be met: https://www.gnu.org/licenses/gpl-3.0.html.
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12

//![1]
Item {
    objectName:"main"
    id: main
    width: 1024
    height: 731

	property string popup_menu_select_name: ""
    property string text_main_pre_data_test_string: "-"

    BorderImage {
            id: borderImage
            x: 0
            y: 0
            width: 1024
            height: 731
            source: "images/main.png"

            Button {
                id: button_menu
                x: 0
                y: 0
                width: 150
                height: 37
                Text {
                    id: button_menu_name
                    text: qsTr("\u2630 MENU")
                    color: "white"
                    font.bold: true
                    font.pointSize: 20
                    anchors.fill: parent
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                hoverEnabled: true
                flat: true

                onClicked: drawer.open()
            }

            Button {
                id: button_main
                x: 8
                y: 117
                width: 90
                height: 72
                text: qsTr("")
                hoverEnabled: true
                flat: true
                onClicked: {
					popup_menu_select_name = ""
                }
            }

            Button {
                id: button_data
                x: 8
                y: 230
                width: 90
                height: 72
                text: qsTr("")
                hoverEnabled: true
                flat: true
                onClicked: {
					popup_menu_select_name = "popup_menu_data.qml"
                }
            }

            Button {
                id: button_calibraion
                x: 8
                y: 338
                width: 90
                height: 72
                text: qsTr("")
                hoverEnabled: true
                flat: true
                onClicked: {
					popup_menu_select_name = "popup_menu_calibration.qml"
                }
            }

			Button {
                id: button_operationCheck
                x: 8
                y: 438
                width: 90
                height: 72
                text: qsTr("")
                hoverEnabled: true
                flat: true
                onClicked: {
					popup_menu_select_name = "popup_operationCheck.qml"
                }
            }

            Text {
                id: text_main_pre_data
                x: 758
                y: 153
                width: 236
                height: 27
                visible: false
                Text {
                    objectName: "text_main_pre_data"
                    anchors.fill: parent
                    text: qsTr("0.000")
                    font.pixelSize: 25
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    font.weight: Font.Bold
                    font.bold: true
                }
            }

            Text {
                id: text_main_pre_data_test
                x: 758
                y: 153
                width: 236
                height: 27
                enabled: false
                Text {
                    anchors.fill: parent
                    text: text_main_pre_data_test_string
                    font.pixelSize: 25
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    font.weight: Font.Bold
                    font.bold: true
                }
            }

            Text {
                id: text_main_data
                x: 578
                y: 261
                width: 432
                height: 159
                Text {
                    objectName: "text_main_data"
                    anchors.fill: parent
                    text: qsTr("0.000")
                    font.pixelSize: 100
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.weight: Font.Bold
                    font.bold: true
                }
            }

            Text {
                id: text_main_min
                x: 135
                y: 477
                width: 129
                height: 26
                Text {
                    objectName: "text_main_min"
                    anchors.fill: parent
                    text: qsTr("0.000")
                    font.pixelSize: 17
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.weight: Font.Bold
                    font.bold: true
                }
            }

            Text {
                id: text_main_max
                x: 277
                y: 477
                width: 129
                height: 26
                Text {
                    objectName: "text_main_max"
                    anchors.fill: parent
                    text: qsTr("0.000")
                    font.pixelSize: 17
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.weight: Font.Bold
                    font.bold: true
                }
            }

            ComboBox {
                id: comboBox
                x: 421
                y: 475
                width: 128
                height: 30
                font.weight: Font.Bold
                font.bold: true
                font.pointSize: 13
                model:["60","300","450","600"]
                onCurrentIndexChanged: dataSource.changeDisplayRangeX_qml(currentIndex) ;
            }

            Text {
                id: text_main_operation_mode
                x: 126
                y: 552
                width: 204
                height: 49
                Text {
                    objectName: "text_main_operation_mode"
                    anchors.fill: parent
                    text: qsTr("")
                    font.pixelSize: 30
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.weight: Font.Bold
                    font.bold: true
                    color: "white"
                }
            }

            Text {
                id: text_main_operation_period
                x: 353
                y: 552
                width: 135
                height: 49
                Text {
                    objectName: "text_main_operation_period"
                    anchors.fill: parent
                    text: qsTr("")
                    font.pixelSize: 30
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.weight: Font.Bold
                    font.bold: true
                    color: "white"
                }
            }

            Text {
                id: text_main_heater_temp
                x: 578
                y: 552
                width: 141
                height: 49
                Text {
                    objectName: "text_main_heater_temp"
                    anchors.fill: parent
                    text: qsTr("")
                    font.pixelSize: 30
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.weight: Font.Bold
                    font.bold: true
                    color: "white"
                }
            }

            Text {
                id: text_main_realtime_ndir
                x: 805
                y: 552
                width: 205
                height: 49
                Text {
                    objectName: "text_main_realtime_ndir"
                    anchors.fill: parent
                    text: qsTr("")
                    font.pixelSize: 30
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.weight: Font.Bold
                    font.bold: true
                    color: "white"
                }
            }

            Text {
                id: text_main_realtime_ndir_peak
                x: 805
                y: 633
                width: 205
                height: 49
                Text {
                    objectName: "text_main_realtime_ndir_peak"
                    anchors.fill: parent
                    text: qsTr("")
                    font.pixelSize: 30
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.weight: Font.Bold
                    font.bold: true
                    color: "white"
                }
            }

            Text {
                id: text_main_cooler_temp
                x: 578
                y: 633
                width: 141
                height: 49
                Text {
                    objectName: "text_main_cooler_temp"
                    anchors.fill: parent
                    text: qsTr("")
                    font.pixelSize: 30
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.weight: Font.Bold
                    font.bold: true
                    color: "white"
                }
            }

            Text {
                id: text_main_air_flowrate
                x: 353
                y: 633
                width: 125
                height: 49
                Text {
                    objectName: "text_main_air_flowrate"
                    anchors.fill: parent
                    text: qsTr("")
                    font.pixelSize: 30
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.weight: Font.Bold
                    font.bold: true
                    color: "white"
                }
            }

            Text {
                id: text_main_status
                x: 126
                y: 633
                width: 204
                height: 49
                Text {
                    objectName: "text_main_status"
                    anchors.fill: parent
                    text: qsTr("")
                    font.pixelSize: 30
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.weight: Font.Bold
                    font.bold: true
                    color: "red"
                }
            }

            Text {
                id: text_main_message
                x: 126
                y: 688
                width: 792
                height: 35
                Text {
                    objectName: "text_main_message"
                    anchors.fill: parent
                    text: qsTr("메인화면입니다.")
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                    font.weight: Font.Bold
                    font.bold: true
                    color: "black"
                }
            }

            Text {
                id: text_main_clock
                x: 922
                y: 692
                width: 100
                height: 36
                Text {
                    objectName: "text_main_clock"
                    anchors.fill: parent
                    text: qsTr("23:59:59")
                    font.pixelSize: 20
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    font.weight: Font.Bold
                    font.bold: true
                    color: "white"
                }
            }


            ChartView {
                id: chartView
                x: 115
                y: 122
                width: 453
                height: 326
            }



			Loader {
                id:loader_popup_menu_data
                x: 100
                y: 61
                width:925
                height: 624
                source: popup_menu_select_name
                visible: popup_menu_select_name != ""
            }
    }



    Drawer {
            id: drawer
            width: 205
            height: borderImage.height
            Rectangle{
                anchors.fill: parent
                color: "green"
            }

            Column {
                id: column
                anchors.fill: parent
                spacing: 10

                ItemDelegate {
                    width: parent.width//-20
                    height: 120
                    hoverEnabled: false

                    Rectangle{
                        anchors.fill: parent
                        color: "darkblue"
                    }

                    Column {
                        anchors.fill: parent
                        spacing: 0
                        enabled: false

                        ItemDelegate{
                            TextArea{
                                text: qsTr("TMS TOC Analyzer")
                                horizontalAlignment: Text.AlignRight
                                verticalAlignment: Text.AlignBottom
                                enabled: false
                                activeFocusOnTab: false
                                focus: false
                                renderType: Text.NativeRendering
                                font.bold: true
                                font.pointSize: 12
                                width: parent.width
                                height: 90
                                color:"orange"
                                background: Rectangle {
                                    color: "darkblue"
                                }
                            }
                            width: parent.width//-20
                            height: 90
                            enabled: false
                        }

                        ItemDelegate{
                            TextArea{
                                text: qsTr("RS-1200")
                                horizontalAlignment: Text.AlignRight
                                verticalAlignment: Text.AlignVCenter
                                enabled: false
                                activeFocusOnTab: false
                                focus: false
                                renderType: Text.NativeRendering
                                font.bold: true
                                font.pointSize: 13
                                width: parent.width
                                height: 30
                                color:"orange"
                                background: Rectangle {
                                    color: "darkblue"
                                }
                        }
                            width: parent.width//-20
                            height: 30
                            enabled: false
                    }
                        }
                    }

                ItemDelegate {
                    Rectangle{
                        anchors.fill: parent
                        color: "gray"
                    }

                    TextArea{
                        text: qsTr("분석 설정")
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        enabled: false
                        font.bold: true
                        font.pointSize: 25
                        width: parent.width
                        height: 88
                        color:"white"
                        background: Rectangle {
                            color: "gray"
                        }
                    }
                        x:10
                        width: parent.width-20
                        height: 88

                    onClicked: {
                        drawer.close()
                        popup_menu_select_name = "popup_setting.qml"
                    }
                }
/*				
                ItemDelegate {
                    Rectangle{
                        anchors.fill: parent
                        color: "gray"
                    }
                    TextArea{
                        text: qsTr("교   정")
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        enabled: false
                        font.bold: true
                        font.pointSize: 25
                        width: parent.width
                        height: 88
                        color:"white"
                        background: Rectangle {
                            color: "gray"
                        }
                    }
                    x:10
                    width: parent.width-20
                    height: 88
                    onClicked: {
                        drawer.close()
                    }
                }
*/				
                ItemDelegate {
                    Rectangle{
                        anchors.fill: parent
                        color: "gray"
                    }
                    TextArea{
                        text: qsTr("자료 전송")
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        enabled: false
                        font.bold: true
                        font.pointSize: 25
                        width: parent.width
                        height: 88
                        color:"white"
                        background: Rectangle {
                            color: "gray"
                        }
                    }
                    x:10
                    width: parent.width-20
                    height: 88
                    onClicked: {
                        drawer.close()
						popup_menu_select_name = "popup_tms.qml"
                    }
                }
                ItemDelegate {
                    Rectangle{
                        anchors.fill: parent
                        color: "gray"
                    }
                    TextArea{
                        text: qsTr("시 스 템")
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        enabled: false
                        font.bold: true
                        font.pointSize: 25
                        width: parent.width
                        height: 88
                        color:"white"
                        background: Rectangle {
                            color: "gray"
                        }
                    }
                    x:10
                    width: parent.width-20
                    height: 88
                    onClicked: {
                        drawer.close()
                        popup_menu_select_name = "popup_systemInfo.qml"
                    }
                }
            }
    }



}
