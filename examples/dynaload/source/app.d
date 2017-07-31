import std.stdio, std.exception;
import core.runtime;

import openmethods;
mixin(registerMethods);

import dog;

extern(C) void* dlsym(void*, const char*);

void main()
{
  updateMethods();

  Dog snoopy = new Dog;

  writeln(kick(snoopy));

  auto so = Runtime.loadLibrary("/home/jll/dev/d/openmethods.d/examples/dynalib/libopenmethods_dynalib.so");
  enforce(so);

  updateMethods();

  auto makePitbull = cast(Dog function()) dlsym(so, "makePitbull\0".ptr);
  enforce(makePitbull);

  auto rex = makePitbull();
  rex.bark();

  writeln(kick(rex));
}
