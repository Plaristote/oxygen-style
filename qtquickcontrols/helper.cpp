#include "helper.h"
#include <KConfigGroup>

OxygenHelper::OxygenHelper(QObject *parent)
    : QObject(parent)
{
    _config = KSharedConfig::openConfig(QStringLiteral("oxygenrc"));
    _helper.reset(new Oxygen::Helper(_config));
}

bool OxygenHelper::useBackgroundGradient() const
{
    return _config->group("Common").readEntry("UseBackgroundGradient", true);
}

QString OxygenHelper::menuHighlightMode() const
{
    return _config->group("Style").readEntry("MenuHighlightMode", "MM_DARK");
}

void OxygenHelper::renderWindowBackground(QPainter *painter, const QRectF &clipRect, const QRectF &windowRect, const QColor &color)
{
    _helper->renderWindowBackground(painter, clipRect, windowRect, color, -20);
}
