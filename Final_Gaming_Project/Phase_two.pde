class phase2
{
  int frameSpeed, tran, tranS, fade, i;
  float health, cX, cY;
  boolean guardmode, next;
  String alert;

  phase2()
  {
    i = 0;
    fade = 0;
    tran = 100;
    tranS = 2;
    health = 400;
    guardmode = true;
    next = false;
    alert = "End of Demo";
    cX = width*0.36;
    cY = height*0.58;
  }

  void goku()
  {
    p.blueku.resize(300, 581);
    image(p.blueku, width*0.425, 20);
  }


  void firstAttack()
  {
    if (guardmode)
    {
      if (!next)
      {
        fill(255);
        text(alert, cX, cY);
      }

      if (i < 150)
      {
        i += 1;
      }

      if (i >= 150 && alert == "End of Demo")
      {
        frameCount = 0;
        i = 0;
        next = true;
      }
      // ---------------------------------------------------------------------------------
      
    }
  }

  void playBoxes()
  {
    if (tran > 255 || tran < 50)
    {
      tranS *= -1;
    }

    strokeWeight(0);
    fill(#2B76BC, tran);
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
    stroke(50, 50, 200);
    strokeWeight(10);
    fill(0);
    rect(width*0.4, height*0.9, 400, 50);

    noStroke();
    fill(#2B76BC);
    rect(width*0.401, height*0.904, health-3, 42);
  }
}
