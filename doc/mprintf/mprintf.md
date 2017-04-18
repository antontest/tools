# mprintf

## NAME

> `mprintf, mfprintf, vmprintf, vmfprintf`

## SYNOPSIS

#include <print/print.h>
mprintf(const char *format, ...);
vmprintf(const char *format, va_list ag);
mfprintf(FILE *stream, const char *format, ...);
vmfprintf(FILE *stream, const char *format, va_list ag);
