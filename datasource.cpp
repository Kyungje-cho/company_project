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

#include "datasource.h"
#include <QtCharts/QAreaSeries>
#include <QtQuick/QQuickView>
#include <QtQuick/QQuickItem>
#include <QtCore/QDebug>
#include <QtCore/QRandomGenerator>
#include <QtCore/QtMath>
#include <QMetaObject>
#include <QCalendarWidget>
#include <QMessageBox>

QT_CHARTS_USE_NAMESPACE

Q_DECLARE_METATYPE(QAbstractSeries *)
Q_DECLARE_METATYPE(QAbstractAxis *)


void DataSource::usbBackupViewlistdata ( void )
{
  QMessageBox msgbox ;
  msgbox.setText("USB로 데이타를 백업하시겠습니까?") ;
  msgbox.setStandardButtons(QMessageBox::Ok | QMessageBox::Cancel ) ;
  msgbox.setDefaultButton(QMessageBox::Ok) ;
  if ( msgbox.exec() == QMessageBox::Ok )
  {
    qDebug() << "Ok" ;
  }
}

void DataSource::calendarClicked ( const QDate &date )
{
  qDebug() << date.toString() ;
  cw->close() ;
}

void DataSource::calendarPopup (void)
{
  cw = new QCalendarWidget ;
  cw->setMinimumDate(QDate(2020,1,1)) ;
  cw->setMaximumDate(QDate(2040,1,1)) ;
  cw->setGridVisible(true);
  cw->setVerticalHeaderFormat(QCalendarWidget::NoVerticalHeader);
  cw->setSelectionMode(QCalendarWidget::SingleSelection);
  connect(cw, SIGNAL(clicked(const QDate &)), this, SLOT(calendarClicked(const QDate &)));
  cw->hide() ;
  cw->setWindowModality(Qt::ApplicationModal);
  cw->show() ;
}

void DataSource::clearViewListdata (void)
{
  lvdm.clear() ;
  for ( int i = 0 ; i < 100 ; i++ )
  {
    lvdm.addListViewData(ListViewData(QDate(2020,2,1), QTime(10,((int)(i/60))%60,i%60),i,i/10.,"")) ;
  }
  lvdm.listViewSelect(99) ;
}

DataSource::DataSource(QQuickView *appViewer, QObject *parent) :
    QObject(parent),
    m_appViewer(appViewer)
{
    qRegisterMetaType<QAbstractSeries*>();
    qRegisterMetaType<QAbstractAxis*>();

    drawenable = false ;

    xaxis = nullptr ;
    yaxis = nullptr ;
    xrange_change = yrange_change = 1 ;

    display_range = screen_display_1m ;
    imax_display_range = 10 ;

    test_value = 0 ;

    generateData();

    ChangeDisplayRangeY() ;

    m_pTimer = new QTimer ;
    m_pTimer->setTimerType(Qt::PreciseTimer) ;
    connect(m_pTimer, &QTimer::timeout, this, &DataSource::on_timer );
    m_pTimer->start(100) ;
}

void DataSource::changeMenu ( int no )
{

}

