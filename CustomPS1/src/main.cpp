#include <QGuiApplication>
#include "AppEngine.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    AppEngine engine;
    engine.loadApplication();
    engine.runApplication();

    return app.exec();
}
