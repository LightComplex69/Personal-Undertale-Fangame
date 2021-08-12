class phase1
{
  boolean one, two, three, phasePassed, next, transformation;
  String alert, d;
  int frameSpeed, tran, tranS, i, ci, x, fade;
  float health, cX, cY;
  ArrayList<PVector> fistL, kickL, kaL;
  ArrayList<Fist> fUp;
  Fist f, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12, f13;
  Kick k, k2, k3, k4, k5, k6, k7, k8, k9;
  Kame ka;

  phase1()
  {
    cX = width*0.62-textWidth('A');
    cY = height*0.05+50;
    fade = 0;
    one = true;
    two = three = phasePassed = transformation = false;
    alert = "!!!";
    d = "Wow. . .";
    tran = 100;
    tranS = 2;
    i = 0;
    x = 0;
    ci = 0;
    health = 400;

    fistL = new ArrayList<PVector>();
    fistL.add(new PVector(width*0.06, height*0.95));

    f = new Fist(fistL.get(0).x, fistL.get(0).y);
    f2 = new Fist(fistL.get(0).x+40, fistL.get(0).y+25);
    f3 = new Fist(fistL.get(0).x+80, fistL.get(0).y+50);
    f4 = new Fist(fistL.get(0).x+120, fistL.get(0).y+75);
    f5 = new Fist(fistL.get(0).x+160, fistL.get(0).y+100);
    f6 = new Fist(fistL.get(0).x+200, fistL.get(0).y+125);
    f7 = new Fist(fistL.get(0).x+240, fistL.get(0).y+150);
    f8 = new Fist(fistL.get(0).x+280, fistL.get(0).y+175);
    f9 = new Fist(fistL.get(0).x+320, fistL.get(0).y+200);
    f10 = new Fist(fistL.get(0).x+360, fistL.get(0).y+225);
    f11 = new Fist(fistL.get(0).x+400, fistL.get(0).y+250);
    f12 = new Fist(fistL.get(0).x+440, fistL.get(0).y+275);
    f13 = new Fist(fistL.get(0).x+480, fistL.get(0).y+300);


    kickL = new ArrayList<PVector>();
    kickL.add(new PVector(width*0.08, height*0.5));

    k = new Kick(kickL.get(0).x, kickL.get(0).y);
    k2 = new Kick(kickL.get(0).x+30, kickL.get(0).y);
    k3 = new Kick(kickL.get(0).x+180, kickL.get(0).y);
    k4 = new Kick(kickL.get(0).x+210, kickL.get(0).y);
    k5 = new Kick(kickL.get(0).x+420, kickL.get(0).y);
    k6 = new Kick(kickL.get(0).x+450, kickL.get(0).y);

    k7 = new Kick(kickL.get(0).x, kickL.get(0).y+220);   
    k8 = new Kick(kickL.get(0).x, kickL.get(0).y+310);   
    k9 = new Kick(kickL.get(0).x, kickL.get(0).y+400);


    kaL = new ArrayList<PVector>();
    kaL.add(new PVector(width*0.05, height*0.7));

    ka = new Kame(kaL.get(0).x, kaL.get(0).y);
  }

  void goku()
  {
    p.godku.resize(300, 581);
    image(p.godku, width*0.425, 20);
  }

  void firstAttack()
  {
    if (f13.l.y > 0)
    {
      f.drawUp();    
      f2.drawUp();  
      f3.drawUp();
      f4.drawUp();
      f5.drawUp();
      f6.drawUp();
      f7.drawUp();
      f8.drawUp();
      f9.drawUp();
      f10.drawUp();
      f11.drawUp();
      f12.drawUp();
      f13.drawUp();
    }
    // ------------------------------------------------------

    if (f13.l.y < width*0.2)
    {
      if (x > 100)
      {
        if (ci < alert.length())
        {
          textSize(80);
          fill(255, 0, 0);
          char c = alert.charAt(ci); 
          text(c, kickL.get(0).x, kickL.get(0).y);
          text(c, kickL.get(0).x+20, kickL.get(0).y);
          ci += 1;
          x = 0;
        }
      }     
      x += 15;


      if (x > 200 && k7.tX < width*0.4)
      {   
        k.drawDown();
        k2.drawDown();
        k7.drawLeft();
      }
      if (k.tY > height*0.7 && k8.tX < width*0.4)
      {
        k3.drawDown();
        k4.drawDown();
        k8.drawLeft();
      }
      if (k3.tY > height*0.7 && k9.tX < width*0.4)
      {
        k5.drawDown();
        k6.drawDown();
        k9.drawLeft();
        frameCount = 0;
      }
    }
  }

  void kamehameha()
  {
    if (one && k9.tX > width*0.4)
    {
      ka.drawLeft();
    }

    if (two)
    {
      ka.drawTopLeft();
      ka.drawBottomRight();
    }

    if (three)
    {
      ka.middleBlast();
    }
  }

  void phaseDone()
  {
    fill(0);
    textSize(30);

    if (phasePassed)
    {
      if (d == "You're stronger than I thought. . ." || d == "Guess I'll have to go all out")
      {
        frameSpeed = frameCount/3;
      } else
      {
        frameSpeed = frameCount/6;
      }

      if (i == d.length())
      {
        next = true;
      } 
      if (frameSpeed == i)
      {
        if (!next)
        {
          char c = d.charAt(i);
          text(c, cX, cY);
          cX = cX + textWidth(c);
        }

        if (i < d.length())
        {
          i += 1;
        }
      }
      if (i >= d.length() && d == "Guess I'll have to go all out")
      {
        frameCount = 0;
        i = 0;
        phasePassed = false;
        transformation = true;
      }
    }
  }

  void yes()
  {
    if (next && key == ' ' && d == "Wow. . .")
    {
      frameCount = 0;
      noStroke();
      fill(255);
      rect(width*0.56, height*0.05, 600, 100);
      cX = width*0.62-textWidth('A');
      cY = height*0.05+50;
      i = 0;
      d = "You're stronger than I thought. . .";
      next = false;
    }
    if (next && key == ' ' && d == "You're stronger than I thought. . .")
    {
      frameCount = 0;
      noStroke();
      fill(255);
      rect(width*0.56, height*0.05, 600, 100);
      cX = width*0.62-textWidth('A');
      cY = height*0.05+50;
      x = 0;
      i = 0;
      d = "Guess I'll have to go all out";
      next = false;
    }
  }

  void transform()
  {
    if (transformation)
    {
      stroke(0);
      fill(50, fade);
      rect(0, 0, width, height);

      fill(0, fade);
      rect(0, height/2-150, width, 300);
      if (fade > 150)
      {
        fade += 0; 
      } else if(fade == 150)
      {
        frameCount = 0; 
        fade += 2;
      } else
      {
        fade += 2;
      }
      
      if (fade > 150)
      {
        if (i < 6)
        {
          frameSpeed = frameCount/3;
        } else
        {
          frameSpeed = frameCount;
        }

        if (frameSpeed == i && i < 10)
        {
          image(goBlue[i], width/2-350, height/2-150); 

          i++;
          x++;
          frameCount = 0;
        } 
        if (i >= 9)
        {
          i = 6;
        }
        if (i < 10)
        {
          image(goBlue[i], width/2-350, height/2-150);
        }
        if (x > 5000)
        {
          transformation = false;
          state = 2.3;
        }
      }
    }
  }


  void playBoxes()
  {
    if (tran > 255 || tran < 50)
    {
      tranS *= -1;
    }

    strokeWeight(0);
    fill(#FF7D03, tran);
    noStroke();
    rect(width*0.05, height*0.6, 600, 15);  // player 1 box
    rect(width*0.05, height*0.6+15, 15, 335);
    rect(width*0.05+585, height*0.6+15, 15, 335);
    rect(width*0.05+15, height*0.6+335, 570, 15);

    rect(width*0.65, height*0.6, 600, 15);  // player 2 box
    rect(width*0.65, height*0.6+15, 15, 335);
    rect(width*0.65+585, height*0.6+15, 15, 335);
    rect(width*0.65+15, height*0.6+335, 570, 15);

    tran += tranS;
  }

  void healthBar()
  {
    stroke(255, 50, 0);
    strokeWeight(10);
    fill(0);
    rect(width*0.4, height*0.9, 400, 50);

    noStroke();
    fill(#FF7D03);
    rect(width*0.401, height*0.904, health-3, 42);
  }
}
