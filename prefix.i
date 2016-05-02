%module libprefix
%{
	#define SWIG_FILE_WITH_INIT
	#include "prefix.h"
%}

%include "typemaps.i"
%include "numpy.i"
%include "std_vector.i"
%include "std_pair.i"
%include "windows.i"


%init %{
    import_array();
%}

%apply (double* INPLACE_ARRAY1, int DIM1) {(double* inout, int len)}
%include "prefix.h"
