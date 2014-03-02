#include <QtGui/QGuiApplication>
#include "qtquick2applicationviewer.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QtQuick2ApplicationViewer viewer;
    viewer.setMainQmlFile(QStringLiteral("qml/EcranIFAG/main.qml"));
//    viewer.showExpanded();
    viewer.showFullScreen();

    return app.exec();
}
