import com.hamoid.*;
VideoExport videoExport;
String VIDEO_FILE_NAME = "cardSlider.mp4";

float xAxis = 0.00;
float yAxis = 0.00;
float zAxis = 0.00;
float edge = 150;

float FPS = 24;

void setup(){
  size(1280, 720, P3D);
  frameRate(FPS);
  
  // Start recording
  videoExport = new VideoExport(this, VIDEO_FILE_NAME);
  videoExport.setFrameRate(FPS);
  videoExport.startMovie();
}

void draw(){
  background(#0033FF);
  lights();
  
  // Draw sliders and rotating box
  drawSliders();
  
  // Save frame for video
  videoExport.saveFrame();
}

void drawSliders(){
  // X AXIS Slider
  fill(#FFFF00);
  textSize(90);
  text("X ", 513.35, 128.75);
  text(nf(xAxis, 1, 2), 642.9, 129.35); // Display formatted value
  noStroke();
  fill(#999999);
  rect(851, 206.4, 743.4, 52.8); // Slider background
  
  // Y AXIS Slider
  fill(#FFFF00);
  text("Y ", 512.7, 316.45);
  text(nf(yAxis, 1, 2), 629.7, 322.35); // Display formatted value
  noStroke();
  fill(#999999);
  rect(850.95, 394.25, 743.4, 52.8); // Slider background
  
  // Z AXIS Slider
  fill(#FFFF00);
  text("Z ", 515.25, 508.25);
  text(nf(zAxis, 1, 2), 634.75, 505.9); // Display formatted value
  noStroke();
  fill(#999999);
  rect(856.85, 578.15, 743.4, 52.8); // Slider background
  
  // X axis slider handler (constrained)
  fill(255);
  float xSliderPos = map(xAxis, -PI, PI, 868.5, 1500); 
  xSliderPos = constrain(xSliderPos, 868.5, 1500); // Constrain handle within slider background
  rect(xSliderPos, 206.35, 57.7, 48.1); 
  
  // Y axis slider handler (constrained)
  fill(255);
  float ySliderPos = map(yAxis, -PI, PI, 868.5, 1500);
  ySliderPos = constrain(ySliderPos, 868.5, 1500); // Constrain handle within slider background
  rect(ySliderPos, 395.1, 57.7, 48.1);
  
  // Z axis slider handler (constrained)
  fill(255);
  float zSliderPos = map(zAxis, -PI, PI, 868.5, 1500);
  zSliderPos = constrain(zSliderPos, 868.5, 1500); // Constrain handle within slider background
  rect(zSliderPos, 578.85, 57.7, 48.1);
  
  // Box to rotate
  fill(#CCCCCC);
  pushMatrix();
  translate(300, height / 2);
  rotateX(xAxis); // Rotate around X-axis
  rotateY(yAxis); // Rotate around Y-axis
  rotateZ(zAxis); // Rotate around Z-axis
  box(edge);
  popMatrix();
}

void mouseDragged(){
  // X axis slider interaction
  if (mouseY > 206 && mouseY < 206 + 48.1) {
    xAxis = map(constrain(mouseX, 868.5, 1500), 868.5, 1500, -PI, PI);
  }
  
  // Y axis slider container
  if (mouseY > 395 && mouseY < 395 + 48.1) {
    yAxis = map(constrain(mouseX, 868.5, 1500), 868.5, 1500, -PI, PI);
  }
  
  // Z axis slider container
  if (mouseY > 578 && mouseY < 578 + 48.1) {
    zAxis = map(constrain(mouseX, 868.5, 1500), 868.5, 1500, -PI, PI);
  }
}

void keyPressed(){
  if (key == 's') {
    videoExport.endMovie();
  }
}
