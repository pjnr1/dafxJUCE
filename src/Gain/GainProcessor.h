#ifndef DAFXJUCE_GAIN_PROCESSOR_H
#define DAFXJUCE_GAIN_PROCESSOR_H

#include "../Base/ProcessorBase.h"
#include "JuceHeader.h"

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
