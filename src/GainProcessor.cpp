//
// Created by Jens Lindahl on 2019-05-26.
//

#include "GainProcessor.h"

GainProcessor::GainProcessor()
{
    gain.setGainDecibels(-6.0f);
}

GainProcessor::~GainProcessor()
{
}

void GainProcessor::prepareToPlay(double sampleRate, int samplesPerBlock)
{
    dsp::ProcessSpec spec { sampleRate, static_cast<uint32>(samplesPerBlock), 2 };
    gain.prepare(spec);
}

void GainProcessor::processBlock(AudioSampleBuffer &buffer, MidiBuffer &)
{
    dsp::AudioBlock<float> block(buffer);
    dsp::ProcessContextReplacing<float> context(block);
    gain.process(context);
}

void GainProcessor::reset()
{
    gain.reset();
}
