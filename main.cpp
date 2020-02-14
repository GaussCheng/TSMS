#include <QApplication>
//#include <QQmlApplicationEngine>
#include <QQmlEngine>
#include <QQuickView>
#include <QTranslator>
#include <QDebug>

int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QApplication app(argc, argv);
//    QTranslator tr;
//    tr.load(QStringLiteral("qrc:/TSMS_zh_CN.qm"));
//    app.installTranslator(&tr);

//    QQmlApplicationEngine engine;

//    const QUrl url(QStringLiteral("qrc:/main.qml"));
//    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
//                     &app, [url](QObject *obj, const QUrl &objUrl) {
//        if (!obj && url == objUrl)
//            QCoreApplication::exit(-1);
//    }, Qt::QueuedConnection);
//    engine.load(url);

    QQuickView viewer;
//#ifdef Q_OS_WIN
//    QString extraImportPath(QStringLiteral("%1/../../../../%2"));
//#else
//    QString extraImportPath(QStringLiteral("%1/../../../%2"));
//#endif
//    viewer.engine()->addImportPath(extraImportPath.arg(QGuiApplication::applicationDirPath(),
//                                      QString::fromLatin1("qml")));
    QObject::connect(viewer.engine(), &QQmlEngine::quit, &viewer, &QWindow::close);
    viewer.setTitle("TSMS");
    viewer.setSource(QUrl("qrc:/main.qml"));
    viewer.setResizeMode(QQuickView::SizeRootObjectToView);
    viewer.setColor(QColor("#404040"));
    viewer.show();
    return app.exec();
}