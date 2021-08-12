class Mechanics
{
  PVector l, s;
  boolean left, right, up, down;
  PImage heart;

  Mechanics()
  {
    l = new PVector(100, 100);
    s = new PVector(3, 3);
    heart = loadImage("heart.png");
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
    background(128);
    heart.resize(20, 20);
    image(heart, l.x, l.y); 
    l.x = l.x + s.x*(int(right) - int(left));
    l.y = l.y + s.y*(int(down) - int(up));
  }

  void blueMagic()
  {
    background(128);
    heart.resize(20, 20);
    image(heart, l.x, l.y);
    l.x = l.x + s.x*(int(right) - int(left));
    l.y = l.y + s.y*(int(down) - int(up));
  }
}
