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

class Zebra : Prey
{

}

class Tiger : Predator
{

}

string meet(virtual!Animal, virtual!Animal);

@method
string _meet(Animal, Animal)
{
  return "ignore";
}