void DataSource::qml_object_load (void)
{
//  QString version ;

  text_main_pre_data = m_appViewer->findChild<QObject *>("text_main_pre_data");
  text_main_data = m_appViewer->findChild<QObject *>("text_main_data");
  text_main_min = m_appViewer->findChild<QObject *>("text_main_min");
  text_main_max = m_appViewer->findChild<QObject *>("text_main_max");

  text_main_operation_mode = m_appViewer->findChild<QObject *>("text_main_operation_mode");
  text_main_operation_period = m_appViewer->findChild<QObject *>("text_main_operation_period");
  text_main_heater_temp = m_appViewer->findChild<QObject *>("text_main_heater_temp");
  text_main_realtime_ndir = m_appViewer->findChild<QObject *>("text_main_realtime_ndir");
  text_main_realtime_ndir_peak = m_appViewer->findChild<QObject *>("text_main_realtime_ndir_peak");
  text_main_cooler_temp = m_appViewer->findChild<QObject *>("text_main_cooler_temp");
  text_main_air_flowrate = m_appViewer->findChild<QObject *>("text_main_air_flowrate");
  text_main_status = m_appViewer->findChild<QObject *>("text_main_status");
  text_main_message = m_appViewer->findChild<QObject *>("text_main_message");
  text_main_clock = m_appViewer->findChild<QObject *>("text_main_clock");

  text_main_pre_data->setProperty("text",1.2) ;
  text_main_data->setProperty("text",1.3) ;
  text_main_min->setProperty("text",1.1) ;
  text_main_max->setProperty("text",100.3) ;

  text_main_operation_mode->setProperty("text",1) ;
  text_main_operation_period->setProperty("text",2) ;
  text_main_heater_temp->setProperty("text",3) ;
  text_main_realtime_ndir->setProperty("text",4) ;
  text_main_realtime_ndir_peak->setProperty("text",5) ;
  text_main_cooler_temp->setProperty("text",6) ;
  text_main_air_flowrate->setProperty("text",7) ;
  text_main_status->setProperty("text",8) ;
  text_main_message->setProperty("text",9) ;

  QObject * text_main_pre_data_test_string = m_appViewer->findChild<QObject *>("main");
  text_main_pre_data_test_string->setProperty("text_main_pre_data_test_string","12.34");

  systemInfo_programVersion = QString( __DATE__ ) + " " + QString( __TIME__ ) ;
  systemInfo_freeSpace_size = QString("68,024,164") ;

  lvdm.pushQObject_menu_data_listview(m_appViewer->findChild<QObject *>("listView_popup_menu_data")) ;
  for ( int i = 0 ; i < 1000 ; i++ )
  {
    lvdm.addListViewData(ListViewData(QDate(2022,1,25), QTime(18,((int)(i/60))%60,i%60),i,i/10.,"")) ;
  }
  lvdm.listViewSelect(99) ;

  drawenable = true ;
}


void DataSource::pushQObject_chart (QObject *parent)
{
  qobject_chart = parent ;
}

void DataSource::redraw_chart()
{
  QMetaObject::invokeMethod( qobject_chart, "redraw_chart" ) ;
}

void DataSource::on_timer ()
{
//  static int i ;
  static bool sign = false ;

  push (test_value) ;

  if ( sign == false )
  {
    test_value += 10 ;
    if ( test_value > 4000 )
      sign = true ;
  }
  else
  {
    test_value -= 9 ;
    if ( test_value < 0 )
    {
      test_value = 2 ;
      sign = false ;
    }
  }

  redraw_chart() ;

  QTime qtime = QTime::currentTime() ;
  if ( qtime.second() != qCurrentTime.second() )
  {
    qCurrentTime = qtime ;
    qCurrentDate = QDate::currentDate() ;
    text_main_clock->setProperty("text",qCurrentTime.toString("hh:mm:ss")) ;
  }
}

void DataSource::changeDisplayRangeX_qml ( int no )
{
  display_range = (screen_display_max_no)((int)screen_display_1m - no) ;
  xrange_change = 1 ;
}


void DataSource::ChangeDisplayRangeX ( screen_display_max_no range )
{
  display_range = range ;
  xrange_change = 1 ;
}

void DataSource::DisplayMinMax ( void )
{

}

