
function(AddAudioPluginModules)
    # -- VST3
    if(BUILD_VST3)
        add_library (VST3 MODULE
                "${JUCE_MODULES_PATH}/juce_audio_plugin_client/VST3/juce_VST3_Wrapper.cpp"
                "${JUCE_MODULES_PATH}/juce_audio_plugin_client/juce_audio_plugin_client_VST3.cpp"
                "${PROJECT_SOURCE_DIR}/PkgInfo"
                )


        set_source_files_properties ("${PROJECT_SOURCE_DIR}/PkgInfo" PROPERTIES MACOSX_PACKAGE_LOCATION .)
        set_source_files_properties ("${JUCE_MODULES_PATH}/juce_audio_plugin_client/VST3/juce_VST3_Wrapper.cpp" PROPERTIES HEADER_FILE_ONLY TRUE)
        set_source_files_properties ("${JUCE_MODULES_PATH}/juce_audio_plugin_client/juce_audio_plugin_client_VST3.cpp" PROPERTIES HEADER_FILE_ONLY TRUE)
    endif()

    # -- AAX
    if (BUILD_AAX)

        if(COMMAND cmake_policy)
            cmake_policy(SET CMP0003 NEW)
        endif(COMMAND cmake_policy)

        add_library (AAX MODULE
                "${JUCE_MODULES_PATH}/juce_audio_plugin_client/AAX/juce_AAX_Modifier_Injector.h"
                "${JUCE_MODULES_PATH}/juce_audio_plugin_client/AAX/juce_AAX_Wrapper.cpp"
                "${JUCE_MODULES_PATH}/juce_audio_plugin_client/juce_audio_plugin_client_AAX.cpp"
                "${JUCE_MODULES_PATH}/juce_audio_plugin_client/juce_audio_plugin_client_AAX.mm"
                "${PROJECT_SOURCE_DIR}/PkgInfo"
                )

        set_source_files_properties ("${PROJECT_SOURCE_DIR}/PkgInfo" PROPERTIES MACOSX_PACKAGE_LOCATION .)
        set_source_files_properties ("${JUCE_MODULES_PATH}/juce_audio_plugin_client/AAX/juce_AAX_Modifier_Injector.h" PROPERTIES HEADER_FILE_ONLY TRUE)
        set_source_files_properties ("${JUCE_MODULES_PATH}/juce_audio_plugin_client/AAX/juce_AAX_Wrapper.cpp" PROPERTIES HEADER_FILE_ONLY TRUE)
        set_source_files_properties ("${JUCE_MODULES_PATH}/juce_audio_plugin_client/juce_audio_plugin_client_AAX.cpp" PROPERTIES HEADER_FILE_ONLY TRUE)
        set_source_files_properties ("${JUCE_MODULES_PATH}/juce_audio_plugin_client/juce_audio_plugin_client_AAX.mm" PROPERTIES HEADER_FILE_ONLY TRUE)
    endif ()

    # -- RTAS
    if(BUILD_RTAS)
        add_library (RTAS MODULE
                "${JUCE_MODULES_PATH}/juce_audio_plugin_client/RTAS/juce_RTAS_DigiCode_Header.h"
                "${JUCE_MODULES_PATH}/juce_audio_plugin_client/RTAS/juce_RTAS_DigiCode1.cpp"
                "${JUCE_MODULES_PATH}/juce_audio_plugin_client/RTAS/juce_RTAS_DigiCode2.cpp"
                "${JUCE_MODULES_PATH}/juce_audio_plugin_client/RTAS/juce_RTAS_DigiCode3.cpp"
                "${JUCE_MODULES_PATH}/juce_audio_plugin_client/RTAS/juce_RTAS_MacUtilities.mm"
                "${JUCE_MODULES_PATH}/juce_audio_plugin_client/RTAS/juce_RTAS_WinUtilities.cpp"
                "${JUCE_MODULES_PATH}/juce_audio_plugin_client/RTAS/juce_RTAS_Wrapper.cpp"
                "${JUCE_MODULES_PATH}/juce_audio_plugin_client/juce_audio_plugin_client_RTAS_1.cpp"
                "${JUCE_MODULES_PATH}/juce_audio_plugin_client/juce_audio_plugin_client_RTAS_2.cpp"
                "${JUCE_MODULES_PATH}/juce_audio_plugin_client/juce_audio_plugin_client_RTAS_3.cpp"
                "${JUCE_MODULES_PATH}/juce_audio_plugin_client/juce_audio_plugin_client_RTAS_4.cpp"
                "${JUCE_MODULES_PATH}/juce_audio_plugin_client/juce_audio_plugin_client_RTAS_utils.cpp"
                "${JUCE_MODULES_PATH}/juce_audio_plugin_client/juce_audio_plugin_client_RTAS_utils.mm"
                "JuceLibraryCode/RezHeaders.r"
                "${PROJECT_SOURCE_DIR}/PkgInfo"
                )

        set_source_files_properties ("${PROJECT_SOURCE_DIR}/PkgInfo" PROPERTIES MACOSX_PACKAGE_LOCATION .)
        set_source_files_properties ("${JUCE_MODULES_PATH}/juce_audio_plugin_client/RTAS/juce_RTAS_DigiCode_Header.h" PROPERTIES HEADER_FILE_ONLY TRUE)
        set_source_files_properties ("${JUCE_MODULES_PATH}/juce_audio_plugin_client/RTAS/juce_RTAS_DigiCode1.cpp" PROPERTIES HEADER_FILE_ONLY TRUE)
        set_source_files_properties ("${JUCE_MODULES_PATH}/juce_audio_plugin_client/RTAS/juce_RTAS_DigiCode2.cpp" PROPERTIES HEADER_FILE_ONLY TRUE)
        set_source_files_properties ("${JUCE_MODULES_PATH}/juce_audio_plugin_client/RTAS/juce_RTAS_DigiCode3.cpp" PROPERTIES HEADER_FILE_ONLY TRUE)
        set_source_files_properties ("${JUCE_MODULES_PATH}/juce_audio_plugin_client/RTAS/juce_RTAS_MacUtilities.mm" PROPERTIES HEADER_FILE_ONLY TRUE)
        set_source_files_properties ("${JUCE_MODULES_PATH}/juce_audio_plugin_client/RTAS/juce_RTAS_WinUtilities.cpp" PROPERTIES HEADER_FILE_ONLY TRUE)
        set_source_files_properties ("${JUCE_MODULES_PATH}/juce_audio_plugin_client/RTAS/juce_RTAS_Wrapper.cpp" PROPERTIES HEADER_FILE_ONLY TRUE)
        set_source_files_properties ("${JUCE_MODULES_PATH}/juce_audio_plugin_client/juce_audio_plugin_client_RTAS_1.cpp" PROPERTIES HEADER_FILE_ONLY TRUE)
        set_source_files_properties ("${JUCE_MODULES_PATH}/juce_audio_plugin_client/juce_audio_plugin_client_RTAS_2.cpp" PROPERTIES HEADER_FILE_ONLY TRUE)
        set_source_files_properties ("${JUCE_MODULES_PATH}/juce_audio_plugin_client/juce_audio_plugin_client_RTAS_3.cpp" PROPERTIES HEADER_FILE_ONLY TRUE)
        set_source_files_properties ("${JUCE_MODULES_PATH}/juce_audio_plugin_client/juce_audio_plugin_client_RTAS_4.cpp" PROPERTIES HEADER_FILE_ONLY TRUE)
        set_source_files_properties ("${JUCE_MODULES_PATH}/juce_audio_plugin_client/juce_audio_plugin_client_RTAS_utils.cpp" PROPERTIES HEADER_FILE_ONLY TRUE)
        set_source_files_properties ("${JUCE_MODULES_PATH}/juce_audio_plugin_client/juce_audio_plugin_client_RTAS_utils.mm" PROPERTIES HEADER_FILE_ONLY TRUE)
    endif()

    # -- AU
    if(BUILD_AU)
        add_library (AU MODULE
                "${JUCE_MODULES_PATH}/juce_audio_plugin_client/AU/juce_AU_Wrapper.mm"
                "${JUCE_MODULES_PATH}/juce_audio_plugin_client/juce_audio_plugin_client_AU.r"
                "${JUCE_MODULES_PATH}/juce_audio_plugin_client/juce_audio_plugin_client_AU_1.mm"
                "${JUCE_MODULES_PATH}/juce_audio_plugin_client/juce_audio_plugin_client_AU_2.mm"
                "${JUCE_MODULES_PATH}/juce_audio_processors/format_types/juce_AU_Shared.h"
                "${JUCE_LIBRARY_CODE}/include_juce_audio_plugin_client_AU.r"
                "${JUCE_LIBRARY_CODE}/include_juce_audio_plugin_client_AU_1.mm"
                "${JUCE_LIBRARY_CODE}/include_juce_audio_plugin_client_AU_2.mm"
                "${PROJECT_SOURCE_DIR}/PkgInfo"
                )

        set_source_files_properties ("${PROJECT_SOURCE_DIR}/PkgInfo" PROPERTIES MACOSX_PACKAGE_LOCATION .)
        set_source_files_properties ("${JUCE_MODULES_PATH}/juce_audio_plugin_client/AU/juce_AU_Wrapper.mm" PROPERTIES HEADER_FILE_ONLY TRUE)
        set_source_files_properties ("${JUCE_MODULES_PATH}/juce_audio_plugin_client/juce_audio_plugin_client_AU_1.mm" PROPERTIES HEADER_FILE_ONLY TRUE)
        set_source_files_properties ("${JUCE_MODULES_PATH}/juce_audio_plugin_client/juce_audio_plugin_client_AU_2.mm" PROPERTIES HEADER_FILE_ONLY TRUE)
        set_source_files_properties ("${JUCE_MODULES_PATH}/juce_audio_processors/format_types/juce_AU_Shared.h" PROPERTIES HEADER_FILE_ONLY TRUE)
    endif()

endfunction()