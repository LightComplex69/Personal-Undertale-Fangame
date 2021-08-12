void FSMhandler() {
  switch(state) {
  case 0:
    mm.selectScreen();
    break;
  case 1:
    p.fadeIn();
    p.phaseSelection();
    p.fadeBack();
    break;
  case 2:
  case 3:
    break;
  case 4:
    e.prompt();
    e.areYouSure();
    break;

  default:
    break;
  }

  //  if (!mm.stopSelection && state == 0)
  //  {
  //    mm.selectScreen();
  //  } else if (state == -1)
  //  {
  //    e.exitGame();
  //  } else if (state == 3)
  //  {
  //    o.selectScreen();
  //    o.fadeBack();
  //  } else if (state == 3)
  //  {
  //    o.fadeIn();
  //  } else if (state == 3.1)
  //  {
  //    o.credits();
  //  } else if (state == 3.2)
  //  {
  //    o.controls();
  //  } else if (state == 1)
  //  {
  //    p.fadeIn();
  //    p.phaseSelection();
  //    p.fadeBack();
  //  } else if (p.forward)
  //  {
  //    p.phaseFade();
  //  } else if (state == 2.1)
  //  {
  //    p.introText();
  //  } else if (state == 2.2)
  //  {
  //    if (!godphase.phasePassed && godphase.health > 0)
  //    {
  //      background(0);
  //      one.movement();
  //      two.movement();

  //      godphase.firstAttack();

  //      noStroke();
  //      fill(50);
  //      rect(0, 0, width, height*0.6+15); // top rectangle
  //      rect(0, 0, width*0.05+15, height);  // left side rectangle
  //      rect(width*0.65+585, 0, width, height);  // right side rectangle
  //      rect(0, height*0.6+335, width, height);  // bottom rectangle
  //      rect(width*0.05+585, height*0.6, width*0.65-(width*0.05+570), 350);  // middle rectangle

  //      godphase.goku();
  //      godphase.playBoxes();
  //      godphase.kamehameha();
  //      godphase.healthBar();
  //    }
  //    godphase.phaseDone();
  //    godphase.transform();
  //    gameOver();
  //  } else if (state == 2.3)
  //  {
  //    background(0);

  //    one.movement();
  //    two.movement();


  //    noStroke();
  //    fill(50);
  //    rect(0, 0, width, height*0.6+15); // top rectangle
  //    rect(0, 0, width*0.05+15, height);  // left side rectangle
  //    rect(width*0.65+585, 0, width, height);  // right side rectangle
  //    rect(0, height*0.6+335, width, height);  // bottom rectangle
  //    rect(width*0.05+585, height*0.6, width*0.65-(width*0.05+570), 350);  // middle rectangle

  //    bluephase.firstAttack();
  //    bluephase.goku();
  //    bluephase.playBoxes();
  //    bluephase.healthBar();
  //  } else if (state == 4)
  //  {
  //    e.prompt();
  //    e.areYouSure();
  //  }
}
