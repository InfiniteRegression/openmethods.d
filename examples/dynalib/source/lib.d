import std.stdio;
import dog;

class Pitbull : Dog
{
  override void bark()
  {
    writeln("waf! WAF! GRRR...");
  }
}

extern (C) Dog makePitbull()
{
  return new Pitbull;
}
