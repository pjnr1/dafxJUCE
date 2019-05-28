#pragma once

#include "ContentSelector.h"
#include "EmptyEditor.h"
#include "Filter/FilterEditor.h"
#include "Gain/GainEditor.h"
#include "JuceHeader.h"
#include "MainProcessor.h"

class MainEditor : public AudioProcessorEditor,
                   public ComboBox::Listener,
                   public ToggleButton::Listener,
                   private Timer
{
public:
    explicit MainEditor(MainProcessor &);
    ~MainEditor() override;

    //==============================================================================
    void paint(Graphics &) override;
    void resized() override;

    void buttonClicked(Button *button) override;
    void comboBoxChanged(ComboBox *comboBoxThatHasChanged) override;

private:
    void timerCallback() override;

    void updateSize();
    void setEditor(int idx);
    void setProcessor(int idx);

    MainProcessor &processor;

    OwnedArray<EditorBase> editors;

    ContentSelector contentSelector;
    EditorBase *content;

    JUCE_DECLARE_NON_COPYABLE_WITH_LEAK_DETECTOR(MainEditor)
};
