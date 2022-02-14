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
import QtCharts 2.3

ChartView {
    id: chartView
    animationOptions: ChartView.NoAnimation
    theme: ChartView.ChartThemeDark
    antialiasing: true
    legend.visible: false

    margins.top: 4
    margins.right: 2

    margins.left: 4
    margins.bottom: 2

    function redraw_chart ( )
    {
        dataSource.update(chartView.series(0));
    }

    Component.onCompleted: {
        dataSource.pushQObject_chart (chartView ) ;
        dataSource.update(chartView.series(0));
    }


    ValueAxis {
        id: axisY
        min: 0
        max: 10
        gridVisible: true
        labelFormat: "%.0f"
        titleText: qsTr("NDIR(FSR)")
    }

    ValueAxis {
        id: axisX
        min: -600
        max: 0
        gridVisible: true
        labelFormat: "%.0f"
        titleText: qsTr("Time(s)")
    }

    LineSeries {
        id: lineSeries1
        name: "signal 1"
        axisX: axisX
        axisY: axisY
        color: "yellow"
        width: 2
        capStyle: Qt.RoundCap
        style: Qt.SolidLine
    }


}
