#include "FilterEditor.h"

FilterEditor::FilterEditor()
    : EditorBase()
{
    initializeEditor();
}

FilterEditor::~FilterEditor()
{
}

void FilterEditor::paint(Graphics &g)
{
    g.fillAll(Colours::transparentBlack);

    g.setColour(Colours::grey);
    g.drawRect(getLocalBounds(), 1);   // draw an outline around the component

    g.setColour(Colours::white);
    g.setFont(15.0f);
    g.drawFittedText(getName(), getLocalBounds(), Justification::centred, 1);
}


void FilterEditor::resized()
{

}
