#ifndef BATTERYSTATUSTABLEMODEL_H
#define BATTERYSTATUSTABLEMODEL_H

#include <QAbstractTableModel>

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
        batteryStatusTable.reserve(rCount());
        for(int i = 0; i < batteryStatusTable.size(); ++i)
        {
            batteryStatusTable[i].reserve(cCount());
        }
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
        switch (role) {
        case Qt::DisplayRole:
            return batteryStatusTable.at(index.row()).at(index.column());
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
