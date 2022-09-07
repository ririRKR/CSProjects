function setup(){
  createCanvas(400,400);
}


function draw(){
  background(0);
  fill(mouseX, mouseY, mouseX-mouseY);
  circle(mouseX, mouseY, mouseX-mouseY);
}
