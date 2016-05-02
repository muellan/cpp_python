# setup.py
import distutils
from distutils.core import setup, Extension

setup(name = "libprefix",
      version = "2.2",
      options={'build_ext':{'swig_opts':'-c++'}},
      ext_modules = [
      	Extension("_libprefix",
      		["prefix.i","prefix.cpp"],
      		include_dirs=['C:/Python27/Lib/site-packages/numpy/core/include/'])])
