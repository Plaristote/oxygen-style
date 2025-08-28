#pragma once
#include <QPainter>
#include <QQuickPaintedItem>

class OxygenHelper;

class OxygenGradientBackground : public QQuickPaintedItem
{
    Q_OBJECT
    QML_ELEMENT
    Q_PROPERTY(QColor color MEMBER _color NOTIFY colorChanged)
public:
    OxygenGradientBackground(QQuickItem *parent = nullptr);

    Q_INVOKABLE void initialize(QObject *);

protected:
    virtual void paint(QPainter *painter) override;

signals:
    void colorChanged();

private:
    OxygenHelper *_helper;
    QColor _color;
};
