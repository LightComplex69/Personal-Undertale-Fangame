class Exit
{
  int yesColor, yesSize, noColor, noSize, fade, closeFade, selectHandler;
  boolean areYouSure, activateFade;

  Exit()
  {
    fade = 0;
    selectHandler = 1;
    closeFade = yesColor = 255;
    noColor = #FF0D15;
    noSize = 50;
    yesSize = 40;
    areYouSure = false;
  }

  void exitScreen() {
    prompt();
  }

  void prompt()
  {
    fill(0, fade);
    rect(0, 0, width, height);

    if (fade > 50)
    {
      fade += 0;
      activateFade = false;
      areYouSure();
    } else
    {
      fade += 2;
    }
  }

  void areYouSure()
  {

    fill(0, fade);
    //rect(0, 0, width, height);

    textSize(60);
    fill(255);
    text("Are You Sure About That?", width*0.32, height/2);

    defineDisplay();
    textSize(noSize);
    fill(noColor);
    text("No", width*0.7, height*0.66);

    textSize(yesSize);
    fill(yesColor);
    text("Yes", width*0.3, height*0.66);
  }

  void selectControls()
  {
    switch(keyCode) {
    case LEFT:
      if (selectHandler > 1) {
        selectHandler --;
      }
      break;
    case RIGHT:
      if (selectHandler < 2) {
        selectHandler ++;
      }
      break;
      
    case 'm':
    case 'M':
      selectHandler = 2;
    case ' ':
      defineSelection();
      break;

    default:
      break;
    }
  }

  void defineDisplay() {
    switch(selectHandler) {
    case 1:
      noColor = 255;
      noSize = 40;

      yesColor = #FEFF0D;
      yesSize = 50;
      break;
    case 2:
      yesColor = 255;
      yesSize = 40;

      noColor = #FF0D15;
      noSize = 50;
      break;

    default:
      break;
    }
  }

  void defineSelection() {
    switch(selectHandler) {
    case 1:
      state = 40;
      break;
    case 2:
      fade = 0;
      state = 0;
      break;

    default:
      break;
    }
  }

  void exitGame()
  {
    if (closeFade <= 0)
    {
      exit();
    }
    closeFade -= 4;

    fill(closeFade);
    rect(0, 0, width, height);
  }
}
