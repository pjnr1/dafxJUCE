#pragma once

#include "JuceHeader.h"
#include "MainProcessor.h"

class MainEditor : public AudioProcessorEditor
{
public:
    explicit MainEditor(MainProcessor &);
    ~MainEditor() override;

    void paint(Graphics &) override;
    void resized() override;

private:

    MainProcessor &processor;

    JUCE_DECLARE_NON_COPYABLE_WITH_LEAK_DETECTOR(MainEditor)
};
