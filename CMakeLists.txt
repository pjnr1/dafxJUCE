set (CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/cmake)
find_package(JUCEcmakehelpers)

# Edited from auto-generated cmakelists file from Projucer
# Requires the debug and release plists to be put in folder plists (#refactor me)
# Set your company-id and the name of the project here:
set(PROJECT_NAME dafxJUCE)
set(COMPANY_ID pjnr1)
message("Reloading:\tcom.${COMPANY_ID}.${PROJECT_NAME}")

cmake_minimum_required (VERSION 3.4.1)

message("Build path ${CMAKE_CURRENT_BINARY_DIR}")

SetAppVersion(0 1 0)

ConfigureJUCEAppHeaders()

SET(BUILD_AU 1)
SET(BUILD_VST3 1)
SET(BUILD_AAX 0)
SET(BUILD_RTAS 0)
SET(BUILD_STANDALONE 1)

if(BUILD_AU)
    ConfigureJUCEplists(AU)
endif()
if(BUILD_VST3)
    ConfigureJUCEplists(VST3)
endif()
if(BUILD_RTAS)
    ConfigureJUCEplists(RTAS)
endif()
if(BUILD_AAX)
    ConfigureJUCEplists(AAX)
endif()
if(BUILD_STANDALONE)
    ConfigureJUCEplists(Standalone_Plugin)
endif()


if (NOT CMAKE_BUILD_TYPE)
    set (CMAKE_BUILD_TYPE "Debug"  CACHE STRING "Choose the type of build." FORCE)
endif (NOT CMAKE_BUILD_TYPE)

set(JUCE_MODULES_PATH "/Applications/JUCE/modules")

###############################################################################
# Xcode (MacOSX)
###############################################################################

if (APPLE)

project("${PROJECT_NAME}" C CXX )
if(COMMAND cmake_policy)
    cmake_policy(SET CMP0003 NEW)
endif(COMMAND cmake_policy)

AddAudioPluginModules()

add_executable (STANDALONE_PLUGIN
    "${JUCE_MODULES_PATH}/juce_audio_plugin_client/juce_audio_plugin_client_Standalone.cpp"
)

set_source_files_properties ("${JUCE_MODULES_PATH}/juce_audio_plugin_client/juce_audio_plugin_client_Standalone.cpp" PROPERTIES HEADER_FILE_ONLY TRUE)

# Get full src
file(GLOB ${PROJECT_NAME}_SOURCE
        "src/*.h"
        "src/*.cpp"
        )

# Get full src (headers only)
file(GLOB ${PROJECT_NAME}_HEADERS
        "src/*.h"
        )

# Get all JUCE-modules source/headers
file(GLOB_RECURSE JUCE_MODULES
        ${JUCE_MODULES_PATH}
        "${JUCE_MODULES_PATH}/juce_analytics/*.cpp"
        "${JUCE_MODULES_PATH}/juce_analytics/*.mm"
        "${JUCE_MODULES_PATH}/juce_analytics/*.h"
        "${JUCE_MODULES_PATH}/juce_audio_basics/*.cpp"
        "${JUCE_MODULES_PATH}/juce_audio_basics/*.mm"
        "${JUCE_MODULES_PATH}/juce_audio_basics/*.h"
        "${JUCE_MODULES_PATH}/juce_audio_devices/*.cpp"
        "${JUCE_MODULES_PATH}/juce_audio_devices/*.mm"
        "${JUCE_MODULES_PATH}/juce_audio_devices/*.h"
        "${JUCE_MODULES_PATH}/juce_audio_formats/*.cpp"
        "${JUCE_MODULES_PATH}/juce_audio_formats/*.mm"
        "${JUCE_MODULES_PATH}/juce_audio_formats/*.h"
        "${JUCE_MODULES_PATH}/juce_audio_plugin_client/*.cpp"
        "${JUCE_MODULES_PATH}/juce_audio_plugin_client/*.mm"
        "${JUCE_MODULES_PATH}/juce_audio_plugin_client/*.h"
        "${JUCE_MODULES_PATH}/juce_audio_processors/*.cpp"
        "${JUCE_MODULES_PATH}/juce_audio_processors/*.mm"
        "${JUCE_MODULES_PATH}/juce_audio_processors/*.h"
        "${JUCE_MODULES_PATH}/juce_audio_utils/*.cpp"
        "${JUCE_MODULES_PATH}/juce_audio_utils/*.mm"
        "${JUCE_MODULES_PATH}/juce_audio_utils/*.h"
        "${JUCE_MODULES_PATH}/juce_blocks_basics/*.cpp"
        "${JUCE_MODULES_PATH}/juce_blocks_basics/*.mm"
        "${JUCE_MODULES_PATH}/juce_blocks_basics/*.h"
        "${JUCE_MODULES_PATH}/juce_box2d/*.cpp"
        "${JUCE_MODULES_PATH}/juce_box2d/*.mm"
        "${JUCE_MODULES_PATH}/juce_box2d/*.h"
        "${JUCE_MODULES_PATH}/juce_core/*.cpp"
        "${JUCE_MODULES_PATH}/juce_core/*.mm"
        "${JUCE_MODULES_PATH}/juce_core/*.h"
        "${JUCE_MODULES_PATH}/juce_cryptography/*.cpp"
        "${JUCE_MODULES_PATH}/juce_cryptography/*.mm"
        "${JUCE_MODULES_PATH}/juce_cryptography/*.h"
        "${JUCE_MODULES_PATH}/juce_data_structures/*.cpp"
        "${JUCE_MODULES_PATH}/juce_data_structures/*.mm"
        "${JUCE_MODULES_PATH}/juce_data_structures/*.h"
        "${JUCE_MODULES_PATH}/juce_dsp/*.cpp"
        "${JUCE_MODULES_PATH}/juce_dsp/*.mm"
        "${JUCE_MODULES_PATH}/juce_dsp/*.h"
        "${JUCE_MODULES_PATH}/juce_events/*.cpp"
        "${JUCE_MODULES_PATH}/juce_events/*.mm"
        "${JUCE_MODULES_PATH}/juce_events/*.h"
        "${JUCE_MODULES_PATH}/juce_graphics/*.cpp"
        "${JUCE_MODULES_PATH}/juce_graphics/*.mm"
        "${JUCE_MODULES_PATH}/juce_graphics/*.h"
        "${JUCE_MODULES_PATH}/juce_gui_basics/*.cpp"
        "${JUCE_MODULES_PATH}/juce_gui_basics/*.mm"
        "${JUCE_MODULES_PATH}/juce_gui_basics/*.h"
        "${JUCE_MODULES_PATH}/juce_gui_extra/*.cpp"
        "${JUCE_MODULES_PATH}/juce_gui_extra/*.mm"
        "${JUCE_MODULES_PATH}/juce_gui_extra/*.h"
        "${JUCE_MODULES_PATH}/juce_opengl/*.cpp"
        "${JUCE_MODULES_PATH}/juce_opengl/*.mm"
        "${JUCE_MODULES_PATH}/juce_opengl/*.h"
        "${JUCE_MODULES_PATH}/juce_osc/*.cpp"
        "${JUCE_MODULES_PATH}/juce_osc/*.mm"
        "${JUCE_MODULES_PATH}/juce_osc/*.h"
        "${JUCE_MODULES_PATH}/juce_product_unlocking/*.cpp"
        "${JUCE_MODULES_PATH}/juce_product_unlocking/*.mm"
        "${JUCE_MODULES_PATH}/juce_product_unlocking/*.h"
        "${JUCE_MODULES_PATH}/juce_video/*.cpp"
        "${JUCE_MODULES_PATH}/juce_video/*.mm"
        "${JUCE_MODULES_PATH}/juce_video/*.h")

