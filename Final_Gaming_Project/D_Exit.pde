class Exit
{
  int yesColor, yesSize, noColor, noSize, fade, closeFade;
  boolean areYouSure, activateFade;

  Exit()
  {
    fade = 0;
    closeFade = 255;
    noColor = #FF0D15;
    noSize = 50;
    yesColor = 255;
    yesSize = 40;
    areYouSure = false;
  }

  void prompt()
  {
    fill(0, fade);
    rect(0, 0, width, height);

    if (fade > 50)
    {
      fade += 0;
      activateFade = false;
      areYouSure = true;
    } else 
    {
      fade += 2;
    }
    println(fade);
  }

  void areYouSure()
  {
    if (areYouSure)
    {
      fill(0, fade);
      //rect(0, 0, width, height);

      textSize(60);
      fill(255);
      text("Are You Sure About That?", width*0.32, height/2);

      textSize(noSize);
      fill(noColor);
      text("No", width*0.7, height*0.66);

      textSize(yesSize);
      fill(yesColor);
      text("Yes", width*0.3, height*0.66);
    }
  }

  void areYouSureSelection()
  {
    if (noColor == #FF0D15 && key == CODED && keyCode == LEFT)
    {
      if (movemenu.position() >= 50)
      {
        movemenu.rewind();
      } 
      movemenu.play();
      noColor = 255;
      noSize = 40;

      yesColor = #FEFF0D;
      yesSize = 50;
    } else if (yesColor == #FEFF0D && key == CODED && keyCode == RIGHT)
    {
      if (movemenu.position() >= 50)
      {
        movemenu.rewind();
      } 
      movemenu.play();
      yesColor = 255;
      yesSize = 40;

      noColor = #FF0D15;
      noSize = 50;
    } else if (noColor == #FF0D15 && key == ' ' || key == 'm' || key == 'M')
    {
      if (select.position() >= 100)
      {
        select.pause();
        select.rewind();
      } 
      select.play();
      fade = 0;
      areYouSure = mm.stopSelection = mm.exitSelected = false;
    } else if (yesColor == #FEFF0D && key == ' ')
    {
      if (select.position() >= 100)
      {
        select.rewind();
      } 
      select.play();
      state = -1;
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
