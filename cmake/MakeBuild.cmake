
#[[
    Target setup for RTAS BUILD (APPLE)
##]]
function(MakeBuildRTAS)
    if(CMAKE_BUILD_TYPE STREQUAL Debug)

        target_include_directories (RTAS PRIVATE
                "${JUCE_MODULES_PATH}/juce_audio_processors/format_types/VST3_SDK"
                "JuceLibraryCode"
                "$ENV{HOME}/SDKs/AAX"
                "$ENV{HOME}/SDKs/AAX/Interfaces"
                "$ENV{HOME}/SDKs/AAX/Interfaces/ACF"
                "${JUCE_MODULES_PATH}"
                "$(DEVELOPER_DIR)/Headers/FlatCarbon"
                "$(SDKROOT)/Developer/Headers/FlatCarbon"
                "$ENV{HOME}/SDKs/PT_90_SDK/AlturaPorts/TDMPlugIns/PlugInLibrary/Controls"
                "$ENV{HOME}/SDKs/PT_90_SDK/AlturaPorts/TDMPlugIns/PlugInLibrary/CoreClasses"
                "$ENV{HOME}/SDKs/PT_90_SDK/AlturaPorts/TDMPlugIns/PlugInLibrary/DSPClasses"
                "$ENV{HOME}/SDKs/PT_90_SDK/AlturaPorts/TDMPlugIns/PlugInLibrary/EffectClasses"
                "$ENV{HOME}/SDKs/PT_90_SDK/AlturaPorts/TDMPlugIns/PlugInLibrary/MacBuild"
                "$ENV{HOME}/SDKs/PT_90_SDK/AlturaPorts/TDMPlugIns/PlugInLibrary/Meters"
                "$ENV{HOME}/SDKs/PT_90_SDK/AlturaPorts/TDMPlugIns/PlugInLibrary/ProcessClasses"
                "$ENV{HOME}/SDKs/PT_90_SDK/AlturaPorts/TDMPlugIns/PlugInLibrary/ProcessClasses/Interfaces"
                "$ENV{HOME}/SDKs/PT_90_SDK/AlturaPorts/TDMPlugIns/PlugInLibrary/RTASP_Adapt"
                "$ENV{HOME}/SDKs/PT_90_SDK/AlturaPorts/TDMPlugIns/PlugInLibrary/Utilities"
                "$ENV{HOME}/SDKs/PT_90_SDK/AlturaPorts/TDMPlugIns/PlugInLibrary/ViewClasses"
                "$ENV{HOME}/SDKs/PT_90_SDK/AlturaPorts/TDMPlugIns/DSPManager/**"
                "$ENV{HOME}/SDKs/PT_90_SDK/AlturaPorts/TDMPlugIns/SupplementalPlugInLib/Encryption"
                "$ENV{HOME}/SDKs/PT_90_SDK/AlturaPorts/TDMPlugIns/SupplementalPlugInLib/GraphicsExtensions"
                "$ENV{HOME}/SDKs/PT_90_SDK/AlturaPorts/TDMPlugIns/common/**"
                "$ENV{HOME}/SDKs/PT_90_SDK/AlturaPorts/TDMPlugIns/common/PI_LibInterface"
                "$ENV{HOME}/SDKs/PT_90_SDK/AlturaPorts/TDMPlugIns/PACEProtection/**"
                "$ENV{HOME}/SDKs/PT_90_SDK/AlturaPorts/TDMPlugIns/SignalProcessing/**"
                "$ENV{HOME}/SDKs/PT_90_SDK/AlturaPorts/OMS/Headers"
                "$ENV{HOME}/SDKs/PT_90_SDK/AlturaPorts/Fic/Interfaces/**"
                "$ENV{HOME}/SDKs/PT_90_SDK/AlturaPorts/Fic/Source/SignalNets"
                "$ENV{HOME}/SDKs/PT_90_SDK/AlturaPorts/DSIPublicInterface/PublicHeaders"
                "$ENV{HOME}/SDKs/PT_90_SDK/DAEWin/Include"
                "$ENV{HOME}/SDKs/PT_90_SDK/AlturaPorts/DigiPublic/Interfaces"
                "$ENV{HOME}/SDKs/PT_90_SDK/AlturaPorts/DigiPublic"
                "$ENV{HOME}/SDKs/PT_90_SDK/AlturaPorts/NewFileLibs/DOA"
                "$ENV{HOME}/SDKs/PT_90_SDK/AlturaPorts/NewFileLibs/Cmn"
                "$ENV{HOME}/SDKs/PT_90_SDK/xplat/AVX/avx2/avx2sdk/inc"
                "$ENV{HOME}/SDKs/PT_90_SDK/xplat/AVX/avx2/avx2sdk/utils"
                "${JUCE_MODULES_PATH}/juce_audio_plugin_client"
                )

        target_compile_definitions (RTAS PRIVATE
                "_DEBUG=1"
                "DEBUG=1"
                "JUCER_XCODE_MAC_F6D2F4CF=1"
                "JUCE_APP_VERSION=${PLUGIN_MAJOR_VERSION}.${PLUGIN_MINOR_VERSION}.${PLUGIN_PATCH_VERSION}"
                "JUCE_APP_VERSION_HEX=${PLUGIN_HEX_VERSION}"
                "JucePlugin_Build_VST=0"
                "JucePlugin_Build_VST3=0"
                "JucePlugin_Build_AU=0"
                "JucePlugin_Build_AUv3=0"
                "JucePlugin_Build_RTAS=1"
                "JucePlugin_Build_AAX=0"
                "JucePlugin_Build_Standalone=0"
                "JucePlugin_Build_Unity=0"
                )

        target_compile_options (RTAS PRIVATE
                -mmacosx-version-min=10.11
                -O0
                -stdlib=libc++
                )

        set_target_properties (RTAS PROPERTIES
                OUTPUT_NAME "NewProject"
                CXX_STANDARD 14
                CXX_EXTENSIONS OFF
                XCODE_ATTRIBUTE_CLANG_LINK_OBJC_RUNTIME NO
                XCODE_ATTRIBUTE_COMBINE_HIDPI_IMAGES YES
                XCODE_ATTRIBUTE_CONFIGURATION_BUILD_DIR "$(PROJECT_DIR)/build/$(CONFIGURATION)"
                XCODE_ATTRIBUTE_COPY_PHASE_STRIP NO
                XCODE_ATTRIBUTE_DEPLOYMENT_LOCATION YES
                XCODE_ATTRIBUTE_DSTROOT /
                XCODE_ATTRIBUTE_GCC_DYNAMIC_NO_PIC NO
                XCODE_ATTRIBUTE_GCC_VERSION com.apple.compilers.llvm.clang.1_0
                XCODE_ATTRIBUTE_GENERATE_PKGINFO_FILE YES
                XCODE_ATTRIBUTE_INFOPLIST_FILE "${CMAKE_CURRENT_BINARY_DIR}/plists/Debug-Info-RTAS.plist"
                XCODE_ATTRIBUTE_INFOPLIST_PREPROCESS NO
                XCODE_ATTRIBUTE_INSTALL_PATH "/Library/Application Support/Digidesign/Plug-Ins/"
                XCODE_ATTRIBUTE_LIBRARY_STYLE Bundle
                XCODE_ATTRIBUTE_PRODUCT_BUNDLE_IDENTIFIER com.yourcompany.NewProject
                XCODE_ATTRIBUTE_PRODUCT_NAME "NewProject"
                XCODE_ATTRIBUTE_USE_HEADERMAP NO
                XCODE_ATTRIBUTE_WRAPPER_EXTENSION dpm
                MACOSX_BUNDLE_INFO_PLIST "${CMAKE_CURRENT_BINARY_DIR}/plists/Debug-Info-RTAS.plist"
                XCODE_ATTRIBUTE_PRODUCT_NAME "NewProject"
                BUNDLE TRUE
                BUNDLE_EXTENSION dpm
                XCODE_ATTRIBUTE_MACH_O_TYPE "mh_bundle"
                )

        target_link_libraries (RTAS PRIVATE
                SHARED_CODE
                "-L\"$ENV{HOME}/SDKs/PT_90_SDK/MacBag/Libs/Debug\""
                "-L\"$ENV{HOME}/SDKs/PT_90_SDK/MacBag/Libs/Release\""
                "-lPluginLibrary"
                "-lPluginLibrary"
                "-framework Accelerate"
                "-framework AudioToolbox"
                "-framework AVFoundation"
                "-framework AVKit"
                "-framework Carbon"
                "-framework Cocoa"
                "-framework CoreAudio"
                "-framework CoreMedia"
                "-framework CoreMIDI"
                "-framework DiscRecording"
                "-framework IOKit"
                "-framework OpenGL"
                "-framework QuartzCore"
                "-framework WebKit"
                )

        add_custom_command (TARGET RTAS POST_BUILD
                COMMAND ${CMAKE_COMMAND} -E remove_directory "/Library/Application Support/Digidesign/Plug-Ins/NewProject.dpm"
                COMMAND ${CMAKE_COMMAND} -E copy_directory "${CMAKE_BINARY_DIR}/NewProject.dpm" "/Library/Application Support/Digidesign/Plug-Ins/NewProject.dpm"
                COMMENT "Copying \"NewProject.dpm\" to \"/Library/Application Support/Digidesign/Plug-Ins/\""
                )

    elseif(CMAKE_BUILD_TYPE STREQUAL Release)

        target_compile_definitions (RTAS PRIVATE
                "_NDEBUG=1"
                "NDEBUG=1"
                "JUCER_XCODE_MAC_F6D2F4CF=1"
                "JUCE_APP_VERSION=${PLUGIN_MAJOR_VERSION}.${PLUGIN_MINOR_VERSION}.${PLUGIN_PATCH_VERSION}"
                "JUCE_APP_VERSION_HEX=${PLUGIN_HEX_VERSION}"
                "JucePlugin_Build_VST=0"
                "JucePlugin_Build_VST3=0"
                "JucePlugin_Build_AU=0"
                "JucePlugin_Build_AUv3=0"
                "JucePlugin_Build_RTAS=1"
                "JucePlugin_Build_AAX=0"
                "JucePlugin_Build_Standalone=0"
                "JucePlugin_Build_Unity=0"
                )

        target_compile_options (RTAS PRIVATE
                -mmacosx-version-min=10.11
                -O3
                -flto
                -stdlib=libc++
                )

        set_target_properties (RTAS PROPERTIES
                OUTPUT_NAME "NewProject"
                CXX_STANDARD 14
                CXX_EXTENSIONS OFF
                XCODE_ATTRIBUTE_CLANG_LINK_OBJC_RUNTIME NO
                XCODE_ATTRIBUTE_COMBINE_HIDPI_IMAGES YES
                XCODE_ATTRIBUTE_CONFIGURATION_BUILD_DIR "$(PROJECT_DIR)/build/$(CONFIGURATION)"
                XCODE_ATTRIBUTE_DEAD_CODE_STRIPPING YES
                XCODE_ATTRIBUTE_DEPLOYMENT_LOCATION YES
                XCODE_ATTRIBUTE_DSTROOT /
                XCODE_ATTRIBUTE_GCC_GENERATE_DEBUGGING_SYMBOLS NO
                XCODE_ATTRIBUTE_GCC_SYMBOLS_PRIVATE_EXTERN YES
                XCODE_ATTRIBUTE_GCC_VERSION com.apple.compilers.llvm.clang.1_0
                XCODE_ATTRIBUTE_GENERATE_PKGINFO_FILE YES
                XCODE_ATTRIBUTE_INFOPLIST_FILE "${CMAKE_CURRENT_BINARY_DIR}/plists/Release-Info-RTAS.plist"
                XCODE_ATTRIBUTE_INFOPLIST_PREPROCESS NO
                XCODE_ATTRIBUTE_INSTALL_PATH "/Library/Application Support/Digidesign/Plug-Ins/"
                XCODE_ATTRIBUTE_LIBRARY_STYLE Bundle
                XCODE_ATTRIBUTE_PRODUCT_BUNDLE_IDENTIFIER com.yourcompany.NewProject
                XCODE_ATTRIBUTE_PRODUCT_NAME "NewProject"
                XCODE_ATTRIBUTE_USE_HEADERMAP NO
                XCODE_ATTRIBUTE_WRAPPER_EXTENSION dpm
                MACOSX_BUNDLE_INFO_PLIST "${CMAKE_CURRENT_BINARY_DIR}/plists/Release-Info-RTAS.plist"
                XCODE_ATTRIBUTE_PRODUCT_NAME "NewProject"
                BUNDLE TRUE
                BUNDLE_EXTENSION dpm
                XCODE_ATTRIBUTE_MACH_O_TYPE "mh_bundle"
                )

        target_link_libraries (RTAS PRIVATE
                SHARED_CODE
                "-L\"$ENV{HOME}/SDKs/PT_90_SDK/MacBag/Libs/Debug\""
                "-L\"$ENV{HOME}/SDKs/PT_90_SDK/MacBag/Libs/Release\""
                "-lPluginLibrary"
                "-lPluginLibrary"
                "-framework Accelerate"
                "-framework AudioToolbox"
                "-framework AVFoundation"
                "-framework AVKit"
                "-framework Carbon"
                "-framework Cocoa"
                "-framework CoreAudio"
                "-framework CoreMedia"
                "-framework CoreMIDI"
                "-framework DiscRecording"
                "-framework IOKit"
                "-framework OpenGL"
                "-framework QuartzCore"
                "-framework WebKit"
                )

        add_custom_command (TARGET RTAS POST_BUILD
                COMMAND ${CMAKE_COMMAND} -E remove_directory "/Library/Application Support/Digidesign/Plug-Ins/NewProject.dpm"
                COMMAND ${CMAKE_COMMAND} -E copy_directory "${CMAKE_BINARY_DIR}/NewProject.dpm" "/Library/Application Support/Digidesign/Plug-Ins/NewProject.dpm"
                COMMENT "Copying \"NewProject.dpm\" to \"/Library/Application Support/Digidesign/Plug-Ins/\""
                )


    endif()