void DataSource::ChangeDisplayRangeX ( void )
{
  float min = 0, max = 0 ;
  if ( xaxis == nullptr )
    return ;
  if ( xrange_change == 0 )
  {
    if ( drawenable == true)
    {
      switch ( display_range )
      {
      case screen_display_10m :
        min = min_max.mm_600.min ;
        max = min_max.mm_600.max ;
        min_max.mm_600.change_flag = false ;
        break ;

      case screen_display_7_5m :
        min = min_max.mm_450.min ;
        max = min_max.mm_450.max ;
        min_max.mm_450.change_flag = false ;
        break ;

      case screen_display_5m :
        xaxis->setMin(-300) ;
        min = min_max.mm_300.min ;
        max = min_max.mm_300.max ;
        min_max.mm_300.change_flag = false ;
        break ;

      case screen_display_1m :
        xaxis->setMin(-60) ;
        min = min_max.mm_60.min ;
        max = min_max.mm_60.max ;
        min_max.mm_60.change_flag = false ;
        break ;
      }
      text_main_min->setProperty("text",min) ;
      text_main_max->setProperty("text",max) ;
    }
    return ;
  }
  xrange_change = 0 ;

  switch ( display_range )
  {
  case screen_display_10m :
    xaxis->setMin(-600) ;
    min = min_max.mm_600.min ;
    max = min_max.mm_600.max ;
    if ( drawenable != true) return ;
    min_max.mm_600.change_flag = false ;
    break ;

  case screen_display_7_5m :
    xaxis->setMin(-450) ;
    min = min_max.mm_450.min ;
    max = min_max.mm_450.max ;
    if ( drawenable != true) return ;
    min_max.mm_450.change_flag = false ;
    break ;

  case screen_display_5m :
    xaxis->setMin(-300) ;
    min = min_max.mm_300.min ;
    max = min_max.mm_300.max ;
    if ( drawenable != true) return ;
    min_max.mm_300.change_flag = false ;
    break ;

  case screen_display_1m :
    xaxis->setMin(-60) ;
    min = min_max.mm_60.min ;
    max = min_max.mm_60.max ;
    if ( drawenable != true) return ;
    min_max.mm_60.change_flag = false ;
    break ;
  }

  if ( drawenable == true)
  {
    text_main_min->setProperty("text",min) ;
    text_main_max->setProperty("text",max) ;
  }
}

void DataSource::ChangeDisplayRangeY ( void )
{
  float fmax ;
  int imax ;
  char change = 0 ;

  switch ( display_range )
  {
  case screen_display_10m :
    fmax = min_max.mm_600.max  ;
    break ;

  case screen_display_7_5m :
    fmax = min_max.mm_450.max  ;
    break ;

  case screen_display_5m :
    fmax = min_max.mm_300.max  ;
    break ;

  default:
    fmax = min_max.mm_60.max  ;
    break ;
  }

  if ( fmax > imax_display_range )
  {
    imax = fmax / 10 ;
    imax = ( imax + 1 ) * 10 ;
    if ( imax > 100000 )
      imax = 100000 ;
    if ( imax != imax_display_range)
    {
      imax_display_range = imax ;
      change = 1 ;
    }
  }
  else
  {
    if ( fmax < ( imax_display_range / 2 ) )
    {
      imax = fmax / 10 ;
      imax = ( imax + 1 ) * 10 ;
      if ( imax < 10 )
        imax = 10 ;

      if ( imax != imax_display_range)
      {
        imax_display_range = imax ;
        change = 1 ;
      }
    }
  }

  if ( change )
  {
    yrange_change = 1 ;
  }
}


