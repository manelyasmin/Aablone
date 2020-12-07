class homePage{

boolean pvp=false,pvi=false,iaia=false,brule=false,bexit=false;
boolean machinevsmachine=false,pcii=false,beginGame=false;
Button b,b1,b2,b3 ,b4,b5,b6;
PImage img,img1;
HumanVsHuman hum;
HumVsIa hum1;
IaVsIa IAVSIA;
MachineVsMachine machine;
Rules rules;

void setup() {
img=loadImage("bk.jpg");
 background(0);
  board=new Board(395,355);
  hum1=new HumVsIa();
  hum=new HumanVsHuman();
  IAVSIA=new IaVsIa();
  machine=new MachineVsMachine();
  rules= new Rules();
  img=loadImage("button3.png");

  //******** abalone shape
  textSize(70); text("AbaLone",540,300);fill(0);stroke(255);
 hexagone(450,280,60,6);fill(255);stroke(0); hexagone(450,280,50,6);fill(0);stroke(255); hexagone(450,280,40,6);fill(0);stroke(255); hexagone(450,280,30,6);
  //***************************
 textSize(20);

  b=new Button(100,500,200,80,50,color(255),"HUMAN VS HUMAN" ,110,550);
  b1=new Button(500,500,200,80,50,color(255),"HUMAN VS IA" ,530,550);
  b2=new Button(900,500,200,80,50,color(255),"IA VS IA" ,960,550);
  b4=new Button(500,650,200,80,50,color(255),"Rules" ,570,700);
  b5=new Button(900,650,200,80,50,color(255),"Exit" ,980,700);
  b6=new Button(100,650,200,80,50,color(255),"MachineVsMachine" ,110,700);





  }
void draw() {
 if(!beginGame && !b.clicked() && !b1.clicked() && !b2.clicked() && !b4.clicked() && !b5.clicked() && !b6.clicked()){
 
b.drag();
b1.drag();
b2.drag();
b4.drag();
b5.drag();
b6.drag();}
if(iaia){ IAVSIA.Display();pvp=false;brule=false;pvi=false;machinevsmachine=false;bexit=false;  println("entrez");}

if(machinevsmachine) {machine.Display();brule=false;pvp=false;pvi=false; iaia=false;bexit=false;}

}

void mousePressed() {
 
  if(!pvp && !pvi && !iaia && !machinevsmachine && !brule && !bexit)
  {
 if(b.clicked()){beginGame=true;bexit=false;brule=false;pvp=true;pvi=false;iaia=false;machinevsmachine=false;hum.setup();}
if(b1.clicked()){beginGame=true;bexit=false;brule=false;pvp=false;iaia=false;pvi=true;machinevsmachine=false;pcii=false;hum1.setup();}
if(b2.clicked()){beginGame=true;bexit=false;brule=false;iaia=true;pvp=false;pvi=false;machinevsmachine=false;IAVSIA.setup();}
if(b6.clicked()){beginGame=true;bexit=false;brule=false;machinevsmachine=true;iaia=false;pvp=false;pvi=false;machine.setup();}
 if(b5.clicked()) {beginGame=true;bexit=true;exit();}
  if(b4.clicked()){beginGame=true;brule=true;bexit=false;rules.setup();}
}
if(pvp){beginGame=true;bexit=false;brule=false;pvi=false;iaia=false; hum.mousePressed();hum.DisplayHum();}
if(pvi) {beginGame=true;bexit=false;brule=false;pvp=false;iaia=false;hum1.mousePressed();hum1.Display();}
if(brule){beginGame=true;bexit=false;rules.mouseClicked();pvp=false;pvi=false;machinevsmachine=false;iaia=false;}

}

}
