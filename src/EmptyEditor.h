//
// Created by Jens Lindahl on 2019-05-26.
//

#ifndef DAFXJUCE_EMPTYEDITOR_H
#define DAFXJUCE_EMPTYEDITOR_H

#include "../JuceLibraryCode/JuceHeader.h"
#include "EditorBase.h"

class EmptyEditor : public Component
{
public:
    EmptyEditor()
    {
        setSize(0,0);
        infoString = "";
    }
    EmptyEditor(const String& info)
    {
        setSize(300, 200);
        infoString = info;
    }
    ~EmptyEditor()
    {
    }

    void paint(Graphics &g) override
    {
        g.fillAll(Colours::transparentBlack);

        g.setColour(Colours::grey);
        g.drawRect(getLocalBounds(), 1); // draw an outline around the component

        g.setColour(Colours::white);
        g.setFont(15.0f);
        g.drawFittedText(infoString, getLocalBounds(), Justification::centred, 1);
    }
    void resized() override
    {
    }

private:
    String infoString;

    JUCE_DECLARE_NON_COPYABLE_WITH_LEAK_DETECTOR(EmptyEditor)
};

#endif //DAFXJUCE_EMPTYEDITOR_H
