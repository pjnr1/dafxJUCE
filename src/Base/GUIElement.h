#ifndef DAFXJUCE_GUIELEMENT_H
#define DAFXJUCE_GUIELEMENT_H


class GUIElement : public Component
{
public:
    struct {
        int width;
        int height;
    } minSize;

    void setSize(int width, int height) {
        minSize.width = width;
        minSize.height = height;
        Component::setSize(width, height);
    }

    int getMinWidth() {
        return minSize.width;
    }

    int getMinHeight() {
        return minSize.height;
    }

};

#endif //DAFXJUCE_GUIELEMENT_H
