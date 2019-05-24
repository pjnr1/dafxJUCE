
function(ConfigureJUCEplists type)
    # Insert variables in plist-files and copy out to location
    configure_file("${JUCECMAKEHELPERS_MODULE_PATH}/generator_files/${type}.plist.in"
            "${CMAKE_CURRENT_BINARY_DIR}/plists/Debug-Info-${type}.plist" @ONLY)
    configure_file("${JUCECMAKEHELPERS_MODULE_PATH}/generator_files/${type}.plist.in"
            "${CMAKE_CURRENT_BINARY_DIR}/plists/Release-Info-${type}.plist" @ONLY)
endfunction()