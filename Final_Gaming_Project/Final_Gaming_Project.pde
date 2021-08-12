/*-------------------------------------------------------------------
states: 
  0 - Main Menu
  1 - Play
    10 - Phase 1 
    11 - Phase 2 
    12 - Phase 3
  2 - Help
  3 - Options
    30 - Controls
    31 - Credits
  4 - Exit
-------------------------------------------------------------------*/
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

mainMenu mm;
options o;
Exit e;
Play p;
Phase_1 ph1;
player1 one;
player2 two;
phase1 godphase;
phase2 bluephase;
int fade, state;
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
  p = new Play();
  ph1 = new Phase_1();
  o = new options();
  godphase = new phase1();
  bluephase = new phase2();
  attackNotActive = false;
  state = 0;
  textSize(25);
  fullScreen();
}

void draw()
{
  FSMdisplay();
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
  FSMcontrols();
}

void keyReleased()
{
  //if (state == 2.2 && godphase.health > 0)
  //{
  //  one.moving(key, false);
  //  two.moving(keyCode, false);
  //} else if (state == 2.3)
  //{
  //  one.moving(key, false);
  //  two.moving(keyCode, false);
  //}
}
