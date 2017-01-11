cmake_minimum_required(VERSION 2.6)

## link python files to bin
FILE(GLOB_RECURSE INCLUDE_FILES ABSOLUTE ${CMAKE_CURRENT_SOURCE_DIR} FOLLOW_SYMLINKS *.py)
foreach(I ${INCLUDE_FILES})
  MESSAGE( STATUS "python file: " ${I} )
  GET_FILENAME_COMPONENT(F ${I} NAME)
  ADD_CUSTOM_TARGET(${F} ALL COMMAND ${CMAKE_COMMAND} -E create_symlink ${I} ${project_BIN_DIR}/${F})
endforeach()

