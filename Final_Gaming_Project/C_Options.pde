class options
{
  int fade, controlsSize, controlsColor, creditsSize, creditsColor;
  boolean fadeBack;

  options()
  {
    fade = 255;
    fadeBack = false;
    controlsSize = 50;
    controlsColor = #55FF70;
    creditsSize = 40;
    creditsColor = 255;
  }

  void fadeIn()
  {
    if (!fadeBack)
    {
      background(fade);
      if (fade < 100)
      {
        fade += 0;
        state = 3;
      } else
      {
        fade -= 4;
      }
    }
  }

  void fadeBack()
  {
    if (fadeBack)
    {
      background(fade);
      if (fade > 255)
      {
        fade += 0;
        mm.stopSelection = false;
        fadeBack = false;
        state = 0;
      } else
      {
        fade += 4;
      }
    }
  }

  void credits()
  {
    background(fade);

    textSize(20);
    fill(#FF4B4E);
    text("Sound effects from [DBZ] and [Undertale](Credit to [Funimation, Toei Animation, Fuji TV, Akira Toriyama], and [Toby Fox])", width/4-80, height*0.4);

    fill(#55D3F7);
    text("All Goku Sprites made by me(with references from the anime of course)", width/4-80, height*0.5);

    fill(#E8E5E6);
    text("Title Screen(Written in Hiragana) made using paint.net and a font whose name I forgot", width/4-80, height*0.6);

    fill(#FAF13D);
    text("Original premise idea is a remixed form of Undertale, pretty much like a fan Game", width/4-80, height*0.7);
  }

  void creditBackout()
  {
    if (key == 'm' || key == 'M')
    {
      state = 3;
    }
  }

  void controls()
  {
    background(fade);

    textSize(50);
    fill(#55D3F7);
    text("Use WASD to move player 1 and Arrow keys to move player 2", width*0.12, height*0.4);
    text("Space is the select/confirm button and M is the back button", width*0.12, height*0.5);
  }

  void controlBackout()
  {
    if (key == 'm' || key == 'M')
    {
      state = 3;
    }
  }

  void selectScreen()
  {
    background(fade);

    textSize(controlsSize);
    fill(controlsColor);
    text("Controls", width/4-80, height*0.4);

    textSize(creditsSize);
    fill(creditsColor);
    text("Credits", width/4-80, height*0.6);
  }


  void selectControls()
  {
    if (key == CODED)
    {
      if (keyCode == DOWN)
      {
        if (controlsSize == 50) // orange-ish
        {
          controlsColor = 255;
          controlsSize = 40;
          creditsColor = #FF08D2; // purple
          creditsSize = 50;
        }
      }

      if (keyCode == UP)
      {
        if (creditsSize == 50)
        {
          creditsColor = 255;
          creditsSize = 40;
          controlsColor = #55FF70;
          controlsSize = 50;
        }
      }
    }
    
    if (key == ' ' && controlsSize == 50)
    {
      state = 30;
    }

    if (key == ' ' && creditsSize == 50)
    {
      state = 31;
    }

    if (key == 'm' || key == 'M')
    {
      fadeBack = true;
    }
  }
}
