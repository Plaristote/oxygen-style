#include "gradientbackground.h"
#include "helper.h"

OxygenGradientBackground::OxygenGradientBackground(QQuickItem *parent)
    : QQuickPaintedItem(parent)
    , _helper(nullptr)
    , _window(nullptr)
{
    setVisible(false);
    connect(this, &OxygenGradientBackground::colorChanged, this, [this]() {
        update();
    });
}

void OxygenGradientBackground::initialize(QObject *abstractQmlHelper)
{
    _helper = qobject_cast<OxygenHelper *>(abstractQmlHelper);
    if (_helper)
        setVisible(true);
}

void OxygenGradientBackground::paint(QPainter *painter)
{
    if (_helper && _window) {
        const QMargins frameMargins = _window->frameMargins();
        const QPointF mappedPos = mapToScene(QPointF(0, 0)) + QPointF(frameMargins.left(), frameMargins.top());
        const QRectF windowRect(0,
                                0,
                                _window->width() + frameMargins.left() + frameMargins.right(),
                                _window->height() + frameMargins.top() + frameMargins.bottom());
        const QRectF r = windowRect.translated(-mappedPos);

        _helper->renderWindowBackground(painter, boundingRect(), r, _color);
    }
}
