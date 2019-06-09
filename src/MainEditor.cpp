#include "MainEditor.h"
#include "MainProcessor.h"

//==============================================================================
MainEditor::MainEditor(MainProcessor &p)
    : AudioProcessorEditor(&p)
    , processor(p)
{
}

MainEditor::~MainEditor()
{
}

//==============================================================================
void MainEditor::paint(Graphics &g)
{
    g.fillAll(getLookAndFeel().findColour(ResizableWindow::backgroundColourId));
}

void MainEditor::resized()
{
}
