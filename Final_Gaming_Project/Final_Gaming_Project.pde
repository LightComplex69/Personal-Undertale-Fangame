import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

mainMenu mm;
options o;
player1 one;
player2 two;
phase1 godphase;
phase2 bluephase;
Exit e;
ph1d p;
float state;
int fade;
boolean attackNotActive;
PVector l, s;
PImage fist, kick, arrows;
PImage[] kameF, goBlue; 

Minim minim;
AudioInput input;
AudioPlayer menusong, ingamesong, gameover, kameDamage, punchDamage, kickDamage, select, movemenu, kameCharge, kameBlast, gokuSpeak;

void setup()
{
  minim = new Minim(this);
  movemenu = minim.loadFile("movemenu.wav");
  punchDamage = minim.loadFile("punchDamage.wav");
  kickDamage = minim.loadFile("kickDamage.wav");
  kameDamage = minim.loadFile("kameDamage.wav");
  select = minim.loadFile("select.wav");
  gokuSpeak = minim.loadFile("gokuspeak.wav");
  ingamesong = minim.loadFile("ingamesong.mp3");
  input = minim.getLineIn();

  arrows = loadImage("arrows.png");

  fist = loadImage("fistUp.png");
  kick = loadImage("kick.png");
  kameF = new PImage[13];
  kameF[0] = loadImage("kame1.png");
  kameF[1] = loadImage("kame2.png");
  kameF[2] = loadImage("kame3.png");
  kameF[3] = loadImage("kame4.png");
  kameF[4] = loadImage("kame5.png");
  kameF[5] = loadImage("kame6.png");
  kameF[6] = loadImage("kame7.png");
  kameF[7] = loadImage("kame8.png");
  kameF[8] = loadImage("kame9.png");
  kameF[9] = loadImage("kame10.png");
  kameF[10] = loadImage("kame11.png");
  kameF[11] = loadImage("kame12.png");

  goBlue = new PImage[10];
  goBlue[0] = loadImage("blue_transformation1.png");
  goBlue[1] = loadImage("blue_transformation2.png");
  goBlue[2] = loadImage("blue_transformation3.png");
  goBlue[3] = loadImage("blue_transformation4.png");
  goBlue[4] = loadImage("blue_transformation5.png");
  goBlue[5] = loadImage("blue_transformation6.png");
  goBlue[6] = loadImage("blue_transformation7.png");
  goBlue[7] = loadImage("blue_transformation8.png");
  goBlue[8] = loadImage("blue_transformation9.png");
  goBlue[9] = loadImage("blue_transformation10.png");

  one = new player1(width*0.2, height*0.75, 4, 4);
  two = new player2(width*0.8, height*0.75, 4, 4);
  l = new PVector(width/4, height/3);
  s = new PVector(3,2);
  mm = new mainMenu();
  e = new Exit();
  p = new ph1d();
  o = new options();
  godphase = new phase1();
  bluephase = new phase2();
  attackNotActive = false;
  state = 2.2;
  textSize(25);
  size(1920, 1080);
}

void draw()
{

  if (!mm.stopSelection && state == 0)
  {
    mm.selectScreen();
  } else if (state == -1)
  {
    e.exitGame();
  } else if (state == 3)
  {
    o.selectScreen();
    o.fadeBack();
  } else if (mm.optionsSelected && mm.stopSelection)
  {
    o.fadeIn();
  } else if (state == 3.1)
  {
    o.credits();
  } else if (state == 3.2)
  {
    o.controls();
  } else if (mm.playSelected && mm.stopSelection)
  {
    p.fadeIn();
    p.phaseSelection();
    p.fadeBack();
  } else if (p.forward)
  {
    p.phaseFade();
  } else if (state == 2.1)
  {
    p.introText();
  } else if (state == 2.2)
  {
    if (!godphase.phasePassed && godphase.health > 0)
    {
      background(0);
      one.movement();
      two.movement();

      godphase.firstAttack();

      noStroke();
      fill(50);
      rect(0, 0, width, height*0.6+15); // top rectangle
      rect(0, 0, width*0.05+15, height);  // left side rectangle
      rect(width*0.65+585, 0, width, height);  // right side rectangle
      rect(0, height*0.6+335, width, height);  // bottom rectangle
      rect(width*0.05+585, height*0.6, width*0.65-(width*0.05+570), 350);  // middle rectangle

      godphase.goku();
      godphase.playBoxes();
      godphase.kamehameha();
      godphase.healthBar();
    }
    godphase.phaseDone();
    godphase.transform();
    gameOver();
  } else if (state == 2.3)
  {
    background(0);

    one.movement();
    two.movement();


    noStroke();
    fill(50);
    rect(0, 0, width, height*0.6+15); // top rectangle
    rect(0, 0, width*0.05+15, height);  // left side rectangle
    rect(width*0.65+585, 0, width, height);  // right side rectangle
    rect(0, height*0.6+335, width, height);  // bottom rectangle
    rect(width*0.05+585, height*0.6, width*0.65-(width*0.05+570), 350);  // middle rectangle

    bluephase.firstAttack();
    bluephase.goku();    
    bluephase.playBoxes();
    bluephase.healthBar();
  } else if (mm.stopSelection && mm.exitSelected) 
  {
    e.prompt();
    e.areYouSure();
  }

  println(godphase.health);
}

boolean gameOver()
{
  
  if (godphase.health <= 0)
  {
    fill(0, fade);
    rect(0, 0, width, height);
    if(fade >= 150)
    {
      fade += 0;
      
      textSize(50);
      fill(255,0,0);
      text("Game Over", l.x, l.y);
      
      if(l.x >= width*0.7 || l.x <= width*0.2)
      {
       s.x *= -1; 
      }
      if(l.y >= height*0.5 || l.y <= height*0.1)
      {
       s.y *= -1; 
      }
      l.add(s);
    }else
    {
     fade += 1; 
    }
    return true;
  } else
  {
    return false;
  }
}

void keyPressed()
{
  if (!mm.stopSelection && state == 0)
  {
    mm.selectionControls();
  } else if (mm.stopSelection && mm.exitSelected)
  {
    e.areYouSureSelection();
  } else if (mm.stopSelection && mm.playSelected)
  {
    p.phaseSelectControls();
  } else if (state == 2.1)
  {
    p.confirmation();
  } else if (state == 2.2)
  {
    one.moving(key, true);
    two.moving(keyCode, true);
    godphase.yes();
  } else if (state == 2.3)
  {
    one.moving(key, true);
    two.moving(keyCode, true);
  } else if (state == 3)
  {
    o.selectControls();
  } else if (state == 3.1)
  {
    o.creditBackout();
  } else if (state == 3.2)
  {
    o.controlBackout();
  }
}

void keyReleased()
{
  if (state == 2.2 && godphase.health > 0)
  {
    one.moving(key, false);
    two.moving(keyCode, false);
  } else if (state == 2.3)
  {
    one.moving(key, false);
    two.moving(keyCode, false);
  }
}
