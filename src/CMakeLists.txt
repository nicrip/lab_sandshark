cmake_minimum_required(VERSION 2.6)

## add all subdirectories
MACRO(SUBDIRLIST result curdir)
  FILE(GLOB children RELATIVE ${curdir} ${curdir}/*)
  SET(dirlist "")
  FOREACH(child ${children})
    IF(IS_DIRECTORY ${curdir}/${child})
      LIST(APPEND dirlist ${child})
    ENDIF()
  ENDFOREACH()
  SET(${result} ${dirlist})
ENDMACRO()

SUBDIRLIST(SUBDIRS ${CMAKE_CURRENT_SOURCE_DIR})

FOREACH(SUBDIR ${SUBDIRS})
  MESSAGE( STATUS "adding subdirectory: " ${SUBDIR})
  ADD_SUBDIRECTORY(${SUBDIR})
ENDFOREACH()