endfunction()


#[[
    Target setup for AAX BUILD (APPLE)
##]]
function(MakeBuildAAX)
    if(CMAKE_BUILD_TYPE STREQUAL Debug)
        target_include_directories (AAX PRIVATE
                "${JUCE_MODULES_PATH}/juce_audio_processors/format_types/VST3_SDK"
                "../../JuceLibraryCode"
                "$ENV{HOME}/SDKs/AAX"
                "$ENV{HOME}/SDKs/AAX/Interfaces"
                "$ENV{HOME}/SDKs/AAX/Interfaces/ACF"
                "${JUCE_MODULES_PATH}"
                "${JUCE_MODULES_PATH}/juce_audio_plugin_client"
                )

        target_compile_definitions (AAX PRIVATE
                "_DEBUG=1"
                "DEBUG=1"
                "JUCER_XCODE_MAC_F6D2F4CF=1"
                "JUCE_APP_VERSION=${PLUGIN_MAJOR_VERSION}.${PLUGIN_MINOR_VERSION}.${PLUGIN_PATCH_VERSION}"
                "JUCE_APP_VERSION_HEX=${PLUGIN_HEX_VERSION}"
                "JucePlugin_Build_VST=0"
                "JucePlugin_Build_VST3=0"
                "JucePlugin_Build_AU=0"
                "JucePlugin_Build_AUv3=0"
                "JucePlugin_Build_RTAS=0"
                "JucePlugin_Build_AAX=1"
                "JucePlugin_Build_Standalone=0"
                "JucePlugin_Build_Unity=0"
                )

        target_compile_options (AAX PRIVATE
                -mmacosx-version-min=10.11
                -O0
                -stdlib=libc++
                )

        set_target_properties (AAX PROPERTIES
                OUTPUT_NAME "NewProject"
                CXX_STANDARD 14
                CXX_EXTENSIONS OFF
                XCODE_ATTRIBUTE_CLANG_LINK_OBJC_RUNTIME NO
                XCODE_ATTRIBUTE_COMBINE_HIDPI_IMAGES YES
                XCODE_ATTRIBUTE_CONFIGURATION_BUILD_DIR "$(PROJECT_DIR)/build/$(CONFIGURATION)"
                XCODE_ATTRIBUTE_COPY_PHASE_STRIP NO
                XCODE_ATTRIBUTE_DEPLOYMENT_LOCATION YES
                XCODE_ATTRIBUTE_DSTROOT /
                XCODE_ATTRIBUTE_GCC_DYNAMIC_NO_PIC NO
                XCODE_ATTRIBUTE_GCC_VERSION com.apple.compilers.llvm.clang.1_0
                XCODE_ATTRIBUTE_GENERATE_PKGINFO_FILE YES
                XCODE_ATTRIBUTE_INFOPLIST_FILE "${CMAKE_CURRENT_BINARY_DIR}/plists/Debug-Info-AAX.plist"
                XCODE_ATTRIBUTE_INFOPLIST_PREPROCESS NO
                XCODE_ATTRIBUTE_INSTALL_PATH "/Library/Application Support/Avid/Audio/Plug-Ins/"
                XCODE_ATTRIBUTE_LIBRARY_STYLE Bundle
                XCODE_ATTRIBUTE_PRODUCT_BUNDLE_IDENTIFIER com.yourcompany.NewProject
                XCODE_ATTRIBUTE_PRODUCT_NAME "NewProject"
                XCODE_ATTRIBUTE_USE_HEADERMAP NO
                XCODE_ATTRIBUTE_WRAPPER_EXTENSION aaxplugin
                MACOSX_BUNDLE_INFO_PLIST "${CMAKE_CURRENT_BINARY_DIR}/plists/Debug-Info-AAX.plist"
                XCODE_ATTRIBUTE_PRODUCT_NAME "NewProject"
                BUNDLE TRUE
                BUNDLE_EXTENSION aaxplugin
                XCODE_ATTRIBUTE_MACH_O_TYPE "mh_bundle"
                )

        target_link_libraries (AAX PRIVATE
                SHARED_CODE
                "-L\"$ENV{HOME}/SDKs/AAX/Libs/Debug\""
                "-lAAXLibrary_libcpp"
                "-framework Accelerate"
                "-framework AudioToolbox"
                "-framework AVFoundation"
                "-framework AVKit"
                "-framework Carbon"
                "-framework Cocoa"
                "-framework CoreAudio"
                "-framework CoreMedia"
                "-framework CoreMIDI"
                "-framework DiscRecording"
                "-framework IOKit"
                "-framework OpenGL"
                "-framework QuartzCore"
                "-framework WebKit"
                )

        add_custom_command (TARGET AAX POST_BUILD
                COMMAND ${CMAKE_COMMAND} -E remove_directory "/Library/Application Support/Avid/Audio/Plug-Ins/NewProject.aaxplugin"
                COMMAND ${CMAKE_COMMAND} -E copy_directory "${CMAKE_BINARY_DIR}/NewProject.aaxplugin" "/Library/Application Support/Avid/Audio/Plug-Ins/NewProject.aaxplugin"
                COMMENT "Copying \"NewProject.aaxplugin\" to \"/Library/Application Support/Avid/Audio/Plug-Ins/\""
                )
    elseif(CMAKE_BUILD_TYPE STREQUAL Release)

        target_include_directories (AAX PRIVATE
                "${JUCE_MODULES_PATH}/juce_audio_processors/format_types/VST3_SDK"
                "../../JuceLibraryCode"
                "$ENV{HOME}/SDKs/AAX"
                "$ENV{HOME}/SDKs/AAX/Interfaces"
                "$ENV{HOME}/SDKs/AAX/Interfaces/ACF"
                "${JUCE_MODULES_PATH}"
                "${JUCE_MODULES_PATH}/juce_audio_plugin_client"
                )

        target_compile_definitions (AAX PRIVATE
                "_NDEBUG=1"
                "NDEBUG=1"
                "JUCER_XCODE_MAC_F6D2F4CF=1"
                "JUCE_APP_VERSION=${PLUGIN_MAJOR_VERSION}.${PLUGIN_MINOR_VERSION}.${PLUGIN_PATCH_VERSION}"
                "JUCE_APP_VERSION_HEX=${PLUGIN_HEX_VERSION}"
                "JucePlugin_Build_VST=0"
                "JucePlugin_Build_VST3=0"
                "JucePlugin_Build_AU=0"
                "JucePlugin_Build_AUv3=0"
                "JucePlugin_Build_RTAS=0"
                "JucePlugin_Build_AAX=1"
                "JucePlugin_Build_Standalone=0"
                "JucePlugin_Build_Unity=0"
                )

        target_compile_options (AAX PRIVATE
                -mmacosx-version-min=10.11
                -O3
                -flto
                -stdlib=libc++
                )

        set_target_properties (AAX PROPERTIES
                OUTPUT_NAME "NewProject"
                CXX_STANDARD 14
                CXX_EXTENSIONS OFF
                XCODE_ATTRIBUTE_CLANG_LINK_OBJC_RUNTIME NO
                XCODE_ATTRIBUTE_COMBINE_HIDPI_IMAGES YES
                XCODE_ATTRIBUTE_CONFIGURATION_BUILD_DIR "$(PROJECT_DIR)/build/$(CONFIGURATION)"
                XCODE_ATTRIBUTE_DEAD_CODE_STRIPPING YES
                XCODE_ATTRIBUTE_DEPLOYMENT_LOCATION YES
                XCODE_ATTRIBUTE_DSTROOT /
                XCODE_ATTRIBUTE_GCC_GENERATE_DEBUGGING_SYMBOLS NO
                XCODE_ATTRIBUTE_GCC_SYMBOLS_PRIVATE_EXTERN YES
                XCODE_ATTRIBUTE_GCC_VERSION com.apple.compilers.llvm.clang.1_0
                XCODE_ATTRIBUTE_GENERATE_PKGINFO_FILE YES
                XCODE_ATTRIBUTE_INFOPLIST_FILE "${CMAKE_CURRENT_BINARY_DIR}/plists/Release-Info-AAX.plist"
                XCODE_ATTRIBUTE_INFOPLIST_PREPROCESS NO
                XCODE_ATTRIBUTE_INSTALL_PATH "/Library/Application Support/Avid/Audio/Plug-Ins/"
                XCODE_ATTRIBUTE_LIBRARY_STYLE Bundle
                XCODE_ATTRIBUTE_PRODUCT_BUNDLE_IDENTIFIER com.yourcompany.NewProject
                XCODE_ATTRIBUTE_PRODUCT_NAME "NewProject"
                XCODE_ATTRIBUTE_USE_HEADERMAP NO
                XCODE_ATTRIBUTE_WRAPPER_EXTENSION aaxplugin
                MACOSX_BUNDLE_INFO_PLIST "${CMAKE_CURRENT_BINARY_DIR}/plists/Release-Info-AAX.plist"
                XCODE_ATTRIBUTE_PRODUCT_NAME "NewProject"
                BUNDLE TRUE
                BUNDLE_EXTENSION aaxplugin
                XCODE_ATTRIBUTE_MACH_O_TYPE "mh_bundle"
                )

        target_link_libraries (AAX PRIVATE
                SHARED_CODE
                "-L\"$ENV{HOME}/SDKs/AAX/Libs/Release\""
                "-lAAXLibrary_libcpp"
                "-framework Accelerate"
                "-framework AudioToolbox"
                "-framework AVFoundation"
                "-framework AVKit"
                "-framework Carbon"
                "-framework Cocoa"
                "-framework CoreAudio"
                "-framework CoreMedia"
                "-framework CoreMIDI"
                "-framework DiscRecording"
                "-framework IOKit"
                "-framework OpenGL"
                "-framework QuartzCore"
                "-framework WebKit"
                )

        add_custom_command (TARGET AAX POST_BUILD
                COMMAND ${CMAKE_COMMAND} -E remove_directory "/Library/Application Support/Avid/Audio/Plug-Ins/NewProject.aaxplugin"
                COMMAND ${CMAKE_COMMAND} -E copy_directory "${CMAKE_BINARY_DIR}/NewProject.aaxplugin" "/Library/Application Support/Avid/Audio/Plug-Ins/NewProject.aaxplugin"
                COMMENT "Copying \"NewProject.aaxplugin\" to \"/Library/Application Support/Avid/Audio/Plug-Ins/\""
                )
    endif()
