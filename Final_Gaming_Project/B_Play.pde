class Play {
  int fade, p1size, p1color, p2size, p2color, p3size, p3color, selectHandler;
  boolean back, forward;
  PImage godku, blueku, displayImage;
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
    selectHandler = 1;
    displayImage = godku;
  }

  void levelScreen() {
    fade();
  }

  void display()
  {
    defineDisplay();

    stroke(255);
    fill(0);
    rect(width*0.6, height*0.15, 400, 775);
    image(displayImage, width*0.6, height*0.16);

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

  void fade()
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
    } else
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
    switch(keyCode) {
    case DOWN:
      if (selectHandler < 3) {
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
      selectHandler = 1;
      back = true;
      break;

    default:
      break;
    }
  }

  void defineDisplay() {
    switch(selectHandler) {
    case 1:
      p2size = p3size = 40;
      p2color = p3color = 255;

      p1size = 50;
      p1color = #2CBEFF;
      displayImage = godku;
      break;
    case 2:
      p1size = p3size = 40;
      p1color = p3color = 255;

      p2size = 50;
      p2color = #2CBEFF;
      displayImage = blueku;
      break;
    case 3:
      p2size = p1size = 40;
      p2color = p1color = 255;

      p3size = 50;
      p3color = #2CBEFF;
      displayImage = mm.muiku;
      break;

    default:
      break;
    }
  }

  void defineSelection() {
    switch(selectHandler) {
    case 1:
      state = 10;
      break;
    case 2:
      break;
    case 3:
      break;

    default:
      break;
    }
  }
}
