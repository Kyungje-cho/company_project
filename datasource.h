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

#ifndef DATASOURCE_H
#define DATASOURCE_H

#include <QtCore/QObject>
#include <QtCharts/QAbstractSeries>
#include <QtCharts/QXYSeries>
#include <QTimer>
#include <QDate>
#include <QTime>
#include <QGuiApplication>
#include <QtQuick>
#include <QAbstractListModel>
#include <QStringList>
#include <QCalendarWidget>

#include "listviewdatamodel.h"

typedef struct
{
  float max, min ;
  char change_flag ;
} linechart_min_max_tag ;

typedef struct
{
  linechart_min_max_tag mm_600 ;
  linechart_min_max_tag mm_450 ;
  linechart_min_max_tag mm_300 ;
  linechart_min_max_tag mm_60 ;
//  double data[1201] ;
} linechart_live_min_max_tag ;

typedef enum
{
  screen_display_10m = 0,
  screen_display_7_5m,
  screen_display_5m,
  screen_display_1m
} screen_display_max_no ;

typedef enum
{
  menu_main = 0,
  menu_data,
  menu_calibration,
  menu_operation_check,
  menu_measurement_start,

  menu_setup_operation,
  menu_setup_calibration,
  menu_setup_source,
  menu_setup_system

} menu_tag ;


QT_BEGIN_NAMESPACE
class QQuickView;
QT_END_NAMESPACE

QT_CHARTS_USE_NAMESPACE

class DataSource : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString systemInfo_programVersion READ get_systemInfo_programVersion WRITE set_systemInfo_programVersion NOTIFY changed_systemInfo_programVersion)
    Q_PROPERTY(QString systemInfo_freeSpace_size READ get_systemInfo_freeSpace_size WRITE set_systemInfo_freeSpace_size NOTIFY changed_systemInfo_freeSpace_size)

public:
    explicit DataSource(QQuickView *appViewer, QObject *parent = 0);
    void ChangeDisplayRangeX ( screen_display_max_no range ) ;
    void ChangeDisplayRangeX ( void ) ;
    void ChangeDisplayRangeY ( void ) ;
    void redraw_chart ( void ) ;

    void qml_object_load (void) ;
    void DisplayMinMax ( void ) ;

    ListViewDataModel   lvdm ;
    QString             systemInfo_programVersion ;
    QString             systemInfo_freeSpace_size ;

    QString get_systemInfo_programVersion() const ;
    void    set_systemInfo_programVersion(const QString &qs) ;

    QString get_systemInfo_freeSpace_size() const ;
    void    set_systemInfo_freeSpace_size(const QString &qs) ;

Q_SIGNALS:

signals:
  void changed_systemInfo_programVersion() ;
  void changed_systemInfo_freeSpace_size() ;

public slots:
    void pushQObject_chart (QObject *parent) ;
    void generateData(void);
    void update(QAbstractSeries *series);
    void push(float d);
    void changeDisplayRangeX_qml ( int no ) ;
    void changeMenu( int no ) ;
    void clearViewListdata (void) ;

    void calendarClicked ( const QDate &date ) ;
    void calendarPopup (void) ;

    void usbBackupViewlistdata ( void ) ;

private:
    QQuickView *m_appViewer;
    QVector<QPointF> m_data;
    QTimer *m_pTimer;
    QAbstractAxis * xaxis ;
    QAbstractAxis * yaxis ;

    linechart_live_min_max_tag min_max ;
    int imax_display_range, imid_display_range ;
    screen_display_max_no display_range ;
    int test_value ;

    char xrange_change, yrange_change ;
    QObject * qobject_chart ;

    QObject * text_main_pre_data ;
    QObject * text_main_data ;
    QObject * text_main_min ;
    QObject * text_main_max ;
    QObject * text_main_operation_mode;
    QObject * text_main_operation_period;
    QObject * text_main_heater_temp;
    QObject * text_main_realtime_ndir;
    QObject * text_main_realtime_ndir_peak;
    QObject * text_main_cooler_temp;
    QObject * text_main_air_flowrate;
    QObject * text_main_status;
    QObject * text_main_message;
    QObject * text_main_clock ;

    menu_tag  menu ;
    int       menu_close_cnt ;

    QDate     qCurrentDate ;
    QTime     qCurrentTime ;

    bool      drawenable ;
    QCalendarWidget * cw ;


private slots:
    void on_timer () ;
};

#endif // DATASOURCE_H
