class Kame
{
  PVector l;
  float tX, tY;
  int frameSpeed, i, i2, i3, i4;

  Kame(float translationX, float translationY)
  {
    tX = translationX;
    tY = translationY;
    l = new PVector(0, 0);
    i = i2 = i3 = i4;
  }

  void drawLeft()
  {
    if (i < 12)
    {
      if (i == 0 || i == 1)
      {
        frameSpeed = frameCount/20;
      } else
      {
        frameSpeed = frameCount;

        if (godphase.health <= 0)
        {
          godphase.health -= 0;
        } else if (dist(tY+40, tY+40, one.l.y, one.l.y) < 50 || dist(tY+40, tY+40, two.l.y, two.l.y) <= 50)
        {
          if (kameDamage.position() >= 80)
          {
            kameDamage.rewind();
          } else
          {
            kameDamage.play();
          }
          godphase.health -= 3;
        }
      }

      if (frameSpeed == i && i < 12)
      {
        image(kameF[i], tX, tY); 
        image(kameF[i], tX+(width*0.65-width*0.05), tY); 

        i++;
        frameCount = 0;
      } 
      if (i < 12)
      {
        image(kameF[i], tX, tY);
        image(kameF[i], tX+(width*0.65-width*0.05), tY);
      }
    } else
    {
      godphase.one = false;
      godphase.ka.tY = height*0.54;
      i = 0;
      godphase.two = true;
    }
  }

  void drawTopLeft()
  {
    if (i < 12)
    {
      if (i == 0 || i == 1)
      {
        frameSpeed = frameCount/20;
      } else
      {
        frameSpeed = frameCount;

        if (godphase.health <= 0)
        {
          godphase.health -= 0;
        } else if (dist(width*0.05, width*0.05, one.l.x, one.l.x) < 230 || dist(width*0.65, width*0.65, two.l.x, two.l.x) < 230)
        {
          if (kameDamage.position() >= 80)
          {
            kameDamage.rewind();
          } else
          {
            kameDamage.play();
          }
          godphase.health -= 3;
        }
      }

      if (frameSpeed == i && i < 12)
      {
        pushMatrix();
        translate(tX+140, tY);
        rotate(PI/2);
        image(kameF[i], l.x, l.y); 
        popMatrix();

        pushMatrix();
        translate(tX+90, tY);
        rotate(PI/2);
        image(kameF[i], l.x, l.y); 
        popMatrix();

        pushMatrix();
        translate(tX+190, tY);
        rotate(PI/2);
        image(kameF[i], l.x, l.y); 
        popMatrix();


        pushMatrix();
        translate(tX+140, tY);
        rotate(PI/2);
        image(kameF[i], l.x, l.y-(width*0.65-width*0.05)); 
        popMatrix();

        pushMatrix();
        translate(tX+90, tY);
        rotate(PI/2);
        image(kameF[i], l.x, l.y-(width*0.65-width*0.05)); 
        popMatrix();

        pushMatrix();
        translate(tX+190, tY);
        rotate(PI/2);
        image(kameF[i], l.x, l.y-+(width*0.65-width*0.05)); 
        popMatrix();
        i++;
        frameCount = 0;
      } 
      if (i < 12)
      {
        pushMatrix();
        translate(tX+140, tY);
        rotate(PI/2);
        image(kameF[i], l.x, l.y); 
        popMatrix();

        pushMatrix();
        translate(tX+90, tY);
        rotate(PI/2);
        image(kameF[i], l.x, l.y); 
        popMatrix();

        pushMatrix();
        translate(tX+190, tY);
        rotate(PI/2);
        image(kameF[i], l.x, l.y); 
        popMatrix();


        pushMatrix();
        translate(tX+140, tY);
        rotate(PI/2);
        image(kameF[i], l.x, l.y-(width*0.65-width*0.05)); 
        popMatrix();

        pushMatrix();
        translate(tX+90, tY);
        rotate(PI/2);
        image(kameF[i], l.x, l.y-(width*0.65-width*0.05)); 
        popMatrix();

        pushMatrix();
        translate(tX+190, tY);
        rotate(PI/2);
        image(kameF[i], l.x, l.y-(width*0.65-width*0.05)); 
        popMatrix();
      }
    } else
    {
      godphase.two = false;
      //godphase.ka.tX = width*0.6;
      i = 0;
      godphase.three = true;
    }
  }

