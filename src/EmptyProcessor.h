//
// Created by Jens Lindahl on 2019-05-28.
//

#ifndef DAFXJUCE_EMPTYPROCESSOR_H
#define DAFXJUCE_EMPTYPROCESSOR_H

#include "../JuceLibraryCode/JuceHeader.h"
#include "Base/ProcessorBase.h"

class EmptyProcessor : public ProcessorBase
{
public:
    EmptyProcessor()
    {
    }
    ~EmptyProcessor()
    {
    }

    void processBlock(AudioSampleBuffer &buffer, MidiBuffer &) override
    {
    }

    void reset() override {}

    const String getName() const override { return "Empty"; }

private:
};

#endif //DAFXJUCE_EMPTYPROCESSOR_H
