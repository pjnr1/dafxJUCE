#ifndef DAFXJUCE_FILTEREDITOR_H
#define DAFXJUCE_FILTEREDITOR_H

#include "../Base/EditorBase.h"
#include "FilterProcessor.h"
#include "JuceHeader.h"

class FilterEditor : public EditorBase
{
public:
    FilterEditor();
    ~FilterEditor();

    EditorMeta getEditorMeta() final {
        EditorMeta meta;
        meta.width = 800;
        meta.height = 200;
        meta.name = "FilterEditor";
        return meta;
    }

    ProcessorBase* createProcessor() final {
        return new FilterProcessor();
    }

    //==============================================================================
    void paint(Graphics &) override;
    void resized() override;

private:
};

#endif //DAFXJUCE_FILTEREDITOR_H
