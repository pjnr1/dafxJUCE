#include "MainEditor.h"
#include "MainProcessor.h"
#include <juce_audio_formats/codecs/oggvorbis/libvorbis-1.3.2/lib/os.h>

//==============================================================================
MainEditor::MainEditor(MainProcessor &p)
    : AudioProcessorEditor(&p)
    , processor(p)
{
    // Initialize header / control view
    addAndMakeVisible(contentSelector);
    contentSelector.getReferenceToBypass()->addListener(this);
    contentSelector.getReferenceToSelectorBox()->addListener(this);

    // Initialize content view
    editors.insert(0, new EmptyEditor("Select a component"));
    editors.insert(1, new GainEditor());
    editors.insert(2, new IIR_component());

    content = editors.getUnchecked(0);
    // content = components.front();

    addAndMakeVisible(content);

    updateSize();
}

MainEditor::~MainEditor()
{
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

    FlexItem fbContentSelector(getWidth(), 100, contentSelector);
    FlexItem fbContent(getWidth(), getHeight() - 100, *content);

    fb.items.addArray({ fbContentSelector, fbContent });
    fb.performLayout(getLocalBounds().toFloat());
}
void MainEditor::timerCallback()
{
}
void MainEditor::buttonClicked(Button *button)
{
    if(button->getToggleState())
    {
        processor.enableBypass();
    }
    else
    {
        processor.disableBypass();
    }
}

void MainEditor::updateSize() {
    auto width = max(content->getWidth(), contentSelector.getWidth());
    auto height = contentSelector.getHeight() + content->getHeight();
    setSize(width,height);
}

void MainEditor::comboBoxChanged(ComboBox *comboBoxThatHasChanged)
{
    auto idx = comboBoxThatHasChanged->getSelectedItemIndex();

    removeChildComponent(content);
    content = editors.getUnchecked(idx);
    addAndMakeVisible(content);

    updateSize();

    // Call to correct placement
    this->resized();
}
