#include "ContentSelector.h"

ContentSelector::ContentSelector()
{
    // Add content selector
    addAndMakeVisible(contentSelectorBox);

    // Add list of FXs
    int firstId = 1;
    contentSelectorBox.addItemList(processorChoices, firstId);
    contentSelectorBox.setSelectedId(firstId);

    addAndMakeVisible(contentSelectorLabel);

    addAndMakeVisible(bypassToggle);

    contentSelectorLabel.attachToComponent(&contentSelectorBox, true);

    setSize(400, 100);
}

ContentSelector::~ContentSelector()
{
}


void ContentSelector::paint(Graphics &g)
{
    g.fillAll(Colours::transparentBlack);
    // nothingToRender(g,"ContentSelector", getLocalBounds());
}


void ContentSelector::resized()
{
    auto width = getWidth() / 2.0f;
    auto height = getHeight();

    FlexBox fb;
    fb.flexDirection = FlexBox::Direction::column;
    fb.justifyContent = FlexBox::JustifyContent::center;
    fb.alignContent = FlexBox::AlignContent::center;

    FlexItem selector(width,height / 3.0f, contentSelectorBox);

    FlexItem bypass(width,height / 3.0f, bypassToggle);

    fb.items.addArray({ selector, bypass });
    fb.performLayout(getLocalBounds().toFloat());

}

ToggleButton* ContentSelector::getReferenceToBypass() {
    return &bypassToggle;
}

ComboBox* ContentSelector::getReferenceToSelectorBox() {
    return &contentSelectorBox;
}
