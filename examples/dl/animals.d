import openmethods;
mixin(registerMethods);

interface Animal
{
}

interface Predator : Animal
{
}

interface Prey : Animal
{
}

class Wolf : Predator
{
}

string species(virtual!Animal);

@method
string _species(Wolf)
{
  return "wolf";
}
