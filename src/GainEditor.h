#ifndef DAFXJUCE_GAIN_COMPONENT_H
#define DAFXJUCE_GAIN_COMPONENT_H

class gain_component : public Component
{
public:
    gain_component();
    ~gain_component();

    //==============================================================================
    void paint(Graphics &) override;
    void resized() override;

private:
    JUCE_DECLARE_NON_COPYABLE_WITH_LEAK_DETECTOR(gain_component)
};

#endif //DAFXJUCE_GAIN_COMPONENT_H
