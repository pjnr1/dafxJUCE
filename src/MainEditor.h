#pragma once

#include "../JuceLibraryCode/JuceHeader.h"
#include "ContentSelector.h"
#include "EmptyEditor.h"
#include "GainEditor.h"
#include "IIR_component.h"
#include "MainProcessor.h"

class MainEditor : public AudioProcessorEditor,
                   public ComboBox::Listener,
                   public ToggleButton::Listener,
                   private Timer
{
public:
    using AudioGraphIOProcessor = AudioProcessorGraph::AudioGraphIOProcessor;
    using Node = AudioProcessorGraph::Node;

    MainEditor(MainProcessor &);
    ~MainEditor();

    //==============================================================================
    void paint(Graphics &) override;
    void resized() override;

    void buttonClicked(Button *button) override;
    void comboBoxChanged(ComboBox *comboBoxThatHasChanged) override;

private:
    void timerCallback() override;

    MainProcessor &processor;

    std::vector<Component *> components;
    OwnedArray<Component> editors;

    ContentSelector contentSelector;
    Component* content;

    JUCE_DECLARE_NON_COPYABLE_WITH_LEAK_DETECTOR(MainEditor)
};
