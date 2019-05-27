#pragma once

#include "../JuceLibraryCode/JuceHeader.h"
#include "ProcessorBase.h"
#include "GainProcessor.h"

class MainProcessor : public AudioProcessor
{
public:
    //==============================================================================
    MainProcessor();
    ~MainProcessor();

    //==============================================================================
    void prepareToPlay(double sampleRate, int samplesPerBlock) override;
    void releaseResources() override;

#ifndef JucePlugin_PreferredChannelConfigurations
    bool isBusesLayoutSupported(const BusesLayout &layouts) const override;
#endif

    void processBlock(AudioBuffer<float> &, MidiBuffer &) override;

    //==============================================================================
    AudioProcessorEditor *createEditor() override;
    bool hasEditor() const override;

    //==============================================================================
    const String getName() const override;

    bool acceptsMidi() const override { return false; };
    bool producesMidi() const override { return false; };
    bool isMidiEffect() const override { return false; };
    double getTailLengthSeconds() const override;

    //==============================================================================
    int getNumPrograms() override;
    int getCurrentProgram() override;
    void setCurrentProgram(int index) override;
    const String getProgramName(int index) override;
    void changeProgramName(int index, const String &newName) override;

    //==============================================================================
    void getStateInformation(MemoryBlock &destData) override;
    void setStateInformation(const void *data, int sizeInBytes) override;

    //==============================================================================
    void enableBypass();
    void disableBypass();

private:
    bool bypass;

    std::unique_ptr<ProcessorBase> processor;

    //==============================================================================
    JUCE_DECLARE_NON_COPYABLE_WITH_LEAK_DETECTOR(MainProcessor)
};
