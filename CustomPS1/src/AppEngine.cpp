#include "AppEngine.h"
#include "Constants.h"
#include <QDir>
#include <QString>
#include <QTextStream>
#include <QDebug>

#define db qDebug()

Constants* Constants::m_instance = nullptr;

AppEngine::AppEngine(QQmlApplicationEngine *parent)
    : QQmlApplicationEngine(parent)
    , m_bashrc(DEFS->BASHRC())
{
}

void AppEngine::loadApplication()
{
    // setContext
    this->rootContext()->setContextProperty("AppModel", MODEL);
    this->rootContext()->setContextProperty("Const", DEFS);

    // setContent
    MODEL->setBashrcText(readBashrc());
}

void AppEngine::runApplication()
{
    this->load(DEFS->MAIN_URL());
}

QString AppEngine::readBashrc()
{
    QString data;
    if (m_bashrc.open(QIODevice::ReadOnly | QIODevice::Text))
    {
        if (m_bashrc.size() > DEFS->SIZE_50MB()) return "File is too big";
        QTextStream stream(&m_bashrc);
        db << m_bashrc.size();
        data = stream.readAll();
    }
    else
    {
        // do nothing
    }

    return data;
}
