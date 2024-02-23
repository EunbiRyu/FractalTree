private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .7;  
public void setup() 
{   
  size(640,480);    
  noLoop(); 
} 
public void draw() 
{   
  background(0);   
  stroke(255);   
  line(320,480,320,410);   
  drawBranches(320, 410, 90, 3*Math.PI/2);  //will add later 
  
  //if(mousePressed == true){
  //  int y1 = (int)(Math.random()*100)+400;
  //  int y2 = y1-50;
  //  line(320,y1,320,y2);   
  //  drawBranches(320, y2, 85, 3*Math.PI/2);
  //}
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
  double angle1 = angle + branchAngle;
  double angle2 = angle - branchAngle;
  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);
  stroke((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255)); 
  line(x,y,endX1,endY1);  
  stroke((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255)); 
  line(x,y,endX2,endY2);  
  branchLength *= fractionLength;
  if(branchLength > smallestBranch){
    drawBranches(endX1, endY1, branchLength, angle1);
    drawBranches(endX2, endY2, branchLength, angle2);
  }
} 
