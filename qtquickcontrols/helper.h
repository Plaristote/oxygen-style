#pragma once
#include "../liboxygen/oxygenhelper.h"
#include <QPainter>
#include <qqml.h>

class OxygenHelper : public QObject
{
    Q_OBJECT
    QML_SINGLETON
    QML_ELEMENT

    Q_PROPERTY(bool useBackgroundGradient READ useBackgroundGradient NOTIFY styleChanged)
    Q_PROPERTY(QString menuHighlightMode READ menuHighlightMode NOTIFY styleChanged)
public:
    OxygenHelper(QObject *parent = nullptr);

    Q_INVOKABLE QColor backgroundRadialColor(const QColor &);

    bool useBackgroundGradient() const;
    QString menuHighlightMode() const;
    void renderWindowBackground(QPainter *, const QRectF &clipRect, const QRectF &windowRect, const QColor &);

signals:
    void styleChanged();

private:
    KSharedConfigPtr _config;
    std::unique_ptr<Oxygen::Helper> _helper;
};
