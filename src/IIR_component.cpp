#include "IIR_component.h"

IIR_component::IIR_component()
{
    setSize(300, 200);
}

IIR_component::~IIR_component()
{
}

void IIR_component::paint(Graphics &g)
{
    g.fillAll(Colours::transparentBlack);

    g.setColour(Colours::grey);
    g.drawRect(getLocalBounds(), 1);   // draw an outline around the component

    g.setColour(Colours::white);
    g.setFont(15.0f);
    g.drawFittedText("IIR_component", getLocalBounds(), Justification::centred, 1);
}


void IIR_component::resized()
{

}
