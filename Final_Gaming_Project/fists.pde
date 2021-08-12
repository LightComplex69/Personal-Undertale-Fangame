class Fist
{
  int frames;
  float rotate;
  PVector l, s;


  Fist(float x, float y)
  {
    frames = frameCount/4;
    s = new PVector(0, -5);
    l = new PVector(x, y);
  }

  void drawUp()
  {
    l.add(s);

    image(fist, l.x, l.y);
    image(fist, l.x + 1152, l.y);

    if (godphase.health <= 0)
    {
      godphase.health -= 0;
    } else if (dist(l.x+15, l.y+20, one.l.x, one.l.y) <= 25 || dist(l.x+15+1152, l.y+20, two.l.x, two.l.y) <= 25)
    {
      if (punchDamage.position() >= 150)
      {
        punchDamage.rewind();
      } else
      {
        punchDamage.play();
      }
      godphase.health -= 2;
    }
  }

  //  void healthCheck()
  //  {
  //    if (godphase.health <= 0)
  //    {
  //      godphase.health -= 0;
  //    } else if (dist(l.x+15, l.y+20, one.l.x, one.l.y) <= 25 || dist(l.x+15, l.y+20, two.l.x, two.l.y) <= 25)
  //    {
  //      godphase.health -= 2;
  //    }
  //  }
}
