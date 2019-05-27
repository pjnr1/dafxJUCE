#ifndef DAFXJUCE_GAIN_COMPONENT_H
#define DAFXJUCE_GAIN_COMPONENT_H

#include "../JuceLibraryCode/JuceHeader.h"
#include "EditorBase.h"

class GainEditor : public Component
{
public:
    GainEditor();
    ~GainEditor();

    void paint(Graphics &) override;
    void resized() override;

private:
    JUCE_DECLARE_NON_COPYABLE_WITH_LEAK_DETECTOR(GainEditor)
};

#endif //DAFXJUCE_GAIN_COMPONENT_H
