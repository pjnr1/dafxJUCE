//
// Created by Jens Lindahl on 2019-05-27.
//

#ifndef DAFXJUCE_EDITORBASE_H
#define DAFXJUCE_EDITORBASE_H

#include "JuceHeader.h"
#include "ProcessorBase.h"

class EditorBase : public Component
{
public:
    struct EditorMeta
    {
        int width;
        int height;
        String name = "";
    };

    /**
     *
     * @return EditorMeta used to initiliaze EditorBase
     */
    virtual EditorMeta getEditorMeta() = 0;

    /**
     * initializeEditor()
     * Uses pure-virtual members to acquire data-members.
     * General value checks is set here
     */
    void initializeEditor()
    {
        /*
         * Load data-members
         */
        meta = getEditorMeta();
        processor = createProcessor();

        /*
         * Setup Editor
         * This section should include any value checks etc.
         */
        assert(meta.width >= 0);
        assert(meta.height >= 0);
        setSize(meta.width, meta.height);

        assert(meta.name.length() > 0);
        setName(meta.name);

        assert(processor != nullptr);
    }

    EditorBase() {
        processor = nullptr;
    }

    /*
     * As EditorBase is the unique owner of the processor, make sure to delete it
     * before desctruction.
     */
    ~EditorBase() {
        delete processor;
    }

    /**
     *
     * @return pointer to processor
     */
    ProcessorBase* getProcessor() {
        return processor;
    }

private:
    /**
     * getProcessor() forces the subclasses to provide a pointer to the associated AudioProcessor
     * This pointer is used as the processor, if the editor is active
     *
     * @return pointer to associated processor
     */
    virtual ProcessorBase* createProcessor() = 0;

    ProcessorBase* processor;
    EditorMeta meta;

    //==============================================================================
    JUCE_DECLARE_NON_COPYABLE_WITH_LEAK_DETECTOR(EditorBase);
};

#endif //DAFXJUCE_EDITORBASE_H
