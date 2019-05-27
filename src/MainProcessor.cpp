/*
  ==============================================================================

    This file was auto-generated!

    It contains the basic framework code for a JUCE plugin processor.

  ==============================================================================
*/

#include "MainProcessor.h"
#include "MainEditor.h"

//==============================================================================
MainProcessor::MainProcessor()
#ifndef JucePlugin_PreferredChannelConfigurations
    : AudioProcessor(BusesProperties()
                         .withInput("Input", AudioChannelSet::stereo(), true)
                         .withOutput("Output", AudioChannelSet::stereo(), true))
#endif
{
    processor.reset(new GainProcessor());
}

MainProcessor::~MainProcessor()
{
}

//==============================================================================
const String MainProcessor::getName() const { return JucePlugin_Name; }

double MainProcessor::getTailLengthSeconds() const { return 0.0; }

int MainProcessor::getNumPrograms() { return 1; }

int MainProcessor::getCurrentProgram() { return 0; }

void MainProcessor::setCurrentProgram(int index) {}

const String MainProcessor::getProgramName(int index) { return {}; }

void MainProcessor::changeProgramName(int index, const String &newName) {}

//==============================================================================
void MainProcessor::prepareToPlay(double sampleRate, int samplesPerBlock)
{
    // Use this method as the place to do any pre-playback
    // initialisation that you need..
    // Example: Reset buffers etc.
}

void MainProcessor::releaseResources()
{
    // When playback stops, you can use this as an opportunity to free up any
    // spare memory, etc.
}

#ifndef JucePlugin_PreferredChannelConfigurations
bool MainProcessor::isBusesLayoutSupported(const BusesLayout &layouts) const
{
    // This is the place where you check if the layout is supported.
    // In this template code we only support mono or stereo.
    if(layouts.getMainOutputChannelSet() != AudioChannelSet::mono())
    {
        if(layouts.getMainOutputChannelSet() != AudioChannelSet::stereo())
        {
            return false;
        }
    }

    // This checks if the input layout matches the output layout
    if(layouts.getMainOutputChannelSet() != layouts.getMainInputChannelSet())
    {
        return false;
    }

    return true;
}
#endif

void MainProcessor::processBlock(AudioBuffer<float> &buffer,
    MidiBuffer &midiMessages)
{
    if(bypass)
    {
        return;
    }
    ScopedNoDenormals noDenormals;
    auto totalNumInputChannels = getTotalNumInputChannels();
    auto totalNumOutputChannels = getTotalNumOutputChannels();

    // In case we have more outputs than inputs, this code clears any output
    // channels that didn't contain input data, (because these aren't
    // guaranteed to be empty - they may contain garbage).
    // This is here to avoid people getting screaming feedback
    // when they first compile a plugin, but obviously you don't need to keep
    // this code if your algorithm always overwrites all the output channels.
    for(auto i = totalNumInputChannels; i < totalNumOutputChannels; ++i)
    {
        buffer.clear(i, 0, buffer.getNumSamples());
    }

    // This is the place where you'd normally do the guts of your plugin's
    // audio processing...
    // Make sure to reset the state if your inner loop is processing
    // the samples and the outer loop is handling the channels.
    // Alternatively, you can process the samples with the channels
    // interleaved by keeping the same state.
    if(processor != nullptr)
    {
        // Call the active processor
        processor->processBlock(buffer, midiMessages);
    }

//    for(int channel = 0; channel < totalNumInputChannels; ++channel)
//    {
//        // auto *channelData = buffer.getWritePointer(channel);
//    }
}

//==============================================================================
bool MainProcessor::hasEditor() const
{
    return true; // (change this to false if you choose to not supply an editor)
}

AudioProcessorEditor *MainProcessor::createEditor()
{
    return new MainEditor(*this);
}

//==============================================================================
void MainProcessor::getStateInformation(MemoryBlock &destData)
{
    // You should use this method to store your parameters in the memory block.
    // You could do that either as raw data, or use the XML or ValueTree classes
    // as intermediaries to make it easy to save and load complex data.
}

void MainProcessor::setStateInformation(const void *data, int sizeInBytes)
{
    // You should use this method to restore your parameters from this memory
    // block, whose contents will have been created by the getStateInformation()
    // call.
}

//==============================================================================
void MainProcessor::enableBypass()
{
    bypass = true;
}
void MainProcessor::disableBypass()
{
    bypass = false;
}

//==============================================================================
// This creates new instances of the plugin..
AudioProcessor *JUCE_CALLTYPE createPluginFilter()
{
    return new MainProcessor();
}