# Create library
add_library (SHARED_CODE STATIC
    ${${PROJECT_NAME}_SOURCE}
    ${JUCE_MODULES}
    "JuceLibraryCode/AppConfig.h"
    "JuceLibraryCode/JuceHeader.h"
)

# Set header only for src-headers
foreach(file ${${PROJECT_NAME}_HEADERS})
    set_source_files_properties("${file}" PROPERTIES HEADER_FILE_ONLY TRUE)
endforeach()

# Set header only for JUCE-modules
foreach(file ${JUCE_MODULES})
    set_source_files_properties("${file}" PROPERTIES HEADER_FILE_ONLY TRUE)
endforeach()


find_program (RC_COMPILER Rez NO_DEFAULT_PATHS PATHS "/Applications/Xcode.app/Contents/Developer/usr/bin")
if (NOT RC_COMPILER)
    message (WARNING "failed to find Rez; older resource-based AU plug-ins may not work correctly")
endif (NOT RC_COMPILER)

set_target_properties (SHARED_CODE PROPERTIES SUFFIX ".a")


if (RC_COMPILER)
    set (AU_REZ_SOURCES
            "${PROJECT_SOURCE_DIR}/JuceLibraryCode/RezHeaders.r"
            )
    set (AU_REZ_OUTPUT "${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}.rsrc")
    target_sources (AU PRIVATE
            ${AU_REZ_SOURCES}
            ${AU_REZ_OUTPUT}
            )
    execute_process (COMMAND
            ${RC_COMPILER}
            -d ppc_$ppc -d i386_$i386 -d ppc64_$ppc64 -d x86_64_$x86_64 -I /System/Library/Frameworks/CoreServices.framework/Frameworks/CarbonCore.framework/Versions/A/Headers -I "$(DEVELOPER_DIR)/Extras/CoreAudio/AudioUnits/AUPublic/AUBase"
            -isysroot "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk"
            -I "${JUCE_MODULES_PATH}/juce_audio_processors/format_types/VST3_SDK"
            -I "${PROJECT_SOURCE_DIR}/JuceLibraryCode"
            -I "/Applications/JUCE/modules"
            -I "${JUCE_MODULES_PATH}/juce_audio_plugin_client"
            ${AU_REZ_SOURCES}
            -o ${AU_REZ_OUTPUT}
            )
    set_source_files_properties (${AU_REZ_OUTPUT} PROPERTIES
            GENERATED TRUE
            MACOSX_PACKAGE_LOCATION Resources
            )
endif (RC_COMPILER)

#------------------------------------------------------------------------------
# Config
#------------------------------------------------------------------------------

execute_process (COMMAND uname -m OUTPUT_VARIABLE JUCE_ARCH_LABEL OUTPUT_STRIP_TRAILING_WHITESPACE)

if(BUILD_AU)
    MakeBuildAU()
endif()
if(BUILD_VST3)
    MakeBuildVST3()
endif()
if(BUILD_RTAS)
    MakeBuildRTAS()
endif()
if(BUILD_AAX)
    MakeBuildAAX()
endif()
if(BUILD_STANDALONE)
    MakeBuildStandalone()
endif()

MakeBuildSHARED_CODE()

set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-common -Wswitch -Wunused-variable -Wparentheses -Wnon-virtual-dtor -Wshorten-64-to-32 -Wundeclared-selector -Wuninitialized -Wunused-function -Wbool-conversion -Wcomma -Wconstant-conversion -Wempty-body -Wenum-conversion -Winfinite-recursion -Wint-conversion -Wrange-loop-analysis -Wstrict-prototypes -Wmove -Wunreachable-code -Wduplicate-method-match -Wreorder -fvisibility-inlines-hidden")
set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${CMAKE_CXX_FLAGS}")

endif()
