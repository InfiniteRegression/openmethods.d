import std.stdio;
import core.runtime;

extern(C) void* dlsym(void*, const char*);

void main()
{
  writeln("hello from app.d");
  auto dll = Runtime.loadLibrary("/home/jll/d/dev/openmethods.d/examples/dynalib/libopenmethods_dynalib.so");
  writefln("rc = %s", dll);

  void* makePitbull = dlsym(dll, "makePitbull\0".ptr);

  if (makePitbull is null) {
    writeln("symbol not found");
    return;
  }

  (cast(int function()) makePitbull)();
}
