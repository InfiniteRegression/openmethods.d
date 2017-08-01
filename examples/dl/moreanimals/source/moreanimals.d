import animals;

import openmethods;
mixin(registerMethods);

class Cow : Prey
{

}

@method
string _species(Cow)
{
  return "cow";
}

extern (C) Animal make(string species)
{
  return new Cow;
}
