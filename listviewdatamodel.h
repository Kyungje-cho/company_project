#ifndef LISTVIEWDATAMODEL_H
#define LISTVIEWDATAMODEL_H

#include <QObject>
#include <QTime>
#include <QDate>
#include <QtQuick>
#include <QAbstractListModel>
#include <QStringList>

class ListViewData
{
public:
  //  ListViewData ( const QString &year, const double &toc, const double &ndir, const QString &etc ) ;
  ListViewData ( const QDate &date, const QTime &time, const double &toc, const double &ndir, const QString &etc ) ;
  QString year() const ;
  QString toc() const ;
  QString ndir() const ;
  QString etc() const ;
  void setPrecision ( int no ) ;
  int getPrecision ( void ) ;

private:
  //  QString m_year ;
  QDate m_date ;
  QTime m_time ;
  double m_toc ;
  double m_ndir ;
  QString m_etc ;
  int precision ;
};

class ListViewDataModel : public QAbstractListModel
{
  Q_OBJECT
public:
  enum ListViewDataModelRoles {
    YearRole = Qt::UserRole + 1,
    TocRole,
    NdirRole,
    EtcRole
  };

  ListViewDataModel ( QObject *parent = 0) ;
  void addListViewData ( const ListViewData & lvd ) ;
  int rowCount ( const QModelIndex & parent = QModelIndex()) const ;
  QVariant data ( const QModelIndex & index, int role = Qt::DisplayRole) const ;

  bool insertRows(int row, int count, const QModelIndex &parent = QModelIndex());
  bool removeRows(int row, int count, const QModelIndex &parent = QModelIndex());

  void clear (void) ;

  void pushQObject_menu_data_listview (QObject *parent) ;
  void listViewSelect ( int no ) ;

protected:
  QHash<int,QByteArray> roleNames() const ;

private:
  QList<ListViewData> m_listviewdata ;
//  QObject * qobject_menu_data_listview ;

  QObject * listview_popup_menu_data ;
};


#endif // LISTVIEWDATAMODEL_H
