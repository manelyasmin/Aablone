public class Rules{
String str;
int i=1;
ArrayList<PImage> lprules;
Button b;
void setup(){
lprules=new ArrayList<PImage>();
background(25);
b=new Button(900,700,200,80,50,color(255));fill(0); text("Next",900,700); b.show();

str=" How To Play ?";
lprules.add(loadImage("rules/cap1.png"));
lprules.add(loadImage("rules/cap2.png"));
lprules.add(loadImage("rules/cap3.png"));
lprules.add(loadImage("rules/cap4.png"));
lprules.add(loadImage("rules/cap5.png"));

}

void mouseClicked(){
  textSize(25);
 background(25); 
  fill(255);
  text(str,100,30);
  b.show();
 fill(0);text("Next",980,750); 
 image(lprules.get(0),100,40);
PImage img;

if(i < lprules.size() && b.clicked()){
{println("clic");
 background(25); 
  fill(255);
  text(str,100,30);
  b.show();
 fill(0);
 text("Next",980,750); 
img=lprules.get(i);
 image(img,100,40);
  i++;
}
}
if(i>=lprules.size())
 i=1;

}


}
