class mainMenu
{
  PImage Title, play, htp, options, exit, backgroundku;
  PVector title, ps, htps, os, es;
  int rX, rY, r, g, b;
  float colorSpeed, titleSpeed, fadeSpeed;
  boolean stopSelection, exitSelected, playSelected, optionsSelected, htpSelected;

  mainMenu()
  {
    Title = loadImage("title_screen.png");
    title = new PVector(width*0.4, height*0.1);
    rX = 300;
    rY = 180;
    g = b = r = 0;
    fadeSpeed = 1;
    colorSpeed = 1;
    titleSpeed = 1;

    play = loadImage("play_button.png");
    htp = loadImage("htp_button.png");
    options = loadImage("options_button.png");
    exit = loadImage("exit_button.png");
    backgroundku = loadImage("mui_goku.png");

    ps = new PVector(width*0.45, height*0.4);
    htps = new PVector(width*0.47, height*0.55);
    os = new PVector(width*0.47, height*0.7);
    es = new PVector(width*0.47, height*0.85);
    stopSelection = exitSelected = playSelected = htpSelected = optionsSelected = false;
  }

  void selectScreen()
  {
    background(255);
    fill(255);

    tint(255, g);
    image(backgroundku, width*0.42, height*0.2);

    tint(255);
    image(Title, title.x, title.y);


    image(play, ps.x, ps.y);

    image(htp, htps.x, htps.y);

    image(options, os.x, os.y);

    image(exit, es.x, es.y);

    image(arrows, 0, height-150);
    fill(0);
    textSize(20);
    text("To Move, Space to Select, M to go back", 130, height-50);

    g += fadeSpeed;

    title.y += titleSpeed;

    if (title.y >= height*0.125 || title.y <= height*0.05)
    {
      titleSpeed *= -1;
    }

    if (g >= 100 || g <= -100)
    {
      fadeSpeed *= -1;
    }
  }

  void selectionControls()
  {
    if (key == CODED)
    {
      if (keyCode == DOWN)
      {
        if (ps.x == width*0.45)
        {
          if (movemenu.position() >= 50)
          {
            movemenu.rewind();
          } 
          movemenu.play();

          ps.x = width*0.47;

          htps.x = width*0.45;
        } else if (htps.x == width*0.45)
        {
          if (movemenu.position() >= 50)
          {
            movemenu.rewind();
          } 
          movemenu.play();

          htps.x = width*0.47;

          os.x = width*0.45;
        } else if (os.x == width*0.45)
        {
          if (movemenu.position() >= 50)
          {
            movemenu.rewind();
          } 
          movemenu.play();

          os.x = width*0.47;

          es.x = width*0.45;
        }
      }

      if (keyCode == UP)
      {
        if (es.x == width*0.45)
        {
          if (movemenu.position() >= 50)
          {
            movemenu.rewind();
          } 
          movemenu.play();

          es.x = width*0.47;

          os.x = width*0.45;
        } else if (os.x == width*0.45)
        {
          if (movemenu.position() >= 50)
          {
            movemenu.rewind();
          } 
          movemenu.play();

          os.x = width*0.47;

          htps.x = width*0.45;
        } else if (htps.x == width*0.45)
        {
          if (movemenu.position() >= 50)
          {
            movemenu.rewind();
          } 
          movemenu.play();

          htps.x = width*0.47;

          ps.x = width*0.45;
        }
      }
    }

    if (key == ' ' && es.x == width*0.45 || key == 'm' || key == 'M') // isExitSelected
    {
      if (select.position() >= 100)
      {
        select.rewind();
      } 
      select.play();

      stopSelection = true;
      exitSelected = true;
      e.activateFade = true;
    }

    if (key == ' ' && ps.x == width*0.45) // isLevelsSelected
    {
      if (select.position() >= 100)
      {
        select.rewind();
      } 
      select.play();

      stopSelection = true;
      playSelected = true;
    }

    if (key == ' ' && os.x == width*0.45) // isOptionsSelected
    {
      if (select.position() >= 100)
      {
        select.rewind();
      } 
      select.play();
      stopSelection = true;
      optionsSelected = true;
    }
  }
}
