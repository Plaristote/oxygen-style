#include "helper.h"
#include <KConfigGroup>

OxygenHelper::OxygenHelper(QObject *parent)
    : QObject(parent)
{
    _config = KSharedConfig::openConfig(QStringLiteral("oxygenrc"));
    _helper.reset(new Oxygen::Helper(_config));
}

QColor OxygenHelper::backgroundRadialColor(const QColor &color)
{
    return _helper->backgroundRadialColor(color);
}

bool OxygenHelper::useBackgroundGradient() const
{
    return _config->group("Common").readEntry("UseBackgroundGradient", true);
}

QString OxygenHelper::menuHighlightMode() const
{
    return _config->group("Style").readEntry("MenuHighlightMode", "MM_DARK");
}

int OxygenHelper::windowDecorationHeight() const
{
    const double gridUnit = 20;
    const QString buttonSize = _config->group("Windeco").readEntry("ButtonSize", "ButtonDefault");
    const QMap<QString, double> ratios{{"ButtonSmall", 1.5}, {"ButtonDefault", 2.0}, {"ButtonLarge", 2.5}, {"ButtonVeryLarge", 3.5}};
    auto it = ratios.find(buttonSize);

    return it != ratios.end() ? static_cast<int>((gridUnit + 2) * it.value()) : 33;
}

void OxygenHelper::renderWindowBackground(QPainter *painter, const QRectF &rect, const QColor &color)
{
    _helper->renderWindowBackground(painter, rect, rect, color, 0);
}
