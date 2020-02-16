#ifndef BATTERYSTATUSTABLEMODEL_H
#define BATTERYSTATUSTABLEMODEL_H

#include <QAbstractTableModel>
#include <QDebug>
#include <QString>

class BatteryStatusTableModel : public QAbstractTableModel
{
    Q_OBJECT
    Q_PROPERTY(int rCount READ rCount WRITE setRCount NOTIFY rCountChanged)
    Q_PROPERTY(int cCount READ cCount WRITE setCCount NOTIFY cCountChanged)
signals:
    void rCountChanged(int);
    void cCountChanged(int);
public:
    BatteryStatusTableModel();


    void resizeTableData()
    {
        batteryStatusTable.clear();
        QVariantMap zero;
        zero.insert("maxTemp", 0);
        zero.insert("minTemp", 0);
        zero.insert("avgTemp", 0);

        for(int i = 0; i < rCount_; ++i)
        {
//            batteryStatusTable[i].reserve(cCount());
            QVariantList v;
            for(int j = 0; j < cCount_; ++j)
            {
                v.push_back(zero);
            }
            batteryStatusTable.push_back(v);
        }
//        qDebug()<<"size"<<batteryStatusTable.size();
        endResetModel();
    }
    int rCount() const { return rCount_;}
    void setRCount(int count) { rCount_ = count;resizeTableData();emit rCountChanged(rCount_);}

    int cCount() const { return cCount_;}
    void setCCount(int count) { cCount_ = count;resizeTableData();emit cCountChanged(cCount_);}

    int rowCount(const QModelIndex & = QModelIndex()) const override
    {
        return rCount();
    }

    int columnCount(const QModelIndex & = QModelIndex()) const override
    {
        return cCount();
    }

    QVariant data(const QModelIndex &index, int role) const override
    {
//        qDebug()<<"get data"<<role<<batteryStatusTable.size();
        if(index.row() >=  batteryStatusTable.size()) return QVariant();
        if(index.column() >= batteryStatusTable.at(index.row()).size()) return QVariant();
        switch (role) {
        case Qt::DisplayRole:
        {
            QVariantMap v = batteryStatusTable.at(index.row()).at(index.column()).toMap();

            return QString("{\"maxTemp\":%1,\"minTemp\":%2,\"avgTemp\":%3}")
                    .arg(v.value("maxTemp").toDouble())
                    .arg(v.value("minTemp").toDouble())
                    .arg(v.value("avgTemp").toDouble());
        }
        default:
            break;
        }

        return QVariant();
    }

    QHash<int, QByteArray> roleNames() const override
    {
        return { {Qt::DisplayRole, "display"} };
    }
private:
    int rCount_;
    int cCount_;
    QList<QVariantList> batteryStatusTable;
};

#endif // BATTERYSTATUSTABLEMODEL_H
