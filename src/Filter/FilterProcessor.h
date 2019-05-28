//
// Created by Jens Lindahl on 2019-05-28.
//

#ifndef DAFXJUCE_FILTERPROCESSOR_H
#define DAFXJUCE_FILTERPROCESSOR_H

#include "../Base/ProcessorBase.h"
#include "JuceHeader.h"

class FilterProcessor : public ProcessorBase
{
public:
    FilterProcessor();
    ~FilterProcessor();

    void prepareToPlay(double sampleRate, int samplesPerBlock) override;

    void processBlock(AudioSampleBuffer &buffer, MidiBuffer &) override;

    void reset() override;

    const String getName() const override { return "FilterProcessor"; }

private:
};


#endif //DAFXJUCE_FILTERPROCESSOR_H
