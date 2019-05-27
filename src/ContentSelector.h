#ifndef DAFXJUCE_CONTENTSELECTOR_H
#define DAFXJUCE_CONTENTSELECTOR_H

#include "../JuceLibraryCode/JuceHeader.h"

class ContentSelector : public Component
{
public:
    ContentSelector();
    ~ContentSelector();

    void paint(Graphics &) override;
    void resized() override;

    ToggleButton* getReferenceToBypass();
    ComboBox* getReferenceToSelectorBox();

private:
    StringArray processorChoices { "Empty", "Gain", "IIR" };

    Label contentSelectorLabel { {}, { "Select FX" } };
    ComboBox contentSelectorBox;

    ToggleButton bypassToggle { "Bypass" };

    JUCE_DECLARE_NON_COPYABLE_WITH_LEAK_DETECTOR(ContentSelector)
};

#endif //DAFXJUCE_CONTENTSELECTOR_H
