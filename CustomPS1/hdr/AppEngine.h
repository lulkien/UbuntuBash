#ifndef APPENGINE_H
#define APPENGINE_H

#include <QObject>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QFile>
#include "AppModel.h"

class AppEngine : public QQmlApplicationEngine
{
    Q_OBJECT
    QFile m_bashrc;

public:
    AppEngine(QQmlApplicationEngine* parent = nullptr);
    void loadApplication();
    void runApplication();
private:
    QString readBashrc();
};

#endif // APPENGINE_H