endfunction()



#[[
    Target setup for AU BUILD (APPLE)
##]]
function(MakeBuildAU)
    if (CMAKE_BUILD_TYPE STREQUAL Debug)
        target_include_directories (AU PRIVATE
                "${JUCE_MODULES_PATH}/juce_audio_processors/format_types/VST3_SDK"
                "JuceLibraryCode"
                "${JUCE_MODULES_PATH}"
                "${JUCE_MODULES_PATH}/juce_audio_plugin_client"
                )

        target_compile_definitions (AU PRIVATE
                "_DEBUG=1"
                "DEBUG=1"
                "JUCER_XCODE_MAC_F6D2F4CF=1"
                "JUCE_APP_VERSION=${PLUGIN_MAJOR_VERSION}.${PLUGIN_MINOR_VERSION}.${PLUGIN_PATCH_VERSION}"
                "JUCE_APP_VERSION_HEX=${PLUGIN_HEX_VERSION}"
                "JucePlugin_Build_VST=0"
                "JucePlugin_Build_VST3=0"
                "JucePlugin_Build_AU=1"
                "JucePlugin_Build_AUv3=0"
                "JucePlugin_Build_RTAS=0"
                "JucePlugin_Build_AAX=0"
                "JucePlugin_Build_Standalone=0"
                "JucePlugin_Build_Unity=0"
                )

        target_compile_options (AU PRIVATE
                -mmacosx-version-min=10.11
                -O0
                -stdlib=libc++
                )

        set_target_properties (AU PROPERTIES
                OUTPUT_NAME "${PROJECT_NAME}"
                CXX_STANDARD 14
                CXX_EXTENSIONS OFF
                XCODE_ATTRIBUTE_CLANG_LINK_OBJC_RUNTIME NO
                XCODE_ATTRIBUTE_COMBINE_HIDPI_IMAGES YES
                XCODE_ATTRIBUTE_CONFIGURATION_BUILD_DIR "$(PROJECT_DIR)/build/$(CONFIGURATION)"
                XCODE_ATTRIBUTE_COPY_PHASE_STRIP NO
                XCODE_ATTRIBUTE_DEPLOYMENT_LOCATION YES
                XCODE_ATTRIBUTE_DSTROOT /
                XCODE_ATTRIBUTE_GCC_DYNAMIC_NO_PIC NO
                XCODE_ATTRIBUTE_GCC_VERSION com.apple.compilers.llvm.clang.1_0
                XCODE_ATTRIBUTE_GENERATE_PKGINFO_FILE YES
                XCODE_ATTRIBUTE_INFOPLIST_FILE "${CMAKE_CURRENT_BINARY_DIR}/plists/Debug-Info-AU.plist"
                XCODE_ATTRIBUTE_INFOPLIST_PREPROCESS NO
                XCODE_ATTRIBUTE_INSTALL_PATH "$ENV{HOME}/Library/Audio/Plug-Ins/Components/"
                XCODE_ATTRIBUTE_LIBRARY_STYLE Bundle
                XCODE_ATTRIBUTE_PRODUCT_BUNDLE_IDENTIFIER com.${COMPANY_ID}.${PROJECT_NAME}
                XCODE_ATTRIBUTE_PRODUCT_NAME "${PROJECT_NAME}"
                XCODE_ATTRIBUTE_USE_HEADERMAP NO
                XCODE_ATTRIBUTE_WRAPPER_EXTENSION component
                MACOSX_BUNDLE_INFO_PLIST "${CMAKE_CURRENT_BINARY_DIR}/plists/Debug-Info-AU.plist"
                XCODE_ATTRIBUTE_PRODUCT_NAME "${PROJECT_NAME}"
                BUNDLE TRUE
                BUNDLE_EXTENSION component
                XCODE_ATTRIBUTE_MACH_O_TYPE "mh_bundle"
                )

        target_link_libraries (AU PRIVATE
                SHARED_CODE
                "-framework Accelerate"
                "-framework AudioToolbox"
                "-framework AudioUnit"
                "-framework Carbon"
                "-framework Cocoa"
                "-framework CoreAudio"
                "-framework CoreAudioKit"
                "-framework CoreMIDI"
                "-framework DiscRecording"
                "-framework IOKit"
                "-framework OpenGL"
                "-framework QuartzCore"
                "-framework WebKit"
                )

        add_custom_command (TARGET AU POST_BUILD
                COMMAND ${CMAKE_COMMAND} -E remove_directory "$ENV{HOME}/Library/Audio/Plug-Ins/Components/${PROJECT_NAME}.component"
                COMMAND ${CMAKE_COMMAND} -E copy_directory "${CMAKE_BINARY_DIR}/${PROJECT_NAME}.component" "$ENV{HOME}/Library/Audio/Plug-Ins/Components/${PROJECT_NAME}.component"
                COMMENT "Copying \"${PROJECT_NAME}.component\" to \"$ENV{HOME}/Library/Audio/Plug-Ins/Components/\""
                )
    elseif(CMAKE_BUILD_TYPE STREQUAL Release)

        target_include_directories (AU PRIVATE
                "${JUCE_MODULES_PATH}/juce_audio_processors/format_types/VST3_SDK"
                "JuceLibraryCode"
                "${JUCE_MODULES_PATH}"
                "${JUCE_MODULES_PATH}/juce_audio_plugin_client"
                )

        target_compile_definitions (AU PRIVATE
                "_NDEBUG=1"
                "NDEBUG=1"
                "JUCER_XCODE_MAC_F6D2F4CF=1"
                "JUCE_APP_VERSION=${PLUGIN_MAJOR_VERSION}.${PLUGIN_MINOR_VERSION}.${PLUGIN_PATCH_VERSION}"
                "JUCE_APP_VERSION_HEX=${PLUGIN_HEX_VERSION}"
                "JucePlugin_Build_VST=0"
                "JucePlugin_Build_VST3=0"
                "JucePlugin_Build_AU=1"
                "JucePlugin_Build_AUv3=0"
                "JucePlugin_Build_RTAS=0"
                "JucePlugin_Build_AAX=0"
                "JucePlugin_Build_Standalone=0"
                "JucePlugin_Build_Unity=0"
                )

        target_compile_options (AU PRIVATE
                -mmacosx-version-min=10.11
                -O3
                -flto
                -stdlib=libc++
                )

        set_target_properties (AU PROPERTIES
                OUTPUT_NAME "${PROJECT_NAME}"
                CXX_STANDARD 14
                CXX_EXTENSIONS OFF
                XCODE_ATTRIBUTE_CLANG_LINK_OBJC_RUNTIME NO
                XCODE_ATTRIBUTE_COMBINE_HIDPI_IMAGES YES
                XCODE_ATTRIBUTE_CONFIGURATION_BUILD_DIR "$(PROJECT_DIR)/build/$(CONFIGURATION)"
                XCODE_ATTRIBUTE_DEAD_CODE_STRIPPING YES
                XCODE_ATTRIBUTE_DEPLOYMENT_LOCATION YES
                XCODE_ATTRIBUTE_DSTROOT /
                XCODE_ATTRIBUTE_GCC_GENERATE_DEBUGGING_SYMBOLS NO
                XCODE_ATTRIBUTE_GCC_SYMBOLS_PRIVATE_EXTERN YES
                XCODE_ATTRIBUTE_GCC_VERSION com.apple.compilers.llvm.clang.1_0
                XCODE_ATTRIBUTE_GENERATE_PKGINFO_FILE YES
                XCODE_ATTRIBUTE_INFOPLIST_FILE "${CMAKE_CURRENT_BINARY_DIR}/plists/Release-Info-AU.plist"
                XCODE_ATTRIBUTE_INFOPLIST_PREPROCESS NO
                XCODE_ATTRIBUTE_INSTALL_PATH "$ENV{HOME}/Library/Audio/Plug-Ins/Components/"
                XCODE_ATTRIBUTE_LIBRARY_STYLE Bundle
                XCODE_ATTRIBUTE_PRODUCT_BUNDLE_IDENTIFIER com.${COMPANY_ID}.${PROJECT_NAME}
                XCODE_ATTRIBUTE_PRODUCT_NAME "${PROJECT_NAME}"
                XCODE_ATTRIBUTE_USE_HEADERMAP NO
                XCODE_ATTRIBUTE_WRAPPER_EXTENSION component
                MACOSX_BUNDLE_INFO_PLIST "${CMAKE_CURRENT_BINARY_DIR}/plists/Release-Info-AU.plist"
                XCODE_ATTRIBUTE_PRODUCT_NAME "${PROJECT_NAME}"
                BUNDLE TRUE
                BUNDLE_EXTENSION component
                XCODE_ATTRIBUTE_MACH_O_TYPE "mh_bundle"
                )

        target_link_libraries (AU PRIVATE
                SHARED_CODE
                "-framework Accelerate"
                "-framework AudioToolbox"
                "-framework AudioUnit"
                "-framework Carbon"
                "-framework Cocoa"
                "-framework CoreAudio"
                "-framework CoreAudioKit"
                "-framework CoreMIDI"
                "-framework DiscRecording"
                "-framework IOKit"
                "-framework OpenGL"
                "-framework QuartzCore"
                "-framework WebKit"
                )

        add_custom_command (TARGET AU POST_BUILD
                COMMAND ${CMAKE_COMMAND} -E remove_directory "$ENV{HOME}/Library/Audio/Plug-Ins/Components/${PROJECT_NAME}.component"
                COMMAND ${CMAKE_COMMAND} -E copy_directory "${CMAKE_BINARY_DIR}/${PROJECT_NAME}.component" "$ENV{HOME}/Library/Audio/Plug-Ins/Components/${PROJECT_NAME}.component"
                COMMENT "Copying \"${PROJECT_NAME}.component\" to \"$ENV{HOME}/Library/Audio/Plug-Ins/Components/\""
                )
    endif()
