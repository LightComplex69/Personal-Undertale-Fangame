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
    i = 0;
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
        state = 11;
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
}
