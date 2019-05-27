#ifndef DAFXJUCE_GAIN_PROCESSOR_H
#define DAFXJUCE_GAIN_PROCESSOR_H

#include "../JuceLibraryCode/JuceHeader.h"
#include "ProcessorBase.h"

class GainProcessor : public ProcessorBase
{
public:
    GainProcessor();
    ~GainProcessor();

    void prepareToPlay(double sampleRate, int samplesPerBlock) override;

    void processBlock(AudioSampleBuffer &buffer, MidiBuffer &) override;

    void reset() override;

    const String getName() const override { return "Gain"; }

private:
    dsp::Gain<float> gain;
};

#endif //DAFXJUCE_GAIN_PROCESSOR_H
