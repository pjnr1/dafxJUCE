//
// Created by Jens Lindahl on 2019-05-26.
//

#ifndef DAFXJUCE_EMPTYEDITOR_H
#define DAFXJUCE_EMPTYEDITOR_H

#include "../JuceLibraryCode/JuceHeader.h"

class EmptyEditor : public Component
{
public:
    Component();
    ~Component();

    void paint(Graphics &g) override {
        g.fillAll(Colours::transparentBlack);

        g.setColour(Colours::grey);
        g.drawRect(getLocalBounds(), 1);   // draw an outline around the component
    }
    void resized() override {

    }

private:
    JUCE_DECLARE_NON_COPYABLE_WITH_LEAK_DETECTOR(GainEditor)
};

#endif //DAFXJUCE_EMPTYEDITOR_H
