class Play {
  int fade, p1size, p1color, p2size, p2color, p3size, p3color;
  boolean back, forward;
  PImage godku, blueku;
  PVector p1s, p2s, p3s;

  Play() {
    godku = loadImage("god_goku.png");
    blueku = loadImage("blue_goku.png");
    back = forward = false;
    fade = 255;
    p1size = 50;
    p2size = p3size = 40;
    p1color = #2CBEFF;
    p2color = p3color = 255;
    p1s = new PVector(width*0.2, height*0.4);
    p2s = new PVector(width*0.2, height*0.5);
    p3s = new PVector(width*0.2, height*0.6);
  }

  void levelScreen(){
    fadeIn();
    fadeBack();
  }

  void display()
  {
    stroke(255);
    fill(0);
    rect(width*0.6, height*0.15, 400, 775);

    if (p1size == 50)
    {
      image(godku, width*0.605, height*0.16);
    } else if (p2size == 50)
    {
      image(blueku, width*0.605, height*0.16);
    } else if (p3size == 50)
    {
      image(mm.backgroundku, width*0.6, height*0.16);
    }

    stroke(0);
    fill(p1color);
    textSize(p1size);
    text("Phase 1", p1s.x, p1s.y);

    fill(p2color);
    textSize(p2size);
    text("Phase 2", p2s.x, p2s.y);

    fill(p3color);
    textSize(p3size);
    text("Phase 3", p3s.x, p3s.y);
  }

  void fadeIn()
  {
    if (!back)
    {
      background(fade);
      if (fade < 100)
      {
        fade += 0;
        display();
      } else
      {
        fade -= 4;
      }
    }
  }

  void fadeBack()
  {
    if (back)
    {
      background(fade);
      if (fade > 255)
      {
        fade += 0;
        back = false;
        state = 0;
      } else
      {
        fade += 4;
      }
    }
  }

  void selectControls()
  {
    if (key == CODED)
    {
      if (keyCode == DOWN)
      {
        if (p1size == 50)
        {
          p1size = 40;
          p1color = 255;

          p2size = 50;
          p2color = #2CBEFF;
        } else if (p2size == 50)
        {
          p2size = 40;
          p2color = 255;

          p3size = 50;
          p3color = #2CBEFF;
        }
      }

      if (keyCode == UP)
      {
        if (p3size == 50)
        {
          p3size = 40;
          p3color = 255;

          p2size = 50;
          p2color = #2CBEFF;
        } else if (p2size == 50)
        {
          p2size = 40;
          p2color = 255;

          p1size = 50;
          p1color = #2CBEFF;
        }
      }
    }

    if (key == 'M' || key == 'm')
    {
      back = true;
    }
    if (key == ' ' && p1size == 50)
    {
      fade = 99;
      forward = true;
    }
  }
  
  //void phaseFade()
  //{
  //  background(fade);
  //  if (fade >= 255)
  //  {
  //    frameCount = 0;
  //    background(0);
  //    fill(0);
  //    stroke(255);
  //    strokeWeight(7);
  //    rect(width*0.33, height*0.75, width*0.4, 160);
  //    image(gp, width*0.334, height*0.725);
  //    fade += 0;
  //    state = 10;
  //    forward = false;
  //  } else
  //  {
  //    fade += 2;
  //  }
  //}
}
