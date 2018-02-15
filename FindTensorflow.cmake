# Locates the Tensorflow library and include directories.

include(FindPackageHandleStandardArgs)
unset(TENSORFLOW_FOUND)

find_path(Tensorflow_INCLUDE_DIR
        NAMES
        tensorflow/core
        tensorflow/cc
        third_party
        HINTS
        /usr/local/include/google/tensorflow
        /usr/include/google/tensorflow)

find_library(Tensorflow_LIBRARY
		NAMES
		tensorflow_cc
		tensorflow_framework
        HINTS
        /usr/lib
        /usr/local/lib)

# set TensorFlow_FOUND
find_package_handle_standard_args(Tensorflow DEFAULT_MSG Tensorflow_INCLUDE_DIR Tensorflow_LIBRARY)

# set external variables for usage in CMakeLists.txt
if(TENSORFLOW_FOUND)
    set(Tensorflow_LIBRARIES ${Tensorflow_LIBRARY})
    set(Tensorflow_INCLUDE_DIRS ${Tensorflow_INCLUDE_DIR})
endif()

# hide locals from GUI
mark_as_advanced(Tensorflow_INCLUDE_DIR Tensorflow_LIBRARY)
