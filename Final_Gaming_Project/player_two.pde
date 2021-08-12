class player2
{
  PVector l, s;
  boolean left, right, up, down;
  PImage heart, heartG;

  player2(float lx, float ly, float sx, float sy)
  {
    l = new PVector(lx, ly);
    s = new PVector(sx, sy);
    heart = loadImage("heart2.png");
    heartG = loadImage("heart2_guard.png");
  }

  boolean moving(final int i, final boolean b)
  {
    switch (i)
    {
    case LEFT:
      return left = b;

    case RIGHT:
      return right = b;

    case UP:
      return up = b;

    case DOWN:
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
      l.x = constrain(l.x + s.x*(int(right) - int(left)), width*0.6575, width*0.945);
      l.y = constrain(l.y + s.y*(int(down) - int(up)), height*0.61225, height*0.895);
    }
  }
}
