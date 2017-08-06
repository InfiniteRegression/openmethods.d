module moreanimals;

import animals;

import openmethods;
mixin(registerMethods);

class Goat : Prey
{
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

extern (C) Animal make(string species)
{
  return cast(Animal) Object.factory(species);
}

static this()
{
  import std.stdio;
  writeln("*** moreanimals");
}

static ~this()
{
  import std.stdio;
  writeln("*** no moreanimals");
}
