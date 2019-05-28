#ifndef DAFXJUCE_GAIN_COMPONENT_H
#define DAFXJUCE_GAIN_COMPONENT_H

#include "../Base/EditorBase.h"
#include "GainProcessor.h"
#include "JuceHeader.h"

class GainEditor : public EditorBase
{
public:
    GainEditor();
    ~GainEditor();

    EditorMeta getEditorMeta() final {
        EditorMeta meta;
        meta.width = 600;
        meta.height = 400;
        meta.name = "GainEditor";
        return meta;
    }

    ProcessorBase* createProcessor() final {
        return new GainProcessor();
    }

    void paint(Graphics &) override;
    void resized() override;

};

#endif //DAFXJUCE_GAIN_COMPONENT_H
