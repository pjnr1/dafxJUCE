//
// Created by Jens Lindahl on 2019-05-26.
//

#ifndef DAFXJUCE_EMPTYEDITOR_H
#define DAFXJUCE_EMPTYEDITOR_H

#include "../JuceLibraryCode/JuceHeader.h"
#include "Base/EditorBase.h"
#include "EmptyProcessor.h"

class EmptyEditor : public EditorBase
{
public:
    EmptyEditor()
        : EditorBase()
    {
        initializeEditor();
    }
    explicit EmptyEditor(const String &info)
        : EmptyEditor()
    {
        infoString = info;
    }
    ~EmptyEditor() override = default;

    EditorMeta getEditorMeta() final {
        EditorMeta meta;
        meta.width = 200;
        meta.height = 200;
        meta.name = "EmptyEditor";
        return meta;
    }

    ProcessorBase* createProcessor() final {
        return new EmptyProcessor();
    }

    void paint(Graphics &g) override
    {
        g.fillAll(Colours::transparentBlack);

        g.setColour(Colours::grey);
        g.drawRect(getLocalBounds(), 1); // draw an outline around the component

        g.setColour(Colours::white);
        g.setFont(15.0f);
        g.drawFittedText(infoString, getLocalBounds(), Justification::centred, 1);
    }
    void resized() override
    {
    }

private:
    String infoString = "";
};

#endif //DAFXJUCE_EMPTYEDITOR_H
