#!/bin/bash

CURRENTDIR=$(dirname "$0")
BUILDDIR=$CURRENTDIR/../build

mkdir -p $BUILDDIR

emcc $(find $CURRENTDIR/src -name "*.c" -type f) \
     -Wno-pointer-sign \
     -Oz \
     -s NO_EXIT_RUNTIME=1 \
     -s RESERVED_FUNCTION_POINTERS=20 \
     -s ASSERTIONS=1 \
     -s EXPORTED_FUNCTIONS="['_main', '_JSInterop_CallDotNet', '_Debugger_Continue', '_Debugger_SetBreakPoint', '_Debugger_Step', '_Debugger_Reset', '_Debugger_Clear_BreakPoints']" \
     -s EXTRA_EXPORTED_RUNTIME_METHODS="['ccall']" \
     -s DEFAULT_LIBRARY_FUNCS_TO_INCLUDE="['\$Browser']" \
     -s MODULARIZE=1 \
     -s EXPORT_NAME="'DotNetAnywhere'" \
     -s FORCE_FILESYSTEM=1 \
     --js-library $CURRENTDIR/js-interop.js \
     -o $BUILDDIR/dna.js