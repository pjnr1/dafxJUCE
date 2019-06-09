#pragma once

#include "JuceHeader.h"

class MainProcessor : public AudioProcessor
{
public:
    struct AParamFloat {
        String id;
        String name;
        NormalisableRange<float> range;
        float defaultValue;
        String label;
    };
    struct AParamInt {
        String id;
        String name;
        int start;
        int end;
        int defaultValue;
        String label;
    };

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




    AudioProcessorValueTreeState apvts;

    static AParamFloat paramAttack;
    static AParamFloat paramRelease;
    static AParamInt   paramRatio;
    static AParamFloat paramKnee;
    static AParamFloat paramGainIn;
    static AParamFloat paramGainOut;

private:



    //==============================================================================
    UndoManager undoManager;

    JUCE_DECLARE_NON_COPYABLE_WITH_LEAK_DETECTOR(MainProcessor)
};
