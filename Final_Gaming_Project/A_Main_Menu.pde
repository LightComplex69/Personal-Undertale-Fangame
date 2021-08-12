class mainMenu
{
  PImage Title, play, htp, options, exit, muiku;
  PVector title, ps, htps, os, es;
  int opacity, selectHandler;
  float titleSpeed, fadeSpeed;

  mainMenu()
  {
    Title = loadImage("title_screen.png");
    title = new PVector(width*0.4, height*0.1);
    opacity = 0;
    fadeSpeed = titleSpeed = selectHandler = 1;

    play = loadImage("play_button.png");
    htp = loadImage("htp_button.png");
    options = loadImage("options_button.png");
    exit = loadImage("exit_button.png");
    muiku = loadImage("mui_goku.png");

    ps = new PVector(width*0.47, height*0.4);
    htps = new PVector(width*0.47, height*0.55);
    os = new PVector(width*0.47, height*0.7);
    es = new PVector(width*0.47, height*0.85);
  }

  void selectScreen()
  {
    displayAssets();
    defineDisplay();
    handleFade();
  }

  void displayAssets() {
    background(255);
    fill(255);

    tint(255, opacity);
    image(muiku, width*0.42, height*0.2);

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
  }

  void handleFade() {
    opacity += fadeSpeed;
    title.y += titleSpeed;

    if (title.y >= height*0.125 || title.y <= height*0.05)
    {
      titleSpeed *= -1;
    }

    if (opacity >= 100 || opacity <= -100)
    {
      fadeSpeed *= -1;
    }
  }

  void selectControls()
  {
    switch(keyCode) {
    case DOWN:
      if (selectHandler < 4) {
        selectHandler ++;
      }
      break;
    case UP:
      if (selectHandler > 1) {
        selectHandler --;
      }
      break;
    case ' ':
      defineSelection();
      break;
      
    case 'm':
    case 'M':
      state = 4;
      break;
      
    default:
      break;
    }
  }

  void defineDisplay() {
    switch(selectHandler) {
    case 1:
      pushStyle();
      tint(#FEFF08);
      ps.x = width*.45;
      popStyle();

      htps.x = width*.47;
      os.x = width*.47;
      es.x = width*.47;
      break;
    case 2:
      ps.x = width*.47;
      htps.x = width*.45;
      os.x = width*.47;
      es.x = width*.47;
      break;
    case 3:
      ps.x = width*.47;
      htps.x = width*.47;
      os.x = width*.45;
      es.x = width*.47;
      break;
    case 4:
      ps.x = width*.47;
      htps.x = width*.47;
      os.x = width*.47;
      es.x = width*.45;
      break;

    default:
      break;
    }
  }

  void defineSelection() {
    switch(selectHandler) {
    case 1:
      state = 1;
      break;
    case 2:
      break;
    case 3:
      state = 3;
      break;
    case 4:
      state = 4;
      break;

    default:
      break;
    }
  }
}
