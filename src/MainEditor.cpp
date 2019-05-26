#include "MainEditor.h"
#include "MainProcessor.h"

//==============================================================================
MainEditor::MainEditor(MainProcessor &p)
    : AudioProcessorEditor(&p)
    , processor(p)
{
    // Initialize header / control view
    addAndMakeVisible(contentSelector);
    contentSelector.getReferenceToBypass()->addListener(this);

    // Initialize content view
    components.push_back(new GainEditor());

    content = components.front();

    addAndMakeVisible(content);

    setSize(600, 500);
}

MainEditor::~MainEditor()
{
    delete content;
}

//==============================================================================
void MainEditor::paint(Graphics &g)
{
    // (Our component is opaque, so we must completely fill the background with a solid colour)
    g.fillAll(getLookAndFeel().findColour(ResizableWindow::backgroundColourId));
}

void MainEditor::resized()
{

    FlexBox fb;
    fb.flexDirection = FlexBox::Direction::column;
    fb.justifyContent = FlexBox::JustifyContent::center;
    fb.alignContent = FlexBox::AlignContent::center;

    FlexItem fbContentSelector(getWidth(), getHeight() / 5.0f, contentSelector);
    FlexItem fbContent(getWidth(), getHeight() * (4.0f / 5.0f), *content);

    fb.items.addArray({ fbContentSelector, fbContent });
    fb.performLayout(getLocalBounds().toFloat());
}
void MainEditor::timerCallback()
{

}
void MainEditor::buttonClicked(Button *button)
{
    Listener::buttonStateChanged(button);
    if (contentSelector.getReferenceToBypass()->getToggleState())
    {
        processor.enableBypass();
    }
    else
    {
        processor.disableBypass();
    }
}
