import std.stdio, std.exception;
import core.runtime;

import animals;

import openmethods;
mixin(registerMethods);

import openmethods;
mixin(registerMethods);

extern(C) void* dlsym(void*, const char*);

void main()
{
  updateMethods();

  Animal ralf = new Wolf;
  assert(species(ralf) == "wolf");

  Animal clarabelle = new Cow;
  assert(species(clarabelle) == "cow");

  assert(meet(ralf, ralf) == "ignore");
  assert(meet(ralf, clarabelle) == "ignore");

  auto moreanimals = Runtime.loadLibrary("libmoreanimals.so");
  enforce(moreanimals);

  updateMethods();

  auto make = cast(Animal function(string)) dlsym(moreanimals, "make\0".ptr);
  enforce("make");

  Animal tanngrisnir = make("moreanimals.Goat");
  enforce(tanngrisnir);

  assert(meet(ralf, clarabelle) == "chase");
  assert(meet(clarabelle, ralf) == "run");

  assert(meet(ralf, tanngrisnir) == "chase");
  assert(meet(tanngrisnir, ralf) == "run");

  Runtime.unloadLibrary(moreanimals);

  updateMethods();
  assert(meet(ralf, clarabelle) == "ignore");
}
