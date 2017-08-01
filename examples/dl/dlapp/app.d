import std.stdio, std.exception;
import core.runtime;

import animals;

import openmethods;
mixin(registerMethods);

import openmethods;
mixin(registerMethods);

string meet(virtual!Animal, virtual!Animal);

@method
string _meet(Animal, Animal)
{
  return "ignore";
}

@method
string _meet(Predator, Prey)
{
  return "chase";
}

@method
string _meet(Prey, Predator)
{
  return "run";
}

extern(C) void* dlsym(void*, const char*);

void main()
{
  updateMethods();

  Animal ralf = new Wolf;
  writeln("ralf is a ", species(ralf));

  auto so = Runtime.loadLibrary("/home/jll/dev/d/openmethods.d/examples/dl/moreanimals/libopenmethods_moreanimals.so");
  enforce(so);

  // auto make = cast(Animal function(string)) dlsym(so, "make\0".ptr);
  // enforce("make");

  // Animal clarabelle = make("Cow");
  // enforce(clarabelle);
  // writeln("clarabelle is a ", species(clarabelle));

  // assert(meet(ralf, ralf) == "ignore");
  // assert(meet(ralf, clarabelle) == "chase");
  // assert(meet(clarabelle, ralf) == "run");
}
