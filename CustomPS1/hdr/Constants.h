#ifndef CONSTANTS_H
#define CONSTANTS_H

#include <QObject>
#include <QString>
#include <QColor>
#include <QUrl>
#include <QDir>
#include "AppModel.h"

#ifndef DEFINE_MACRO
#define DEFINE_MACRO

#define DEF_CONST(type, name, value) Q_PROPERTY(type name READ name CONSTANT) \
    public: type name() const { return value; }
#define DEF_VAR(type, name, value) Q_PROPERTY(type name READ name NOTIFY dataUpdate) \
    public: type name() { return value; }

#endif

#define DEFS Constants::getIntance()
class Constants : public QObject
{
    Q_OBJECT
    Constants(QObject* parent = nullptr) : QObject(parent) {}
    static Constants* m_instance;
public:
    static Constants* getIntance()
    {
        if (nullptr == m_instance)
        {
            m_instance = new Constants;
        }
        return m_instance;
    }
    ~Constants()
    {
        if (nullptr != m_instance)
        {
            delete m_instance;
        }
        m_instance = nullptr;
    }
signals:
    void dataUpdate();

private:
    DEF_CONST(QUrl          , MAIN_URL              , QStringLiteral("qrc:/qml/main.qml"))
    DEF_CONST(QString       , HOME_PATH             , QDir::homePath())
    DEF_CONST(QString       , BASHRC                , HOME_PATH() + "/.bashrc")

    DEF_CONST(int           , SIZE_50MB             , 50000000)
};

#endif // CONSTANTS_H
