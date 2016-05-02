CC      = g++
CFLAGS  = -Wall -DMS_WIN64 -O3 -march=native
OBJ     = prefix.o prefix_wrap.o
PYPATH  = C:/python27/include
PYLIB   = C:/python27/libs/
NUMPY   = C:/Python27/Lib/site-packages/numpy/core/include/

all: _libprefix.pyd

prefix_wrap.cxx: prefix.i prefix.cpp prefix.h
	swig -python -c++ prefix.i

prefix.o: prefix.cpp prefix.h
	$(CC) $(CFLAGS) -c prefix.cpp

prefix_wrap.o: prefix_wrap.cxx
	$(CC) $(CFLAGS) -c prefix_wrap.cxx -I $(PYPATH) -I $(NUMPY) 

_libprefix.pyd: prefix.o prefix_wrap.o
	$(CC) -mdll $(CFLAGS) $(OBJ) -L $(PYLIB) -l python27 -o _libprefix.pyd
	rm -f prefix_wrap.cxx
	rm -f $(OBJ)

clean:
	rm -f prefix_wrap.cxx
	rm -f libprefix.py
	rm -f libprefix.pyc
	rm -f _libprefix.pyd

