class ph1d
{
  String s;
  float x, y;
  int i, frameSpeed, fade, p1size, p1c, p2size, p2c, p3size, p3c;
  boolean confirm, back, forward;
  PImage gp, agp, sgp, dgp, spgp, fgp, tgp, godku, blueku;
  PVector p1s, p2s, p3s;

  ph1d()
  {
    s = "Oh...";
    gp = loadImage("goku_portrait.png");
    agp = loadImage("angrygoku_portrait.png");
    sgp = loadImage("sadgoku_portrait.png");
    dgp = loadImage("disappointedgoku_portrait.png");
    spgp = loadImage("speechlessgoku_portrait.png");
    fgp = loadImage("furygoku_portrait.png");
    tgp = loadImage("transforminggoku_portrait.png");
    godku = loadImage("god_goku.png");
    blueku = loadImage("blue_goku.png");
    back = forward = false;
    i = 0;
    fade = 255;
    p1size = 50;
    p2size = p3size = 40;
    p1c = #2CBEFF;
    p2c = p3c = 255;
    p1s = new PVector(width*0.2, height*0.4);
    p2s = new PVector(width*0.2, height*0.5);
    p3s = new PVector(width*0.2, height*0.6);
    x = width*0.45;
    y = height*0.83;
  }

  void introText()
  {
    fill(255);
    textSize(30);
    if (s == "You've caused quite the ruckus..." || s == "I actually wanted you guys to push harder, y'know?" || s == "I was as young as you when I started fighting" || s == "I broke my limits to become who I am")
    {
      frameSpeed = frameCount/2;
    } else if (s == "And you . . .")
    {
      frameSpeed = frameCount/20;
    } else if (s == "A R E  T H A T  E X C E P T I O N ! ! !")
    {
      frameSpeed = frameCount/3;
    } else
    {
      frameSpeed = frameCount/4;
    }

    if (i == s.length())
    {
      confirm = true;
    } 
    if (frameSpeed == i)
    {
      if (!confirm)
      {
        if (x > width*0.71 && s == "I actually wanted you guys to push harder, y'know?" || x > width*0.71 && s == "I broke my limits to become who I am" || x > width*0.665 && s == "You used our lessons to KILL everyone. . .")
        {
          x = width*0.45-textWidth('I');
          y = height*0.88;
        }
        if (x > width*0.72 && s == "I was as young as you when I started fighting")
        {
          x = width*0.45-textWidth('I');
          y = height*0.88;
        }
        char c = s.charAt(i);
        if (c == 'K' || c == 'I' && s == "You used our lessons to KILL everyone. . ." || c == 'L')
        {
          fill(255, 0, 0);
        }

        text(c, x, y);
        if (gokuSpeak.position() >= 10)
        {
          gokuSpeak.rewind();
        } else
        {
          gokuSpeak.play();
        }
        x = x + textWidth(c);
      }

      if (i < s.length())
      {
        i += 1;
      }

      if (i == s.length())
      {
        if (s == "Oh...")
        {
          fill(255);
          textSize(20);
          text("Press Space to advance", width*0.6, height*0.93);
        } else
        {
          fill(#23B8FA);
          textSize(20);
          text("Space", width*0.7, height*0.93);
        }
      }
    }



    if (s == "A R E  T H A T  E X C E P T I O N ! ! !" && x >= 1380.6504)
    {
      x+= 1;
      if (x > 1400)
      {
        ingamesong.play();
      }
      if (x > 1450)
      {
        background(0);
        text("Dodge attacks by moving with WASD keys(P1)", width*0.3, height*0.5);
        text("Dodge attacks by moving with arrow keys(P2)", width*0.3, height*0.6);
      }
      if (x > 1600)
      {
        state = 2.2;
      }
    }
  }

  void confirmation()
  {
    if (confirm && key == ' ' && s == "Oh...")
    {
      if (select.position() >= 100)
      {
        select.rewind();
      } 
      select.play();
      frameCount = 0;
      background(0);
      fill(0);
      stroke(255);
      strokeWeight(7);
      rect(width*0.33, height*0.75, width*0.4, 160);
      image(gp, width*0.334, height*0.725);
      x = width*0.45;
      y = height*0.83;
      i = 0;
      s = "You're here...";
      confirm = false;
    }
    if (confirm && key == ' ' && s == "You're here...")
    {
      if (select.position() >= 100)
      {
        select.rewind();
      } 
      select.play();
      frameCount = 0;
      background(0);
      fill(0);
      stroke(255);
      strokeWeight(7);
      rect(width*0.33, height*0.75, width*0.4, 160);
      image(spgp, width*0.334, height*0.725);
      x = width*0.45;
      y = height*0.83;
      i = 0;
      s = ". . .";
      confirm = false;
    }
    if (confirm && key == ' ' && s == ". . .")
    {
      if (select.position() >= 100)
      {
        select.rewind();
      } 
      select.play();
      frameCount = 0;
      background(0);
      fill(0);
      stroke(255);
      strokeWeight(7);
      rect(width*0.33, height*0.75, width*0.4, 160);
      image(dgp, width*0.334, height*0.725);
      x = width*0.45;
      y = height*0.83;
      i = 0;
      s = "You've caused quite the ruckus...";
      confirm = false;
    }
    if (confirm && key == ' ' && s == "You've caused quite the ruckus...")
    {
      if (select.position() >= 100)
      {
        select.rewind();
      } 
      select.play();
      frameCount = 0;
      background(0);
      fill(0);
      stroke(255);
      strokeWeight(7);
      rect(width*0.33, height*0.75, width*0.4, 160);
      image(agp, width*0.334, height*0.725);
      x = width*0.45;
      y = height*0.83;
      i = 0;
      s = "Haven't you?";
      confirm = false;
    }
    if (confirm && key == ' ' && s == "Haven't you?")
    {
      if (select.position() >= 100)
      {
        select.rewind();
      } 
      select.play();
      frameCount = 0;
      background(0);
      fill(0);
      stroke(255);
      strokeWeight(7);
      rect(width*0.33, height*0.75, width*0.4, 160);
      image(spgp, width*0.334, height*0.725);
      x = width*0.45;
      y = height*0.83;
      i = 0;
      s = ". . . ";
      confirm = false;
    }
    if (confirm && key == ' ' && s == ". . . ")
    {
      if (select.position() >= 100)
      {
        select.rewind();
      } 
      select.play();
      frameCount = 0;
      background(0);
      fill(0);
      stroke(255);
      strokeWeight(7);
      rect(width*0.33, height*0.75, width*0.4, 160);
      image(sgp, width*0.334, height*0.725);
      x = width*0.45;
      y = height*0.83;
      i = 0;
      s = "I. . .";
      confirm = false;
    }
    if (confirm && key == ' ' && s == "I. . .")
    {
      if (select.position() >= 100)
      {
        select.rewind();
      } 
      select.play();
      frameCount = 0;
      background(0);
      fill(0);
      stroke(255);
      strokeWeight(7);
      rect(width*0.33, height*0.75, width*0.4, 160);
      image(sgp, width*0.334, height*0.725);
      x = width*0.45;
      y = height*0.83;
      i = 0;
      s = "I actually wanted you guys to push harder, y'know?";
      confirm = false;
    }
    if (confirm && key == ' ' && s == "I actually wanted you guys to push harder, y'know?")
    {
      if (select.position() >= 100)
      {
        select.rewind();
      } 
      select.play();
      frameCount = 0;
      background(0);
      fill(0);
      stroke(255);
      strokeWeight(7);
      rect(width*0.33, height*0.75, width*0.4, 160);
      image(gp, width*0.334, height*0.725);
      x = width*0.45;
      y = height*0.83;
      i = 0;
      s = "I was as young as you when I started fighting";
      confirm = false;
    }
    if (confirm && key == ' ' && s == "I was as young as you when I started fighting")
    {
      if (select.position() >= 100)
      {
        select.rewind();
      } 
      select.play();
      frameCount = 0;
      background(0);
      fill(0);
      stroke(255);
      strokeWeight(7);
      rect(width*0.33, height*0.75, width*0.4, 160);
      image(gp, width*0.334, height*0.725);
      x = width*0.45;
      y = height*0.83;
      i = 0;
      s = "I broke my limits to become who I am";
      confirm = false;
    }
    if (confirm && key == ' ' && s == "I broke my limits to become who I am")
    {
      if (select.position() >= 100)
      {
        select.rewind();
      } 
      select.play();
      frameCount = 0;
      background(0);
      fill(0);
      stroke(255);
      strokeWeight(7);
      rect(width*0.33, height*0.75, width*0.4, 160);
      image(sgp, width*0.334, height*0.725);
      x = width*0.45;
      y = height*0.83;
      i = 0;
      s = "I thought. . .";
      confirm = false;
    }
    if (confirm && key == ' ' && s == "I thought. . .")
    {
      if (select.position() >= 100)
      {
        select.rewind();
      } 
      select.play();
      frameCount = 0;
      background(0);
      fill(0);
      stroke(255);
      strokeWeight(7);
      rect(width*0.33, height*0.75, width*0.4, 160);
      image(sgp, width*0.334, height*0.725);
      x = width*0.45;
      y = height*0.83;
      i = 0;
      s = "If I taught you two I could tea-";
      confirm = false;
    }
    if (confirm && key == ' ' && s == "If I taught you two I could tea-")
    {
      if (select.position() >= 100)
      {
        select.rewind();
      } 
      select.play();
      frameCount = 0;
      background(0);
      fill(0);
      stroke(255);
      strokeWeight(7);
      rect(width*0.33, height*0.75, width*0.4, 160);
      image(spgp, width*0.334, height*0.725);
      x = width*0.45;
      y = height*0.83;
      i = 0;
      s = "No. . .";
      confirm = false;
    }
    if (confirm && key == ' ' && s == "No. . .")
    {
      if (select.position() >= 100)
      {
        select.rewind();
      } 
      select.play();
      frameCount = 0;
      background(0);
      fill(0);
      stroke(255);
      strokeWeight(7);
      rect(width*0.33, height*0.75, width*0.4, 160);
      image(dgp, width*0.334, height*0.725);
      x = width*0.45;
      y = height*0.83;
      i = 0;
      s = "THEY could teach you how it worked";
      confirm = false;
    }
    if (confirm && key == ' ' && s == "THEY could teach you how it worked")
    {
      if (select.position() >= 100)
      {
        select.rewind();
      } 
      select.play();
      frameCount = 0;
      background(0);
      fill(0);
      stroke(255);
      strokeWeight(7);
      rect(width*0.33, height*0.75, width*0.4, 160);
      image(dgp, width*0.334, height*0.725);
      x = width*0.45;
      y = height*0.83;
      i = 0;
      s = ". . .it'd make you happy";
      confirm = false;
    }
    if (confirm && key == ' ' && s == ". . .it'd make you happy")
    {
      if (select.position() >= 100)
      {
        select.rewind();
      } 
      select.play();
      frameCount = 0;
      background(0);
      fill(0);
      stroke(255);
      strokeWeight(7);
      rect(width*0.33, height*0.75, width*0.4, 160);
      image(dgp, width*0.334, height*0.725);
      x = width*0.45;
      y = height*0.83;
      i = 0;
      s = "But. . .";
      confirm = false;
    }
    if (confirm && key == ' ' && s == "But. . .")
    {
      if (select.position() >= 100)
      {
        select.rewind();
      } 
      select.play();
      frameCount = 0;
      background(0);
      fill(0);
      stroke(255);
      strokeWeight(7);
      rect(width*0.33, height*0.75, width*0.4, 160);
      image(agp, width*0.334, height*0.725);
      x = width*0.45;
      y = height*0.83;
      i = 0;
      s = "You used our lessons to KILL everyone. . .";
      confirm = false;
    }
    if (confirm && key == ' ' && s == "You used our lessons to KILL everyone. . .")
    {
      if (select.position() >= 100)
      {
        select.rewind();
      } 
      select.play();
      frameCount = 0;
      background(0);
      fill(0);
      stroke(255);
      strokeWeight(7);
      rect(width*0.33, height*0.75, width*0.4, 160);
      image(agp, width*0.334, height*0.725);
      x = width*0.45;
      y = height*0.83;
      i = 0;
      s = "I never fight to kill. . .";
      confirm = false;
    }
    if (confirm && key == ' ' && s == "I never fight to kill. . .")
    {
      if (select.position() >= 100)
      {
        select.rewind();
      } 
      select.play();
      frameCount = 0;
      background(0);
      fill(0);
      stroke(255);
      strokeWeight(7);
      rect(width*0.33, height*0.75, width*0.4, 160);
      image(fgp, width*0.334, height*0.725);
      x = width*0.45;
      y = height*0.83;
      i = 0;
      s = " . . . ";
      confirm = false;
    }
    if (confirm && key == ' ' && s == " . . . ")
    {
      if (select.position() >= 100)
      {
        select.rewind();
      } 
      select.play();
      frameCount = 0;
      background(0);
      fill(0);
      stroke(255);
      strokeWeight(7);
      rect(width*0.33, height*0.75, width*0.4, 160);
      image(fgp, width*0.334, height*0.725);
      x = width*0.45;
      y = height*0.83;
      i = 0;
      s = "But I make exceptions sometimes. . .";
      confirm = false;
    }
    if (confirm && key == ' ' && s == "But I make exceptions sometimes. . .")
    {
      if (select.position() >= 100)
      {
        select.rewind();
      } 
      select.play();
      frameCount = 0;
      background(0);
      fill(0);
      stroke(255);
      strokeWeight(7);
      rect(width*0.33, height*0.75, width*0.4, 160);
      image(fgp, width*0.334, height*0.725);
      x = width*0.45;
      y = height*0.83;
      i = 0;
      s = "And you. . .";
      confirm = false;
    }
    if (confirm && key == ' ' && s == "And you. . .")
    {
      if (select.position() >= 100)
      {
        select.rewind();
      } 
      select.play();
      frameCount = 0;
      background(0);
      fill(0);
      stroke(255);
      strokeWeight(7);
      rect(width*0.33, height*0.75, width*0.4, 160);
      image(tgp, width*0.334, height*0.725);
      x = width*0.45;
      y = height*0.83;
      i = 0;
      s = "A R E  T H A T  E X C E P T I O N ! ! !";
      confirm = false;
    }
  }

  void phaseSelection()
  {
    if (state == 2)
    {
      if (select.position() >= 100)
      {
        select.rewind();
      } 
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
      fill(p1c);
      textSize(p1size);
      text("Phase 1", p1s.x, p1s.y);

      fill(p2c);
      textSize(p2size);
      text("Phase 2", p2s.x, p2s.y);

      fill(p3c);
      textSize(p3size);
      text("Phase 3", p3s.x, p3s.y);
    }
  }

  void phaseSelectControls()
  {
    if (key == CODED)
    {
      if (keyCode == DOWN)
      {
        if (p1size == 50)
        {
          if (movemenu.position() >= 50)
          {
            movemenu.rewind();
          } 
          movemenu.play();
          p1size = 40;
          p1c = 255;

          p2size = 50;
          p2c = #2CBEFF;
        } else if (p2size == 50)
        {
          if (movemenu.position() >= 50)
          {
            movemenu.rewind();
          } 
          movemenu.play();
          p2size = 40;
          p2c = 255;

          p3size = 50;
          p3c = #2CBEFF;
        }
      }

      if (keyCode == UP)
      {
        if (p3size == 50)
        {
          if (movemenu.position() >= 50)
          {
            movemenu.rewind();
          } 
          movemenu.play();
          p3size = 40;
          p3c = 255;

          p2size = 50;
          p2c = #2CBEFF;
        } else if (p2size == 50)
        {
          if (movemenu.position() >= 50)
          {
            movemenu.rewind();
          } 
          movemenu.play();
          p2size = 40;
          p2c = 255;

          p1size = 50;
          p1c = #2CBEFF;
        }
      }
    }

    if (key == 'M' || key == 'm')
    {
      back = true;
    }
    if (key == ' ' && p1size == 50)
    {

      select.play();

      fade = 99;
      forward = true;
      mm.playSelected = false;
    }
  }

  void fadeIn()
  {
    if (!back)
    {
      background(fade);
      if (fade < 100)
      {
        fade += 0;
        state = 2;
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
        mm.playSelected = false;
        mm.stopSelection = false;
        back = false;
        state = 0;
      } else
      {
        fade += 4;
      }
    }
  }

  void phaseFade()
  {  
    background(fade);
    if (fade >= 255)
    {
      frameCount = 0;
      background(0);
      fill(0);
      stroke(255);
      strokeWeight(7);
      rect(width*0.33, height*0.75, width*0.4, 160);
      image(gp, width*0.334, height*0.725);
      fade += 0;
      state = 2.1;
      forward = false;
    } else
    {
      fade += 2;
    }
  }
}