void DataSource::push(float d)
{
  int i, j ;
  float f ;

  linechart_min_max_tag mm_600 = { 0, 999999999., false};
  linechart_min_max_tag mm_450 = { 0, 999999999., false};
  linechart_min_max_tag mm_300 = { 0, 999999999., false};
  linechart_min_max_tag mm_60 = { 0, 999999999., false};

  for ( i = 0, j = 1 ; i < 1200 ; i++, j++ )
  {
    m_data.replace(i, QPointF( m_data.at(i).x(), m_data.at(j).y() )) ;
  }
  m_data.replace(i, QPointF( m_data.at(i).x(), d )) ;

  for ( i = 0 ; i < (600*2-450*2+1) ; i++ )
  {
    f = m_data.at(i).y() ;
    if ( mm_600.min > f ) mm_600.min = f ;
    if ( mm_600.max < f ) mm_600.max = f ;
  }

  for ( ; i < (600*2-300*2+1) ; i++ )
  {
    f = m_data.at(i).y() ;
    if ( mm_450.min > f ) mm_450.min = f ;
    if ( mm_450.max < f ) mm_450.max = f ;
  }

  for ( ; i < (600*2-60*2+1) ; i++ )
  {
    f = m_data.at(i).y() ;
    if ( mm_300.min > f ) mm_300.min = f ;
    if ( mm_300.max < f ) mm_300.max = f ;
  }

  for ( ; i < 1201 ; i++ )
  {
    f = m_data.at(i).y() ;
    if ( mm_60.min > f ) mm_60.min = f ;
    if ( mm_60.max < f ) mm_60.max = f ;
  }

  if ( mm_60.min < mm_300.min )
  {
    mm_300.min = mm_60.min ;
  }

  if ( mm_60.max > mm_300.max )
  {
    mm_300.max = mm_60.max ;
  }

  if ( mm_300.min < mm_450.min )
  {
    mm_450.min = mm_300.min ;
  }

  if ( mm_300.max > mm_450.max )
  {
    mm_450.max = mm_300.max ;
  }

  if ( mm_450.min < mm_600.min )
  {
    mm_600.min = mm_450.min ;
  }

  if ( mm_450.max > mm_600.max )
  {
    mm_600.max = mm_450.max ;
  }

  if ( min_max.mm_600.min != mm_600.min || min_max.mm_600.max != mm_600.max )
  {
    min_max.mm_600.min = mm_600.min ;
    if ( min_max.mm_600.max != mm_600.max )
    {
      min_max.mm_600.max = mm_600.max ;
      if ( drawenable == true)
        text_main_realtime_ndir_peak->setProperty("text",mm_600.max) ;
    }
    min_max.mm_600.change_flag = true ;
  }

  if ( min_max.mm_450.min != mm_450.min || min_max.mm_450.max != mm_450.max )
  {
    min_max.mm_450.min = mm_450.min ;
    min_max.mm_450.max = mm_450.max ;
    min_max.mm_450.change_flag = true ;
  }

  if ( min_max.mm_300.min != mm_300.min || min_max.mm_300.max != mm_300.max )
  {
    min_max.mm_300.min = mm_300.min ;
    min_max.mm_300.max = mm_300.max ;
    min_max.mm_300.change_flag = true ;
  }

  if ( min_max.mm_60.min != mm_60.min || min_max.mm_60.max != mm_60.max )
  {
    min_max.mm_60.min = mm_60.min ;
    min_max.mm_60.max = mm_60.max ;
    min_max.mm_60.change_flag = true ;
  }

  ChangeDisplayRangeY() ;

  if ( drawenable == true)
  {
    text_main_realtime_ndir->setProperty("text",d) ;
  }
}

void DataSource::update(QAbstractSeries *series)
{
  if (series) {
    QXYSeries * xySeries = static_cast<QXYSeries *>(series);

    QList<QAbstractAxis *> axes = xySeries->attachedAxes();
    QAbstractAxis * xy ;
    foreach ( xy, axes )
    {
      if ( xy->orientation() == Qt::Horizontal )
      {
        xaxis = xy ;
      }
      else if ( xy->orientation() == Qt::Vertical )
      {
        yaxis = xy ;
      }
    }
    ChangeDisplayRangeX() ;
    if ( yrange_change )
    {
      yrange_change = 0 ;
      if ( yaxis != nullptr )
        yaxis->setMax(imax_display_range) ;
    }
    xySeries->replace(m_data);
  }
}

void DataSource::generateData(void)
{
  int i, j ;//, k ;
  m_data.clear();

  m_data.reserve(1201);
  for ( i = 0, j = -1200 ; i < 1201 ; i++, j++ )
  {
    m_data.append(QPointF(j/2., i%100));
  }

  min_max.mm_600.min = min_max.mm_600.max = 0 ;
  min_max.mm_600.change_flag = false ;
  min_max.mm_450.min = min_max.mm_450.max = 0 ;
  min_max.mm_450.change_flag = false ;
  min_max.mm_300.min = min_max.mm_300.max = 0 ;
  min_max.mm_300.change_flag = false ;
  min_max.mm_60.min = min_max.mm_60.max = 0 ;
  min_max.mm_60.change_flag = false ;
}



QString DataSource::get_systemInfo_programVersion() const
{
  return systemInfo_programVersion ;
}

void    DataSource::set_systemInfo_programVersion(const QString &qs)
{
  systemInfo_programVersion = qs ;

  emit changed_systemInfo_programVersion() ;
}

QString DataSource::get_systemInfo_freeSpace_size() const
{
  return systemInfo_freeSpace_size ;
}

void    DataSource::set_systemInfo_freeSpace_size(const QString &qs)
{
  systemInfo_freeSpace_size = qs ;

  emit changed_systemInfo_freeSpace_size() ;
}


