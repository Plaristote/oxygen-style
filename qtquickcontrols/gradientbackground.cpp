#include "gradientbackground.h"
#include "helper.h"

OxygenGradientBackground::OxygenGradientBackground(QQuickItem *parent)
    : QQuickPaintedItem(parent)
    , _helper(nullptr)
{
    setVisible(false);
}

void OxygenGradientBackground::initialize(QObject *abstractQmlHelper)
{
    _helper = qobject_cast<OxygenHelper *>(abstractQmlHelper);
    if (_helper)
        setVisible(true);
}

void OxygenGradientBackground::paint(QPainter *painter)
{
    if (_helper)
        _helper->renderWindowBackground(painter, boundingRect(), _color);
}
