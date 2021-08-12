class player1
{
  PVector l, s;
  boolean left, right, up, down;
  PImage heart, heartG;

  player1(float lx, float ly, float sx, float sy)
  {
    l = new PVector(lx, ly);
    s = new PVector(sx, sy);
    heart = loadImage("heart.png");
    heartG = loadImage("heart_guard.png");
  }

  boolean moving(final int i, final boolean b)
  {
    switch (i)
    {
    case 'a':
      return left = b;
    case 'A':
      return left = b;

    case 'd':
      return right = b;
    case 'D':
      return right = b;

    case 'w':
      return up = b;
    case 'W':
      return up = b;

    case 's':
      return down = b;
    case 'S':
      return down = b;

    default:
      return b;
    }
  }

  void movement()
  {
    heart.resize(20, 20);
    heartG.resize(20, 20);
    if (bluephase.guardmode && state == 2.3)
    {
      image(heartG, l.x, l.y);
    } else
    {
      image(heart, l.x, l.y);
      l.x = constrain(l.x + s.x*(int(right) - int(left)), width*0.0575, width*0.345);
      l.y = constrain(l.y + s.y*(int(down) - int(up)), height*0.61225, height*0.895);
    }
  }
}
