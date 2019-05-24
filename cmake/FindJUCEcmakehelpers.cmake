# This file would run first thing in the cmake toolchain
set(JUCECMAKEHELPERS_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR})
# Add cmake modules / files to include:
include(${CMAKE_CURRENT_LIST_DIR}/NumberToHex.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/ConfigureJUCEAppHeaders.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/ConfigureJUCEplists.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/SetAppVersion.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/AddAudioPluginModules.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/MakeBuild.cmake)
