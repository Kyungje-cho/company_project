import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Window 2.12

Item {
    width: 959
    height: 595

    signal operationCheck_robotArm_signal (int no)
    signal operationCheck_samplePump_signal ( int no)
    signal operationCheck_sampleValve_signal ( int no )
    signal operationCheck_airValve_signal ( int no )
    signal operationCheck_DIValve_signal ( int no )
    signal operationCheck_HclValve_signal ( int no )
    signal operationCheck_heaterValve_signal ( int no )
    signal operationCheck_overflowValve_signal ( int no )
    signal operationCheck_drainValve_signal ( int no )
    signal operationCheck_syringe_signal ( int no )
    signal operationCheck_sonic_signal ( int no )

    signal operationCheck_button_enable ( int no)


    property string button_operationCheck_robotArm_init_color: "gray"
    property string button_operationCheck_robotArm_drain_color: "gray"
    property string button_operationCheck_robotArm_furnace_color: "gray"
    property string button_operationCheck_samplePump_color: "gray"
    property string button_operationCheck_sampleValve_color: "gray"
    property string button_operationCheck_airValve_color: "gray"
    property string button_operationCheck_DIValve_color: "gray"
    property string button_operationCheck_HclValve_color: "gray"
    property string button_operationCheck_heaterValve_color: "gray"
    property string button_operationCheck_overflowValve_color: "gray"
    property string button_operationCheck_drainValve_color: "gray"
    property string button_operationCheck_syringe_init_color: "gray"
    property string button_operationCheck_syringe_pull_color: "gray"
    property string button_operationCheck_syringe_push_color: "gray"
    property string button_operationCheck_sonic_color: "gray"

    property string button_operationCheck_robotArm_init_text: "기준"
    property string button_operationCheck_robotArm_drain_text: "배출"
    property string button_operationCheck_robotArm_furnace_text: "가열로"
    property string button_operationCheck_samplePump_text: "OFF"
    property string button_operationCheck_sampleValve_text: "OFF"
    property string button_operationCheck_airValve_text: "OFF"
    property string button_operationCheck_DIValve_text: "OFF"
    property string button_operationCheck_HclValve_text: "OFF"
    property string button_operationCheck_heaterValve_text: "OFF"
    property string button_operationCheck_overflowValve_text: "OFF"
    property string button_operationCheck_drainValve_text: "OFF"
    property string button_operationCheck_syringe_init_text: "초기화"
    property string button_operationCheck_syringe_pull_text: "흡입"
    property string button_operationCheck_syringe_push_text: "배출"
    property string button_operationCheck_sonic_text: "OFF"

    property bool button_enable : false

    function operationCheck_robotArm_function ( no)
    {
        switch (no)
        {
        case 1 :
            button_operationCheck_robotArm_init_color = "blue"
            button_operationCheck_robotArm_drain_color = "red"
            button_operationCheck_robotArm_furnace_color = "blue"
            operationCheck_robotArm_signal(1)
            return 1

        case 2 :
            button_operationCheck_robotArm_init_color = "blue"
            button_operationCheck_robotArm_drain_color = "blue"
            button_operationCheck_robotArm_furnace_color = "red"
            operationCheck_robotArm_signal(2)
            return 2

        default :
            button_operationCheck_robotArm_init_color = "red"
            button_operationCheck_robotArm_drain_color = "blue"
            button_operationCheck_robotArm_furnace_color = "blue"
            operationCheck_robotArm_signal(0)
            return 0
        }
    }


    function operationCheck_syringe_function ( no )
    {
        switch(no)
        {
        case 1:
            button_operationCheck_syringe_init_color = "blue"
            button_operationCheck_syringe_pull_color = "red"
            button_operationCheck_syringe_push_color = "blue"
            operationCheck_syringe_signal(1)
            break ;

        case 2 :
            button_operationCheck_syringe_init_color = "blue"
            button_operationCheck_syringe_pull_color = "blue"
            button_operationCheck_syringe_push_color = "red"
            operationCheck_syringe_signal(2)
            return 2 ;

        default :
            button_operationCheck_syringe_init_color = "red"
            button_operationCheck_syringe_pull_color = "blue"
            button_operationCheck_syringe_push_color = "blue"
            operationCheck_syringe_signal(0)
            return 0
        }
    }

    function operationCheck_samplePump_function ( setColor )
    {
        if ( setColor == "blue" )
        {
            button_operationCheck_samplePump_color = "red"
            button_operationCheck_samplePump_text = "OFF"
            return 1
        }
        else
        {
            button_operationCheck_samplePump_color = "blue"
            button_operationCheck_samplePump_text = "ON"
            return 0 ;
        }
    }

    function operationCheck_sampleValve_function ( setColor )
    {
        if ( setColor == "blue" )
        {
            button_operationCheck_sampleValve_color = "red"
            button_operationCheck_sampleValve_text = "OFF"
            return 1
        }
        else
        {
            button_operationCheck_sampleValve_color = "blue"
            button_operationCheck_sampleValve_text = "ON"
            return 0
        }
    }

    function operationCheck_airValve_function ( setColor )
    {
        if ( setColor == "blue" )
        {
            button_operationCheck_airValve_color = "red"
            button_operationCheck_airValve_text = "OFF"
            return 1
        }
        else
        {
            button_operationCheck_airValve_color = "blue"
            button_operationCheck_airValve_text = "ON"
            return 0
        }
    }

    function operationCheck_DIValve_function ( setColor )
    {
        if ( setColor == "blue" )
        {
            button_operationCheck_DIValve_color = "red"
            button_operationCheck_DIValve_text = "OFF"
            return 1
        }
        else
        {
            button_operationCheck_DIValve_color = "blue"
            button_operationCheck_DIValve_text = "ON"
            return 0
        }
    }

    function operationCheck_HclValve_function ( setColor )
    {
        if ( setColor == "blue" )
        {
            button_operationCheck_HclValve_color = "red"
            button_operationCheck_HclValve_text = "OFF"
            return 1
        }
        else
        {
            button_operationCheck_HclValve_color = "blue"
            button_operationCheck_HclValve_text = "ON"
            return 0
        }
    }

    function operationCheck_heaterValve_function ( setColor )
    {
        if ( setColor == "blue" )
        {
            button_operationCheck_heaterValve_color = "red"
            button_operationCheck_heaterValve_text= "OFF"
            return 1
        }
        else
        {
            button_operationCheck_heaterValve_color = "blue"
            button_operationCheck_heaterValve_text = "ON"
            return 0
        }
    }

    function operationCheck_overflowValve_function ( setColor )
    {
        if ( setColor == "blue" )
        {
            button_operationCheck_overflowValve_color = "red"
            button_operationCheck_overflowValve_text = "OFF"
            return 1
        }
        else
        {
            button_operationCheck_overflowValve_color = "blue"
            button_operationCheck_overflowValve_text = "ON"
            return 0
        }
    }


    function operationCheck_drainValve_function ( setColor )
    {
        if ( setColor == "blue" )
        {
            button_operationCheck_drainValve_color = "red"
            button_operationCheck_drainValve_text = "OFF"
            return 1
        }
        else
        {
            button_operationCheck_drainValve_color = "blue"
            button_operationCheck_drainValve_text = "ON"
            return 0 ;
        }
    }


    function operationCheck_sonic_function ( setColor )
    {
        if ( setColor == "blue" )
        {
            button_operationCheck_sonic_color = "red"
            button_operationCheck_sonic_text = "OFF"
            return 1
        }
        else
        {
            button_operationCheck_sonic_color = "blue"
            button_operationCheck_sonic_text = "ON"
            return 0
        }
    }


    Rectangle {
        id: rectangle2
        x: 0
        y: 0
        width: 959
        height: 595
        color: "#0f4770"

        Rectangle {
            id: rectangle3
            x: 8
            y: 8
            width: 943
            height: 579
            color: "#0c1a1e"
        }
    }

    Image {
        id: image
        width: 959
        height: 595
        anchors.fill: parent
        source: "images/processmap.png"
    }

    Rectangle {
        id: rectangle
        x: 140
        y: 85
        width: 91
        height: 159
        opacity: 0.2
        color: "gray"
        radius: 10
    }

    Rectangle {
        id: rectangle1
        x: 289
        y: 85
        width: 91
        height: 159
        opacity: 0.2
        color: "gray"
        radius: 10
    }

    Button{
        id:button_operationCheck_robotArm_init
        x:155
        y:98
        width: 60
        height: 32
        opacity: 0.6
        background: Rectangle{
            radius: 2
            color: button_operationCheck_robotArm_init_color
        }
        Text{
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 16
            font.bold: true
            text:button_operationCheck_robotArm_init_text
            color: "white"
        }
        onClicked: {
            if ( button_enable == true )
                operationCheck_robotArm_function(0)
        }
    }

    Button{
        id:button_operationCheck_robotArm_drain
        x:155
        y:152
        width: 60
        height: 32
        opacity: 0.6
        background: Rectangle{
            radius: 2
            color: button_operationCheck_robotArm_drain_color
        }
        Text{
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 16
            font.bold: true
            text:button_operationCheck_robotArm_drain_text
            color: "white"
        }
        onClicked: {
            if ( button_enable == true )
                operationCheck_robotArm_function(1)
        }
    }

    RoundButton{
        id:button_operationCheck_robotArm_furnace
        x:155
        y:200
        width: 60
        height: 32
        opacity: 0.6
        background: Rectangle{
            radius: 2
            color: button_operationCheck_robotArm_furnace_color
        }
        Text{
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 16
            font.bold: true
            text:button_operationCheck_robotArm_furnace_text
            color: "white"
        }
        onClicked: {
            if ( button_enable == true )
                operationCheck_robotArm_function(2)
        }
    }


    Button{
        id:button_operationCheck_samplePump
        x:578
        y:216
        width: 60
        height: 32
        opacity: 0.6
        background: Rectangle{
            radius: 2
            color: button_operationCheck_samplePump_color
        }
        Text{
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 16
            font.bold: true
            text:button_operationCheck_samplePump_text
            color: "white"
        }
        onClicked: {
            if ( button_enable == true )
                operationCheck_samplePump_signal ( operationCheck_samplePump_function(button_operationCheck_samplePump_color) )
        }
    }

    Button{
        id:button_operationCheck_sampleValve
        x:780
        y:218
        width: 60
        height: 32
        opacity: 0.6
        background: Rectangle{
            radius: 2
            color: button_operationCheck_sampleValve_color
        }
        Text{
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 16
            font.bold: true
            text:button_operationCheck_sampleValve_text
            color: "white"
        }
        onClicked: {
            if ( button_enable == true )
                operationCheck_sampleValve_signal ( operationCheck_sampleValve_function(button_operationCheck_sampleValve_color) )
        }
    }

    Button{
        id:button_operationCheck_airValve
        x:578
        y:302
        width: 60
        height: 32
        opacity: 0.6
        background: Rectangle{
            radius: 2
            color: button_operationCheck_airValve_color
        }
        Text{
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 16
            font.bold: true
            text:button_operationCheck_airValve_text
            color: "white"
        }
        onClicked: {
            if ( button_enable == true )
                operationCheck_airValve_signal ( operationCheck_airValve_function(button_operationCheck_airValve_color) )
        }
    }

    Button{
        id:button_operationCheck_DIValve
        x:780
        y:313
        width: 60
        height: 32
        opacity: 0.6
        background: Rectangle{
            radius: 2
            color: button_operationCheck_DIValve_color
        }
        Text{
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 16
            font.bold: true
            text:button_operationCheck_DIValve_text
            color: "white"
        }
        onClicked: {
            if ( button_enable == true )
                operationCheck_DIValve_signal ( operationCheck_DIValve_function (button_operationCheck_DIValve_color) )
        }
    }


    Button{
        id:button_operationCheck_HclValve
        x:737
        y:413
        width: 60
        height: 32
        opacity: 0.6
        background: Rectangle{
            radius: 2
            color: button_operationCheck_HclValve_color
        }
        Text{
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 16
            font.bold: true
            text:button_operationCheck_HclValve_text
            color: "white"
        }
        onClicked: {
            if ( button_enable == true )
                operationCheck_HclValve_signal ( operationCheck_HclValve_function (button_operationCheck_HclValve_color) )
        }
    }


    Button{
        id:button_operationCheck_heaterValve
        x:155
        y:302
        width: 60
        height: 32
        opacity: 0.6
        background: Rectangle{
            radius: 2
            color: button_operationCheck_heaterValve_color
        }
        Text{
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 16
            font.bold: true
            text:button_operationCheck_heaterValve_text
            color: "white"
        }
        onClicked: {
            if ( button_enable == true )
                operationCheck_heaterValve_signal( operationCheck_heaterValve_function (button_operationCheck_heaterValve_color) )
        }
    }


    Button{
        id:button_operationCheck_overflowValve
        x:305
        y:426
        width: 60
        height: 32
        opacity: 0.6
        background: Rectangle{
            radius: 2
            color: button_operationCheck_overflowValve_color
        }
        Text{
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 16
            font.bold: true
            text:button_operationCheck_overflowValve_text
            color: "white"
        }
        onClicked: {
            if ( button_enable == true )
                operationCheck_overflowValve_signal ( operationCheck_overflowValve_function(button_operationCheck_overflowValve_color) )
        }
    }

    Button{
        id:button_operationCheck_drainValve
        x:423
        y:426
        width: 60
        height: 32
        opacity: 0.6
        background: Rectangle{
            radius: 2
            color: button_operationCheck_drainValve_color
        }
        Text{
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 16
            font.bold: true
            text:button_operationCheck_drainValve_text
            color: "white"
        }
        onClicked: {
            if ( button_enable == true )
                operationCheck_drainValve_signal ( operationCheck_drainValve_function(button_operationCheck_drainValve_color) )
        }
    }

    Button{
        id:button_operationCheck_syringe_init
        x:305
        y:98
        width: 60
        height: 32
        opacity: 0.6
        background: Rectangle{
            radius: 2
            color: button_operationCheck_syringe_init_color
        }
        Text{
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 16
            font.bold: true
            text:button_operationCheck_syringe_init_text
            color: "white"
        }
        onClicked: {
            if ( button_enable == true )
                operationCheck_syringe_function(0)
        }
    }

    Button{
        id:button_operationCheck_syringe_pull
        x:305
        y:152
        width: 60
        height: 32
        opacity: 0.6
        background: Rectangle{
            radius: 2
            color: button_operationCheck_syringe_pull_color
        }
        Text{
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 16
            font.bold: true
            text:button_operationCheck_syringe_pull_text
            color: "white"
        }
        onClicked: {
            if ( button_enable == true )
                operationCheck_syringe_function(1)
        }
    }

    Button{
        id:button_operationCheck_syringe_push
        x:305
        y:200
        width: 60
        height: 32
        opacity: 0.6
        background: Rectangle{
            radius: 2
            color: button_operationCheck_syringe_push_color
        }
        Text{
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 16
            font.bold: true
            text:button_operationCheck_syringe_push_text
            color: "white"
        }
        onClicked: {
            if ( button_enable == true )
                operationCheck_syringe_function(2)
        }
    }



    Button{
        id:button_operationCheck_sonic
        x:423
        y:165
        width: 60
        height: 32
        opacity: 0.6
        background: Rectangle{
            radius: 2
            color: button_operationCheck_sonic_color
        }
        Text{
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 16
            font.bold: true
            text:button_operationCheck_sonic_text
            color: "white"
        }
        onClicked: {
            if ( button_enable == true )
                operationCheck_sonic_signal ( operationCheck_sonic_function(button_operationCheck_sonic_color) )
        }
    }

    Button {
        id: button_operationCheck_password
        x: 311
        y: 543
        width: 141
        height: 44
        Text{
            anchors.fill: parent
            text: qsTr("작 동")
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.bold: true
            font.pointSize: 16
        }
        onClicked: {
            if ( button_enable != true )
            {
                button_enable = true
                operationCheck_button_enable(0)
            }
        }
    }

    Button {
        id: button_operationCheck_reset
        x: 578
        y: 543
        width: 141
        height: 44
        Text {
            text: qsTr("RESET")
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 16
            font.bold: true
        }
        onClicked: {
            if ( button_enable == true )
            {
                button_enable = false
                operationCheck_button_enable(1)
            }
        }
    }

}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.1}
}
##^##*/
