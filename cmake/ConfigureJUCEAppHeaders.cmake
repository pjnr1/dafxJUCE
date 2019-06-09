
function(ConfigureJUCEAppHeaders)
    # Insert variables in JuceLibraryCode-files
    configure_file("${JUCECMAKEHELPERS_MODULE_PATH}/generator_files/JuceHeader.h.in"
                   "${CMAKE_CURRENT_SOURCE_DIR}/JuceLibraryCode/JuceHeader.h" @ONLY)
    configure_file("${JUCECMAKEHELPERS_MODULE_PATH}/generator_files/AppConfig.h.in"
                   "${CMAKE_CURRENT_SOURCE_DIR}/JuceLibraryCode/AppConfig.h" @ONLY)
endfunction()

function(ConfigureJUCEAppHeadersInFolder folder)
    function(remove_and_config file)
        file(REMOVE "${folder}/${file}.h")
        configure_file("${JUCECMAKEHELPERS_MODULE_PATH}/generator_files/${file}.h.in"
                "${folder}/${file}.h" @ONLY)
    endfunction()
    # Insert variables in JuceLibraryCode-files
    remove_and_config(JuceHeader)
    remove_and_config(AppConfig)
endfunction()