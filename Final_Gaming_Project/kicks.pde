class Kick
{
  PVector l, sH, sV;
  float tX, tY;

  Kick(float translationX, float translationY)
  { 
    tX = translationX;
    tY = translationY;
    l = new PVector(0, 0);
    sH = new PVector(4, 4.5);
    sV = new PVector(-3, 4);
  }

  void drawDown()
  {
    tY += sV.y;

    pushMatrix();
    translate(tX, tY);
    rotate(-PI/4.7);
    image(kick, l.x, l.y);
    image(kick, l.x+900, l.y+700);
    popMatrix();

    if (godphase.health <= 0)
    {
      godphase.health -= 0;
    } else if (dist(tX+20, tY-10, one.l.x, one.l.y) <= 25 || dist(tX+1152, tY, two.l.x, two.l.y) <= 25)
    {
      if (kickDamage.position() >= 150)
      {
        kickDamage.rewind();
      } else
      {
        kickDamage.play();
      }
      godphase.health -= 2;
    }
  }

  void drawLeft()
  {
    tX += sH.x;

    pushMatrix();
    translate(tX, tY);
    rotate(-4.4*PI/6);
    image(kick, l.x, l.y);
    image(kick, l.x-700, l.y+800);
    popMatrix();

    if (godphase.health <= 0)
    {
      godphase.health -= 0;
    } else if (dist(tX-10, tY-40, one.l.x, one.l.y) <= 25 || dist(tX+(width*0.65-width*0.05)-100, tY-40, two.l.x, two.l.y) <= 25)
    {
      if (kickDamage.position() >= 150)
      {
        kickDamage.rewind();
      } else
      {
        kickDamage.play();
      }
      godphase.health -= 2;
    }
  }
}