endfunction()

#[[
    Target setup for VST3 BUILD (APPLE)
##]]
function(MakeBuildVST3)
    if (CMAKE_BUILD_TYPE STREQUAL Debug)
        target_include_directories (VST3 PRIVATE
                "${JUCE_MODULES_PATH}/juce_audio_processors/format_types/VST3_SDK"
                "JuceLibraryCode"
                "${JUCE_MODULES_PATH}"
                "${JUCE_MODULES_PATH}/juce_audio_plugin_client"
                )

        target_compile_definitions (VST3 PRIVATE
                "_DEBUG=1"
                "DEBUG=1"
                "JUCER_XCODE_MAC_F6D2F4CF=1"
                "JUCE_APP_VERSION=${PLUGIN_MAJOR_VERSION}.${PLUGIN_MINOR_VERSION}.${PLUGIN_MAJOR_PATCH}"
                "JUCE_APP_VERSION_HEX=${PLUGIN_HEX_VERSION}"
                "JucePlugin_Build_VST=0"
                "JucePlugin_Build_VST3=1"
                "JucePlugin_Build_AU=0"
                "JucePlugin_Build_AUv3=0"
                "JucePlugin_Build_RTAS=0"
                "JucePlugin_Build_AAX=0"
                "JucePlugin_Build_Standalone=0"
                "JucePlugin_Build_Unity=0"
                )

        target_compile_options (VST3 PRIVATE
                -mmacosx-version-min=10.11
                -O0
                -stdlib=libc++
                )

        set_target_properties (VST3 PROPERTIES
                OUTPUT_NAME "${PROJECT_NAME}"
                CXX_STANDARD 14
                CXX_EXTENSIONS OFF
                XCODE_ATTRIBUTE_CLANG_LINK_OBJC_RUNTIME NO
                XCODE_ATTRIBUTE_COMBINE_HIDPI_IMAGES YES
                XCODE_ATTRIBUTE_CONFIGURATION_BUILD_DIR "$(PROJECT_DIR)/build/$(CONFIGURATION)"
                XCODE_ATTRIBUTE_COPY_PHASE_STRIP NO
                XCODE_ATTRIBUTE_DEPLOYMENT_LOCATION YES
                XCODE_ATTRIBUTE_DSTROOT /
                XCODE_ATTRIBUTE_GCC_DYNAMIC_NO_PIC NO
                XCODE_ATTRIBUTE_GCC_VERSION com.apple.compilers.llvm.clang.1_0
                XCODE_ATTRIBUTE_GENERATE_PKGINFO_FILE YES
                XCODE_ATTRIBUTE_INFOPLIST_FILE "${CMAKE_CURRENT_BINARY_DIR}/plists/Debug-Info-VST3.plist"
                XCODE_ATTRIBUTE_INFOPLIST_PREPROCESS NO
                XCODE_ATTRIBUTE_INSTALL_PATH "$ENV{HOME}/Library/Audio/Plug-Ins/VST3/"
                XCODE_ATTRIBUTE_LIBRARY_STYLE Bundle
                XCODE_ATTRIBUTE_PRODUCT_BUNDLE_IDENTIFIER com.${COMPANY_ID}.${PROJECT_NAME}
                XCODE_ATTRIBUTE_PRODUCT_NAME "${PROJECT_NAME}"
                XCODE_ATTRIBUTE_USE_HEADERMAP NO
                XCODE_ATTRIBUTE_WRAPPER_EXTENSION vst3
                MACOSX_BUNDLE_INFO_PLIST "${CMAKE_CURRENT_BINARY_DIR}/plists/Debug-Info-VST3.plist"
                XCODE_ATTRIBUTE_PRODUCT_NAME "${PROJECT_NAME}"
                BUNDLE TRUE
                BUNDLE_EXTENSION vst3
                XCODE_ATTRIBUTE_MACH_O_TYPE "mh_bundle"
                )

        target_link_libraries (VST3 PRIVATE
                SHARED_CODE
                "-framework Accelerate"
                "-framework AudioToolbox"
                "-framework Carbon"
                "-framework Cocoa"
                "-framework CoreAudio"
                "-framework CoreMIDI"
                "-framework DiscRecording"
                "-framework IOKit"
                "-framework OpenGL"
                "-framework QuartzCore"
                "-framework WebKit"
                )

        add_custom_command (TARGET VST3 POST_BUILD
                COMMAND ${CMAKE_COMMAND} -E remove_directory "$ENV{HOME}/Library/Audio/Plug-Ins/VST3/${PROJECT_NAME}.vst3"
                COMMAND ${CMAKE_COMMAND} -E copy_directory "${CMAKE_BINARY_DIR}/${PROJECT_NAME}.vst3" "$ENV{HOME}/Library/Audio/Plug-Ins/VST3/${PROJECT_NAME}.vst3"
                COMMENT "Copying \"${PROJECT_NAME}.vst3\" to \"$ENV{HOME}/Library/Audio/Plug-Ins/VST3/\""
                )
    elseif(CMAKE_BUILD_TYPE STREQUAL Release)
        target_include_directories (VST3 PRIVATE
                "${JUCE_MODULES_PATH}/juce_audio_processors/format_types/VST3_SDK"
                "JuceLibraryCode"
                "${JUCE_MODULES_PATH}"
                "${JUCE_MODULES_PATH}/juce_audio_plugin_client"
                )

        target_compile_definitions (VST3 PRIVATE
                "_NDEBUG=1"
                "NDEBUG=1"
                "JUCER_XCODE_MAC_F6D2F4CF=1"
                "JUCE_APP_VERSION=${PLUGIN_MAJOR_VERSION}.${PLUGIN_MINOR_VERSION}.${PLUGIN_PATCH_VERSION}"
                "JUCE_APP_VERSION_HEX=${PLUGIN_HEX_VERSION}"
                "JucePlugin_Build_VST=0"
                "JucePlugin_Build_VST3=1"
                "JucePlugin_Build_AU=0"
                "JucePlugin_Build_AUv3=0"
                "JucePlugin_Build_RTAS=0"
                "JucePlugin_Build_AAX=0"
                "JucePlugin_Build_Standalone=0"
                "JucePlugin_Build_Unity=0"
                )

        target_compile_options (VST3 PRIVATE
                -mmacosx-version-min=10.11
                -O3
                -flto
                -stdlib=libc++
                )

        set_target_properties (VST3 PROPERTIES
                OUTPUT_NAME "${PROJECT_NAME}"
                CXX_STANDARD 14
                CXX_EXTENSIONS OFF
                XCODE_ATTRIBUTE_CLANG_LINK_OBJC_RUNTIME NO
                XCODE_ATTRIBUTE_COMBINE_HIDPI_IMAGES YES
                XCODE_ATTRIBUTE_CONFIGURATION_BUILD_DIR "$(PROJECT_DIR)/build/$(CONFIGURATION)"
                XCODE_ATTRIBUTE_DEAD_CODE_STRIPPING YES
                XCODE_ATTRIBUTE_DEPLOYMENT_LOCATION YES
                XCODE_ATTRIBUTE_DSTROOT /
                XCODE_ATTRIBUTE_GCC_GENERATE_DEBUGGING_SYMBOLS NO
                XCODE_ATTRIBUTE_GCC_SYMBOLS_PRIVATE_EXTERN YES
                XCODE_ATTRIBUTE_GCC_VERSION com.apple.compilers.llvm.clang.1_0
                XCODE_ATTRIBUTE_GENERATE_PKGINFO_FILE YES
                XCODE_ATTRIBUTE_INFOPLIST_FILE "${CMAKE_CURRENT_BINARY_DIR}/plists/Release-Info-VST3.plist"
                XCODE_ATTRIBUTE_INFOPLIST_PREPROCESS NO
                XCODE_ATTRIBUTE_INSTALL_PATH "$(HOME)/Library/Audio/Plug-Ins/VST3/"
                XCODE_ATTRIBUTE_LIBRARY_STYLE Bundle
                XCODE_ATTRIBUTE_PRODUCT_BUNDLE_IDENTIFIER com.${COMPANY_ID}.${PROJECT_NAME}
                XCODE_ATTRIBUTE_PRODUCT_NAME "${PROJECT_NAME}"
                XCODE_ATTRIBUTE_USE_HEADERMAP NO
                XCODE_ATTRIBUTE_WRAPPER_EXTENSION vst3
                MACOSX_BUNDLE_INFO_PLIST "${CMAKE_CURRENT_BINARY_DIR}/plists/Release-Info-VST3.plist"
                XCODE_ATTRIBUTE_PRODUCT_NAME "${PROJECT_NAME}"
                BUNDLE TRUE
                BUNDLE_EXTENSION vst3
                XCODE_ATTRIBUTE_MACH_O_TYPE "mh_bundle"
                )

        target_link_libraries (VST3 PRIVATE
                SHARED_CODE
                "-framework Accelerate"
                "-framework AudioToolbox"
                "-framework Carbon"
                "-framework Cocoa"
                "-framework CoreAudio"
                "-framework CoreMIDI"
                "-framework DiscRecording"
                "-framework IOKit"
                "-framework OpenGL"
                "-framework QuartzCore"
                "-framework WebKit"
                )

        add_custom_command (TARGET VST3 POST_BUILD
                COMMAND ${CMAKE_COMMAND} -E remove_directory "$ENV{HOME}/Library/Audio/Plug-Ins/VST3/${PROJECT_NAME}.vst3"
                COMMAND ${CMAKE_COMMAND} -E copy_directory "${CMAKE_BINARY_DIR}/${PROJECT_NAME}.vst3" "$ENV{HOME}/Library/Audio/Plug-Ins/VST3/${PROJECT_NAME}.vst3"
                COMMENT "Copying \"${PROJECT_NAME}.vst3\" to \"$ENV{HOME}/Library/Audio/Plug-Ins/VST3/\""
                )
    endif()
