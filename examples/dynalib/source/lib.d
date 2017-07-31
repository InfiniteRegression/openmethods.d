import std.stdio;

import openmethods;
mixin(registerMethods);

import dog;

class Pitbull : Dog
{
  override void bark()
  {
    writeln("waf! WAF! GRRR...");
  }
}

@method
string _kick(Pitbull x)
{
  return next!kick(x) ~ " and bite";
}

class Dog
{
  void bark()
  {
    import std.stdio;
    writeln("bow wow wow");
  }
}

extern (C) Dog makePitbull()
{
  return new Pitbull;
}
