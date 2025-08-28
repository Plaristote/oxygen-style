#pragma once
#include <QPainter>
#include <QQuickPaintedItem>
#include <QQuickWindow>

class OxygenHelper;
class QQuickWindow;

class OxygenGradientBackground : public QQuickPaintedItem
{
    Q_OBJECT
    QML_ELEMENT
    Q_PROPERTY(QQuickWindow *window MEMBER _window NOTIFY windowChanged)
    Q_PROPERTY(QColor color MEMBER _color NOTIFY colorChanged)
public:
    OxygenGradientBackground(QQuickItem *parent = nullptr);

    Q_INVOKABLE void initialize(QObject *);

protected:
    virtual void paint(QPainter *painter) override;

signals:
    void windowChanged();
    void colorChanged();

private:
    OxygenHelper *_helper;
    QQuickWindow *_window;
    QColor _color;
};