endfunction()


#[[
    Target setup for STANDALONE BUILD (APPLE)
##]]
function(MakeBuildStandalone)
    if(CMAKE_BUILD_TYPE STREQUAL Debug)
        target_include_directories (STANDALONE_PLUGIN PRIVATE
                "${JUCE_MODULES_PATH}/juce_audio_processors/format_types/VST3_SDK"
                "JuceLibraryCode"
                "${JUCE_MODULES_PATH}"
                "${JUCE_MODULES_PATH}/juce_audio_plugin_client"
                )

        target_compile_definitions (STANDALONE_PLUGIN PRIVATE
                "_DEBUG=1"
                "DEBUG=1"
                "JUCER_XCODE_MAC_F6D2F4CF=1"
                "JUCE_APP_VERSION=${PLUGIN_MAJOR_VERSION}.${PLUGIN_MINOR_VERSION}.${PLUGIN_PATCH_VERSION}"
                "JUCE_APP_VERSION_HEX=${PLUGIN_HEX_VERSION}"
                "JucePlugin_Build_VST=0"
                "JucePlugin_Build_VST3=0"
                "JucePlugin_Build_AU=0"
                "JucePlugin_Build_AUv3=0"
                "JucePlugin_Build_RTAS=0"
                "JucePlugin_Build_AAX=0"
                "JucePlugin_Build_Standalone=1"
                "JucePlugin_Build_Unity=0"
                )

        target_compile_options (STANDALONE_PLUGIN PRIVATE
                -mmacosx-version-min=10.11
                -O0
                -stdlib=libc++
                )

        set_target_properties (STANDALONE_PLUGIN PROPERTIES
                OUTPUT_NAME "${PROJECT_NAME}"
                CXX_STANDARD 14
                CXX_EXTENSIONS OFF
                XCODE_ATTRIBUTE_CLANG_LINK_OBJC_RUNTIME NO
                XCODE_ATTRIBUTE_COMBINE_HIDPI_IMAGES YES
                XCODE_ATTRIBUTE_CONFIGURATION_BUILD_DIR "$(PROJECT_DIR)/build/$(CONFIGURATION)"
                XCODE_ATTRIBUTE_COPY_PHASE_STRIP NO
                XCODE_ATTRIBUTE_GCC_DYNAMIC_NO_PIC NO
                XCODE_ATTRIBUTE_GCC_VERSION com.apple.compilers.llvm.clang.1_0
                XCODE_ATTRIBUTE_INFOPLIST_FILE "${CMAKE_CURRENT_BINARY_DIR}/plists/Debug-Info-Standalone_Plugin.plist"
                XCODE_ATTRIBUTE_INFOPLIST_PREPROCESS NO
                XCODE_ATTRIBUTE_PRODUCT_BUNDLE_IDENTIFIER com.${COMPANY_ID}.${PROJECT_NAME}
                XCODE_ATTRIBUTE_PRODUCT_NAME "${PROJECT_NAME}"
                XCODE_ATTRIBUTE_USE_HEADERMAP NO
                MACOSX_BUNDLE_INFO_PLIST "${CMAKE_CURRENT_BINARY_DIR}/plists/Debug-Info-Standalone_Plugin.plist"
                XCODE_ATTRIBUTE_PRODUCT_NAME "${PROJECT_NAME}"
                MACOSX_BUNDLE TRUE
                )

        target_link_libraries (STANDALONE_PLUGIN PRIVATE
                SHARED_CODE
                "-framework Accelerate"
                "-framework AudioToolbox"
                "-framework Carbon"
                "-framework Cocoa"
                "-framework CoreAudio"
                "-framework CoreMIDI"
                "-framework DiscRecording"
                "-framework IOKit"
                "-framework OpenGL"
                "-framework QuartzCore"
                "-framework WebKit"
                )
    elseif(CMAKE_BUILD_TYPE STREQUAL Release)
        target_include_directories (STANDALONE_PLUGIN PRIVATE
                "${JUCE_MODULES_PATH}/juce_audio_processors/format_types/VST3_SDK"
                "JuceLibraryCode"
                "${JUCE_MODULES_PATH}"
                "${JUCE_MODULES_PATH}/juce_audio_plugin_client"
                )

        target_compile_definitions (STANDALONE_PLUGIN PRIVATE
                "_NDEBUG=1"
                "NDEBUG=1"
                "JUCER_XCODE_MAC_F6D2F4CF=1"
                "JUCE_APP_VERSION=${PLUGIN_MAJOR_VERSION}.${PLUGIN_MINOR_VERSION}.${PLUGIN_PATCH_VERSION}"
                "JUCE_APP_VERSION_HEX=${PLUGIN_HEX_VERSION}"
                "JucePlugin_Build_VST=0"
                "JucePlugin_Build_VST3=0"
                "JucePlugin_Build_AU=0"
                "JucePlugin_Build_AUv3=0"
                "JucePlugin_Build_RTAS=0"
                "JucePlugin_Build_AAX=0"
                "JucePlugin_Build_Standalone=1"
                "JucePlugin_Build_Unity=0"
                )

        target_compile_options (STANDALONE_PLUGIN PRIVATE
                -mmacosx-version-min=10.11
                -O3
                -flto
                -stdlib=libc++
                )

        set_target_properties (STANDALONE_PLUGIN PROPERTIES
                OUTPUT_NAME "${PROJECT_NAME}"
                CXX_STANDARD 14
                CXX_EXTENSIONS OFF
                XCODE_ATTRIBUTE_CLANG_LINK_OBJC_RUNTIME NO
                XCODE_ATTRIBUTE_COMBINE_HIDPI_IMAGES YES
                XCODE_ATTRIBUTE_CONFIGURATION_BUILD_DIR "$(PROJECT_DIR)/build/$(CONFIGURATION)"
                XCODE_ATTRIBUTE_DEAD_CODE_STRIPPING YES
                XCODE_ATTRIBUTE_GCC_GENERATE_DEBUGGING_SYMBOLS NO
                XCODE_ATTRIBUTE_GCC_SYMBOLS_PRIVATE_EXTERN YES
                XCODE_ATTRIBUTE_GCC_VERSION com.apple.compilers.llvm.clang.1_0
                XCODE_ATTRIBUTE_INFOPLIST_FILE "${CMAKE_CURRENT_BINARY_DIR}/plists/Release-Info-Standalone_Plugin.plist"
                XCODE_ATTRIBUTE_INFOPLIST_PREPROCESS NO
                XCODE_ATTRIBUTE_PRODUCT_BUNDLE_IDENTIFIER com.${COMPANY_ID}.${PROJECT_NAME}
                XCODE_ATTRIBUTE_PRODUCT_NAME "${PROJECT_NAME}"
                XCODE_ATTRIBUTE_USE_HEADERMAP NO
                MACOSX_BUNDLE_INFO_PLIST "${CMAKE_CURRENT_BINARY_DIR}/plists/Release-Info-Standalone_Plugin.plist"
                XCODE_ATTRIBUTE_PRODUCT_NAME "${PROJECT_NAME}"
                MACOSX_BUNDLE TRUE
                )

        target_link_libraries (STANDALONE_PLUGIN PRIVATE
                SHARED_CODE
                "-framework Accelerate"
                "-framework AudioToolbox"
                "-framework Carbon"
                "-framework Cocoa"
                "-framework CoreAudio"
                "-framework CoreMIDI"
                "-framework DiscRecording"
                "-framework IOKit"
                "-framework OpenGL"
                "-framework QuartzCore"
                "-framework WebKit"
                )
    endif()
