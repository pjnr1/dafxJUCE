
function(ConfigureJUCEAppHeaders)
    # Insert variables in JuceLibraryCode-files
    configure_file("${JUCECMAKEHELPERS_MODULE_PATH}/generator_files/JuceHeader.h.in"
                   "${CMAKE_CURRENT_SOURCE_DIR}/JuceLibraryCode/JuceHeader.h" @ONLY)
    configure_file("${JUCECMAKEHELPERS_MODULE_PATH}/generator_files/AppConfig.h.in"
                   "${CMAKE_CURRENT_SOURCE_DIR}/JuceLibraryCode/AppConfig.h" @ONLY)
endfunction()