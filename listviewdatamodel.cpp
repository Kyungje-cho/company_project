#include "listviewdatamodel.h"


void ListViewData::setPrecision ( int no )
{
  precision = no ;
}

int ListViewData::getPrecision ( void )
{
  return precision ;
}

ListViewData::ListViewData ( const QDate &date, const QTime &time, const double &toc, const double &ndir, const QString &etc ):m_date(date),m_time(time), m_toc(toc), m_ndir(ndir), m_etc(etc)
{
  precision = 3 ;
}

QString ListViewData::year() const
{
  return m_date.toString("yyyy-MM-dd") + " " + m_time.toString("hh:mm:ss") ;
  //  return m_year ;
}
QString ListViewData::toc() const
{
  return QString::number( m_toc, 'f', precision ) ;
}
QString ListViewData::ndir() const
{
  return QString::number( m_ndir, 'f', precision ) ; //m_ndir ;
}
QString ListViewData::etc() const
{
  return m_etc ;
}


void ListViewDataModel::listViewSelect ( int no )
{
  if ( listview_popup_menu_data != nullptr )
  {
    if ( no >= m_listviewdata.count() )
      no = m_listviewdata.count() -1 ;
    listview_popup_menu_data->setProperty("currentIndex",no) ;
  }
}



void ListViewDataModel::pushQObject_menu_data_listview (QObject *parent)
{
  listview_popup_menu_data = parent ;
}


ListViewDataModel::ListViewDataModel ( QObject *parent ): QAbstractListModel(parent)
{
  listview_popup_menu_data = nullptr ;
  clear() ;
}

void ListViewDataModel::addListViewData ( const ListViewData & lvd )
{
  beginInsertRows(QModelIndex(), rowCount(), rowCount()) ;
  m_listviewdata << lvd ;
  endInsertRows();
}

int ListViewDataModel::rowCount ( const QModelIndex & parent ) const
{
  Q_UNUSED(parent) ;
  return m_listviewdata.count();
}

QVariant ListViewDataModel::data ( const QModelIndex & index, int role) const
{
  if ( index.row() < 0 || index.row() >= m_listviewdata.count() )
    return QVariant() ;

  const ListViewData & lvd = m_listviewdata[index.row()] ;
  if ( role == YearRole )
    return lvd.year() ;
  else if ( role == TocRole )
    return lvd.toc() ;
  else if ( role == NdirRole )
    return lvd.ndir() ;
  else if ( role == EtcRole )
    return lvd.etc() ;

  return QVariant() ;
}

QHash<int, QByteArray> ListViewDataModel::roleNames() const {
  QHash<int, QByteArray> roles;
  roles[YearRole] = "text_popup_menu_data_date";
  roles[TocRole] = "text_popup_menu_data_toc";
  roles[NdirRole] = "text_popup_menu_data_ndir";
  roles[EtcRole] = "text_popup_menu_data_etc";
  return roles;
}

void ListViewDataModel::clear (void)
{
  removeRows(0,m_listviewdata.length()) ;
  m_listviewdata.clear() ;
  m_listviewdata.reserve(175200) ;// 5 year
}


bool ListViewDataModel::insertRows(int row, int count, const QModelIndex & /*parent*/) {

  // Check bounds
  if (row < 0 || count < 0) {
    return false;
  }

  if (count == 0) {
    return true;
  }

  if (row > rowCount()) {
    row = rowCount();
  }

  beginInsertRows(QModelIndex(), row, row+count-1);
  endInsertRows();

  return true;
}

bool ListViewDataModel::removeRows(int row, int count, const QModelIndex & /*parent*/) {

  // Check bounds
  if (row < 0 || count < 0 || rowCount() <= 0) {
    return false;
  }

  if (count == 0) {
    return true;
  }

  if (row >= rowCount()) {
    row = rowCount() - 1;
  }

  beginRemoveRows(QModelIndex(), row, row+count-1);
  endRemoveRows();

  return true;
}
