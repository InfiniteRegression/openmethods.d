import std.stdio;

import animals;

import openmethods;
mixin(registerMethods);

@method
string _meet(Predator, Prey)
{
  return "chase";
}

void main()
{
  updateMethods();
  auto tiger = new Tiger;
  auto zebra = new Zebra;
  assert(meet(tiger, tiger) == "ignore");
  assert(meet(tiger, zebra) == "chase");
}
