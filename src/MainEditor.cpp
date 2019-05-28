#include "MainEditor.h"
#include "MainProcessor.h"
#include <juce_audio_formats/codecs/oggvorbis/libvorbis-1.3.2/lib/os.h>

//==============================================================================
MainEditor::MainEditor(MainProcessor &p)
    : AudioProcessorEditor(&p)
    , processor(p)
{
    /*
     * This part is crucial for using different editors in the plugin.
     * Each editor holds a point to it's delegated processor, this might be
     * reverse-ownership comparred to how the MainProcessor and MainEditor
     * is connected.
     * But, that's just the way she goes..
     */
    editors.insert(0, new EmptyEditor("Select an FX from the menu.."));
    editors.insert(1, new GainEditor());
    editors.insert(2, new FilterEditor());

    // Initialize header / control view
    addAndMakeVisible(contentSelector);

    contentSelector.getReferenceToBypass()->addListener(this);
    contentSelector.getReferenceToSelectorBox()->addListener(this);



    // Initialize content view
    content = editors.getUnchecked(0);

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

    FlexItem fbContentSelector(getWidth(), contentSelector.getHeight(), contentSelector);
    FlexItem fbContent(getWidth(), getHeight() - contentSelector.getHeight(), *content);

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

void MainEditor::updateSize()
{
    auto width = std::max<int>(contentSelector.getMinWidth(), content->getWidth());
    auto height = contentSelector.getMinHeight() + content->getHeight();

    setSize(width, height);

    this->resized();
}

void MainEditor::comboBoxChanged(ComboBox *comboBoxThatHasChanged)
{
    auto idx = comboBoxThatHasChanged->getSelectedItemIndex();

    setEditor(idx);
    setProcessor(idx);

    //    std::cout << content->getName() << std::endl;
    //    std::cout << contentSelector.getWidth() << " x " << contentSelector.getHeight() << std::endl;
    //    std::cout << content->getWidth() << " x " << content->getHeight() << std::endl;
    //    std::cout << std::endl;

    updateSize();
}

void MainEditor::setEditor(int idx)
{
    removeChildComponent(content);
    content = editors.getUnchecked(idx);
    addAndMakeVisible(content);
}

void MainEditor::setProcessor(int idx)
{
    processor.setProcessor(content->getProcessor());
}
