import openmethods;
mixin(registerMethods);

string kick(virtual!Dog);

@method
string _kick(Dog x)
{
  return "bark";
}

class Dog
{
  void bark()
  {
    import std.stdio;
    writeln("bow wow wow");
  }
}
