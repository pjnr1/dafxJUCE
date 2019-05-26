#include "GainEditor.h"

gain_component::gain_component()
{
    setSize(300, 200);
}

gain_component::~gain_component()
{
}

void gain_component::paint(Graphics &g)
{
    g.fillAll(Colours::aquamarine);
}


void gain_component::resized()
{

}
