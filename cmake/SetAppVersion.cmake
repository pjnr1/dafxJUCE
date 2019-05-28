function (SetAppVersion major minor patch)
    GetHexVersion(${major} ${minor} ${patch} hex)

    math(EXPR dec "${hex}" OUTPUT_FORMAT DECIMAL)

    message("Version:\t${major}.${minor}.${patch} (${hex}) (${dec})")

    set(PLUGIN_MAJOR_VERSION ${major} PARENT_SCOPE)
    set(PLUGIN_MINOR_VERSION ${minor} PARENT_SCOPE)
    set(PLUGIN_PATCH_VERSION ${patch} PARENT_SCOPE)
    set(PLUGIN_HEX_VERSION ${hex} PARENT_SCOPE)
    set(PLUGIN_DEC_VERSION ${dec} PARENT_SCOPE)
endfunction()