endfunction()



#[[
    Target setup for SHARED_CODE BUILD (APPLE)
##]]
function(MakeBuildSHARED_CODE)
    if(CMAKE_BUILD_TYPE STREQUAL Debug)
        target_include_directories (SHARED_CODE PRIVATE
                "${JUCE_MODULES_PATH}/juce_audio_processors/format_types/VST3_SDK"
                "JuceLibraryCode"
                "${JUCE_MODULES_PATH}"
                "${JUCE_MODULES_PATH}/juce_audio_plugin_client"
                )

        target_compile_definitions (SHARED_CODE PRIVATE
                "_DEBUG=1"
                "DEBUG=1"
                "JUCER_XCODE_MAC_F6D2F4CF=1"
                "JUCE_APP_VERSION=${PLUGIN_MAJOR_VERSION}.${PLUGIN_MINOR_VERSION}.${PLUGIN_PATCH_VERSION}"
                "JUCE_APP_VERSION_HEX=${PLUGIN_HEX_VERSION}"
                "JucePlugin_Build_VST=1"
                "JucePlugin_Build_VST3=1"
                "JucePlugin_Build_AU=1"
                "JucePlugin_Build_AUv3=1"
                "JucePlugin_Build_RTAS=1"
                "JucePlugin_Build_AAX=1"
                "JucePlugin_Build_Standalone=1"
                "JucePlugin_Build_Unity=0"
                "JUCE_SHARED_CODE=1"
                )

        target_compile_options (SHARED_CODE PRIVATE
                -mmacosx-version-min=10.11
                -O0
                -stdlib=libc++
                )

        set_target_properties (SHARED_CODE PROPERTIES
                OUTPUT_NAME "${PROJECT_NAME}"
                CXX_STANDARD 14
                CXX_EXTENSIONS OFF
                XCODE_ATTRIBUTE_CLANG_LINK_OBJC_RUNTIME NO
                XCODE_ATTRIBUTE_COMBINE_HIDPI_IMAGES YES
                XCODE_ATTRIBUTE_CONFIGURATION_BUILD_DIR "$(PROJECT_DIR)/build/$(CONFIGURATION)"
                XCODE_ATTRIBUTE_COPY_PHASE_STRIP NO
                XCODE_ATTRIBUTE_GCC_DYNAMIC_NO_PIC NO
                XCODE_ATTRIBUTE_GCC_VERSION com.apple.compilers.llvm.clang.1_0
                XCODE_ATTRIBUTE_INSTALL_PATH "@executable_path/../Frameworks"
                XCODE_ATTRIBUTE_PRODUCT_BUNDLE_IDENTIFIER com.${COMPANY_ID}.${PROJECT_NAME}
                XCODE_ATTRIBUTE_PRODUCT_NAME "${PROJECT_NAME}"
                XCODE_ATTRIBUTE_SKIP_INSTALL YES
                XCODE_ATTRIBUTE_USE_HEADERMAP NO
                )

        target_link_libraries (SHARED_CODE PRIVATE
                "-framework Accelerate"
                "-framework AudioToolbox"
                "-framework Carbon"
                "-framework Cocoa"
                "-framework CoreAudio"
                "-framework CoreMIDI"
                "-framework DiscRecording"
                "-framework IOKit"
                "-framework OpenGL"
                "-framework QuartzCore"
                "-framework WebKit"
                )
    elseif(CMAKE_BUILD_TYPE STREQUAL Release)
        target_include_directories (SHARED_CODE PRIVATE
                "${JUCE_MODULES_PATH}/juce_audio_processors/format_types/VST3_SDK"
                "JuceLibraryCode"
                "${JUCE_MODULES_PATH}"
                "${JUCE_MODULES_PATH}/juce_audio_plugin_client"
                )

        target_compile_definitions (SHARED_CODE PRIVATE
                "_NDEBUG=1"
                "NDEBUG=1"
                "JUCER_XCODE_MAC_F6D2F4CF=1"
                "JUCE_APP_VERSION=${PLUGIN_MAJOR_VERSION}.${PLUGIN_MINOR_VERSION}.${PLUGIN_PATCH_VERSION}"
                "JUCE_APP_VERSION_HEX=${PLUGIN_HEX_VERSION}"
                "JucePlugin_Build_VST=0"
                "JucePlugin_Build_VST3=1"
                "JucePlugin_Build_AU=1"
                "JucePlugin_Build_AUv3=0"
                "JucePlugin_Build_RTAS=0"
                "JucePlugin_Build_AAX=0"
                "JucePlugin_Build_Standalone=1"
                "JucePlugin_Build_Unity=0"
                "JUCE_SHARED_CODE=1"
                )

        target_compile_options (SHARED_CODE PRIVATE
                -mmacosx-version-min=10.11
                -O3
                -flto
                -stdlib=libc++
                )

        set_target_properties (SHARED_CODE PROPERTIES
                OUTPUT_NAME "${PROJECT_NAME}"
                CXX_STANDARD 14
                CXX_EXTENSIONS OFF
                XCODE_ATTRIBUTE_CLANG_LINK_OBJC_RUNTIME NO
                XCODE_ATTRIBUTE_COMBINE_HIDPI_IMAGES YES
                XCODE_ATTRIBUTE_CONFIGURATION_BUILD_DIR "$(PROJECT_DIR)/build/$(CONFIGURATION)"
                XCODE_ATTRIBUTE_DEAD_CODE_STRIPPING YES
                XCODE_ATTRIBUTE_GCC_GENERATE_DEBUGGING_SYMBOLS NO
                XCODE_ATTRIBUTE_GCC_SYMBOLS_PRIVATE_EXTERN YES
                XCODE_ATTRIBUTE_GCC_VERSION com.apple.compilers.llvm.clang.1_0
                XCODE_ATTRIBUTE_INSTALL_PATH "@executable_path/../Frameworks"
                XCODE_ATTRIBUTE_PRODUCT_BUNDLE_IDENTIFIER com.${COMPANY_ID}.${PROJECT_NAME}
                XCODE_ATTRIBUTE_PRODUCT_NAME "${PROJECT_NAME}"
                XCODE_ATTRIBUTE_SKIP_INSTALL YES
                XCODE_ATTRIBUTE_USE_HEADERMAP NO
                )

        target_link_libraries (SHARED_CODE PRIVATE
                "-framework Accelerate"
                "-framework AudioToolbox"
                "-framework Carbon"
                "-framework Cocoa"
                "-framework CoreAudio"
                "-framework CoreMIDI"
                "-framework DiscRecording"
                "-framework IOKit"
                "-framework OpenGL"
                "-framework QuartzCore"
                "-framework WebKit"
                )
    endif()
endfunction()