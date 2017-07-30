import std.stdio, std.exception;
import core.runtime;

import dog;

extern(C) void* dlsym(void*, const char*);

void main()
{
  auto so = Runtime.loadLibrary("/home/jll/d/dev/openmethods.d/examples/dynalib/libopenmethods_dynalib.so");
  enforce(so);

  auto makePitbull = cast(Dog function()) dlsym(so, "makePitbull\0".ptr);
  enforce(makePitbull);

  auto rex = makePitbull();
  rex.bark();
}
