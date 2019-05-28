#ifndef DAFXJUCE_CONTENTSELECTOR_H
#define DAFXJUCE_CONTENTSELECTOR_H

#include "../JuceLibraryCode/JuceHeader.h"
#include "Base/GUIElement.h"

class ContentSelector : public GUIElement
{
public:
    ContentSelector();
    ~ContentSelector();

    void paint(Graphics &) override;
    void resized() override;

    void setChoices(StringArray &choices);

    ToggleButton *getReferenceToBypass();
    ComboBox *getReferenceToSelectorBox();

private:
    void setupAndMakeVisible();

    StringArray processorChoices { "Empty", "Gain", "Filter" };

    Label contentSelectorLabel { {}, { "Select FX" } };
    ComboBox contentSelectorBox;

    ToggleButton bypassToggle { "Bypass" };

    JUCE_DECLARE_NON_COPYABLE_WITH_LEAK_DETECTOR(ContentSelector)
};

#endif //DAFXJUCE_CONTENTSELECTOR_H