  void drawBottomRight()
  {
    if (i < 12)
    {
      if (i == 0 || i == 1)
      {
        frameSpeed = frameCount/20;
      } else
      {
        frameSpeed = frameCount;

        if (godphase.health <= 0)
        {
          godphase.health -= 0;
        } else if (dist(width*0.05+600, width*0.05+600, one.l.x, one.l.x) < 300 || dist(width*0.65+600, width*0.65+600, two.l.x, two.l.x) < 300)
        {
          if (kameDamage.position() >= 80)
          {
            kameDamage.rewind();
          } else
          {
            kameDamage.play();
          }
          godphase.health -= 3;
        }
      }

      if (frameSpeed == i && i < 12)
      {
        pushMatrix();
        translate(tX+600, tY);
        rotate(PI/3);
        image(kameF[i], l.x, l.y); 
        popMatrix();

        i++;
        frameCount = 0;
      } 
      if (i < 12)
      {
        pushMatrix();
        translate(tX+500, tY+450);
        rotate(3*PI/2);
        image(kameF[i], l.x, l.y); 
        popMatrix();

        pushMatrix();
        translate(tX+450, tY+450);
        rotate(3*PI/2);
        image(kameF[i], l.x, l.y); 
        popMatrix();

        pushMatrix();
        translate(tX+400, tY+450);
        rotate(3*PI/2);
        image(kameF[i], l.x, l.y); 
        popMatrix();


        pushMatrix();
        translate(tX+500, tY+450);
        rotate(3*PI/2);
        image(kameF[i], l.x, l.y+(width*0.65-width*0.05)); 
        popMatrix();

        pushMatrix();
        translate(tX+450, tY+450);
        rotate(3*PI/2);
        image(kameF[i], l.x, l.y+(width*0.65-width*0.05)); 
        popMatrix();

        pushMatrix();
        translate(tX+400, tY+450);
        rotate(3*PI/2);
        image(kameF[i], l.x, l.y+(width*0.65-width*0.05)); 
        popMatrix();
      }
    } else
    {
      godphase.two = false;
      //godphase.ka.tX = width*0.6;
      i = 0;
      godphase.three = true;
    }
  }

  void middleBlast()
  {

    if (i4 < 12)
    {
      if (i == 0 || i == 1)
      {
        frameSpeed = frameCount/20;
      } else
      {
        frameSpeed = frameCount;

        if (godphase.health <= 0)
        {
          godphase.health -= 0;
        } else if (dist(tX+350-22, tX+350-22, one.l.x, one.l.x) <= 220 || dist(tX+(width*0.65-width*0.05)+350-22, tX+(width*0.65-width*0.05)+350-22, two.l.x, two.l.x) <= 220)
        {
          if (kameDamage.position() >= 80)
          {
            kameDamage.rewind();
          } else
          {
            kameDamage.play();
          }
          godphase.health -= 3;
        }
      }

      if (frameSpeed == i && i < 12)
      {
        pushMatrix();
        translate(tX+350, tY);
        rotate(PI/2);
        image(kameF[i], l.x, l.y); 
        popMatrix();

        pushMatrix();
        translate(tX+350, tY);
        rotate(PI/2);
        image(kameF[i], l.x, l.y-(width*0.65-width*0.05)); 
        popMatrix();

        i++;
        i2 = i-2;
        i3 = i-4;
        i4 = i-6;

        frameCount = 0;
      } 

      if (i >= 12)
      {
        if (frameSpeed == i)
        {
          i2++;
          i3++;
          i4++;
          frameCount = 0;
        }
      }

      if (i < 12)
      {
        pushMatrix();
        translate(tX+350, tY);
        rotate(PI/2);
        image(kameF[i], l.x, l.y); 
        popMatrix();

        pushMatrix();
        translate(tX+350, tY);
        rotate(PI/2);
        image(kameF[i], l.x, l.y-(width*0.65-width*0.05)); 
        popMatrix();
      }

      if (i > 2 && i2 < 12)
      {     

        pushMatrix();
        translate(tX+300, tY);
        rotate(PI/2);
        image(kameF[i2], l.x, l.y); 
        popMatrix();

        pushMatrix();
        translate(tX+400, tY);
        rotate(PI/2);
        image(kameF[i2], l.x, l.y); 
        popMatrix();


        pushMatrix();
        translate(tX+300, tY);
        rotate(PI/2);
        image(kameF[i2], l.x, l.y-(width*0.65-width*0.05)); 
        popMatrix();

        pushMatrix();
        translate(tX+400, tY);
        rotate(PI/2);
        image(kameF[i2], l.x, l.y-(width*0.65-width*0.05)); 
        popMatrix();
      }

      if (i > 4 && i3 < 12)
      {
        pushMatrix();
        translate(tX+250, tY);
        rotate(PI/2);
        image(kameF[i3], l.x, l.y); 
        popMatrix();

        pushMatrix();
        translate(tX+450, tY);
        rotate(PI/2);
        image(kameF[i3], l.x, l.y); 
        popMatrix();


        pushMatrix();
        translate(tX+250, tY);
        rotate(PI/2);
        image(kameF[i3], l.x, l.y-(width*0.65-width*0.05)); 
        popMatrix();

        pushMatrix();
        translate(tX+450, tY);
        rotate(PI/2);
        image(kameF[i3], l.x, l.y-(width*0.65-width*0.05)); 
        popMatrix();
      }

      if (i > 6 && i4 < 12)
      {
        pushMatrix();
        translate(tX+200, tY);
        rotate(PI/2);
        image(kameF[i4], l.x, l.y); 
        popMatrix();

        pushMatrix();
        translate(tX+500, tY);
        rotate(PI/2);
        image(kameF[i4], l.x, l.y); 
        popMatrix();


        pushMatrix();
        translate(tX+200, tY);
        rotate(PI/2);
        image(kameF[i4], l.x, l.y-(width*0.65-width*0.05)); 
        popMatrix();

        pushMatrix();
        translate(tX+500, tY);
        rotate(PI/2);
        image(kameF[i4], l.x, l.y-(width*0.65-width*0.05)); 
        popMatrix();
      }
    } else
    {
      frameCount = 0;
    }

    if (i4 >= 12)
    {
      godphase.three = false;
      noStroke();
      fill(255);
      rect(width*0.56, height*0.05, 600, 100);
      godphase.phasePassed = true;
    }
  }
}
