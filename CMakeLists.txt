### written by N. Rypkema rypkema@mit.edu

project(erin C CXX Fortran)

## set project policies
cmake_minimum_required(VERSION 2.6)

## enable all warnings when building Debug
set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -Wall")
set(CMAKE_C_FLAGS_DEBUG "${CMAKE_C_FLAGS_DEBUG} -Wall")

## versions
set(PROJECT_VERSION "0.0.0")
set(PROJECT_SOVERSION "0")

## omap optimizations
option(enable_omap_arm_neon_coprocessor "Enable the NEON FP coprocessor for certain ARM processors" OFF)

if(enable_omap_arm_neon_coprocessor)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -mcpu=cortex-a8 -mfloat-abi=softfp -mfpu=neon -ffast-math -fno-math-errno")
endif()

## fetch all the local directories for generated code
get_filename_component(project_LIB_DIR lib ABSOLUTE)
get_filename_component(project_BIN_DIR bin ABSOLUTE)
get_filename_component(project_INC_DIR include ABSOLUTE)
get_filename_component(project_SRC_DIR src ABSOLUTE)
get_filename_component(project_BUILD_DIR build ABSOLUTE)

## set the cmake defaults for libraries and binaries
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${project_LIB_DIR} CACHE PATH 
  "Output directory for the libraries" )
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${project_BIN_DIR} CACHE PATH
  "Output directory for the binaries" )

## set instructions for `make install`
install(DIRECTORY ${project_BIN_DIR}/ DESTINATION ${CMAKE_INSTALL_PREFIX}/bin 
  FILE_PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE GROUP_READ GROUP_EXECUTE WORLD_READ WORLD_EXECUTE )
install(DIRECTORY ${project_LIB_DIR}/ DESTINATION ${CMAKE_INSTALL_PREFIX}/lib)
install(DIRECTORY ${project_INC_DIR}/ DESTINATION ${CMAKE_INSTALL_PREFIX}/include)

## now add subdirectories
add_subdirectory(src)
