#include "ContentSelector.h"

ContentSelector::ContentSelector()
{
    setupAndMakeVisible();
}

void ContentSelector::setupAndMakeVisible()
{
    // Add list of FXs
    int firstId = 1;
    contentSelectorBox.addItemList(processorChoices, firstId);
    contentSelectorBox.setSelectedId(firstId);

    // Add content selector
    addAndMakeVisible(contentSelectorBox);
    addAndMakeVisible(contentSelectorLabel);
    addAndMakeVisible(bypassToggle);
    contentSelectorLabel.attachToComponent(&contentSelectorBox, true);
    setSize(260, 65);
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

    FlexItem selector(width, height / 3.0f, contentSelectorBox);

    FlexItem bypass(width, height / 3.0f, bypassToggle);

    fb.items.addArray({ selector, bypass });
    fb.performLayout(getLocalBounds().toFloat());
}

void ContentSelector::setChoices(StringArray &choices)
{
    processorChoices = choices;
    contentSelectorBox.clear(NotificationType::dontSendNotification);
    setupAndMakeVisible();
}

ToggleButton *ContentSelector::getReferenceToBypass()
{
    return &bypassToggle;
}

ComboBox *ContentSelector::getReferenceToSelectorBox()
{
    return &contentSelectorBox;
}
