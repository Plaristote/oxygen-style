#include "helper.h"
#include <KColorUtils>
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

QColor OxygenHelper::menuHighlightColor(const QColor &base) const
{
    const QString mode = menuHighlightMode();
    const QPalette palette;

    if (mode == "MM_STRONG")
        return palette.color(QPalette::Highlight);
    if (mode == "MM_SUBTLE")
        return KColorUtils::mix(base, KColorUtils::tint(base, palette.color(QPalette::Highlight), 0.6));
    return base;
}

void OxygenHelper::renderWindowBackground(QPainter *painter, const QRectF &clipRect, const QRectF &windowRect, const QColor &color)
{
    _helper->renderWindowBackground(painter, clipRect, windowRect, color, -20);
}
