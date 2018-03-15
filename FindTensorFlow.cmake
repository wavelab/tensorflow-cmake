# Locates the Tensorflow library and include directories.

include(FindPackageHandleStandardArgs)
unset(TENSORFLOW_FOUND)

if (NOT TensorFlow_INSTALL_ROOT)
	set(TensorFlow_INSTALL_ROOT /usr/local)
endif()

find_path(TensorFlow_INCLUDE_DIR
        NAMES
        tensorflow/core
        tensorflow/cc
        third_party
        HINTS
	    ${TensorFlow_INSTALL_ROOT}/include/google/tensorflow)

find_library(TensorFlow_CC tensorflow_cc
        HINTS
	    ${TensorFlow_INSTALL_ROOT}/lib)

find_library(TensorFlow_framework tensorflow_framework
		HINTS
		${TensorFlow_INSTALL_ROOT}/lib)

# set TensorFlow_FOUND
find_package_handle_standard_args(TensorFlow DEFAULT_MSG TensorFlow_INCLUDE_DIR TensorFlow_CC TensorFlow_framework)

# set external variables for usage in CMakeLists.txt
if(TENSORFLOW_FOUND)
    set(TensorFlow_LIBRARIES ${TensorFlow_CC} ${TensorFlow_framework})
    set(TensorFlow_INCLUDE_DIRS ${TensorFlow_INCLUDE_DIR})
endif()

# hide locals from GUI
mark_as_advanced(TensorFlow_INCLUDE_DIR TensorFlow_CC TensorFlow_framework)
