#ifndef APPMODEL_H
#define APPMODEL_H

#include <QObject>


#define MODEL AppModel::getIntance()
class AppModel : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString bashrcText READ bashrcText WRITE setBashrcText NOTIFY bashrcTextChanged)
public:
    static AppModel* getIntance();
    ~AppModel();
    QString bashrcText() const;

public slots:
    void setBashrcText(QString bashrcText);

signals:
    void bashrcTextChanged();

private:
    AppModel(QObject* parent = nullptr) : QObject(parent) {}
    static AppModel* m_instance;
    QString m_bashrcText;
};

#endif // APPMODEL_H
