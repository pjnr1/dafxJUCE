#ifndef DAFXJUCE_IIR_COMPONENT_H
#define DAFXJUCE_IIR_COMPONENT_H

#include "../JuceLibraryCode/JuceHeader.h"
#include "EditorBase.h"

class IIR_component : public Component
{
public:
    IIR_component();
    ~IIR_component();

    //==============================================================================
    void paint(Graphics &) override;
    void resized() override;

private:
    JUCE_DECLARE_NON_COPYABLE_WITH_LEAK_DETECTOR(IIR_component)
};

#endif //DAFXJUCE_IIR_COMPONENT_H
