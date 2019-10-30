Particle [] a;
void setup()
{
	a = new Particle[300];
	for(int i = 0; i < a.length; i = i + 1) {
		a[i] = new Particle();
	}
	a[0] = new OddballParticle();
	size(500, 500);
}
void draw()
{
	background(150);
	fill(0);
	ellipse(250, 250, 70, 50);
	for(int i = 0; i < a.length; i = i + 1) {
		a[i].move();
		a[i].show();
	}
}
class Particle
{
	double myX, myY, myAngle, mySpeed, mySize;
	int myColor;

	Particle() {
		mySize = 5;
		myX = myY = 250;
		myAngle = Math.random() * (2 * Math.PI);
		mySpeed = Math.random() * 15;
		myColor = color((int)(Math.random() * 256), (int)(Math.random() * 256), (int)(Math.random() * 256), (int)(Math.random() * 150) + 50);
	}
	void move() {
		myX = myX + (Math.cos(myAngle) * mySpeed);
		myY = myY + (Math.sin(myAngle) * mySpeed);
		mySize = mySize + 0.08;

		if(myX > 500 || myX < 0 || myY > 500 || myY < 0) {
			myX = 250;
			myY = 250;
			mySize = 5;
		}
	}
	void show() {
		fill(myColor);
		noStroke();
		ellipseMode(CENTER);
		ellipse((float)myX, (float)myY, (float)mySize, (float)mySize);
		if(mySize > 30) {
			fill(0);
			ellipse((float)myX - 5, (float)myY, 5, 10);
			ellipse((float)myX + 5, (float)myY, 5, 10);
			stroke(0);
			strokeWeight(2);
			line((float)myX + 3, (float)myY + 10, (float)myX - 3, (float)myY + 10);
			text("Boo", (float)(myX + (mySize / 2)), (float)(myY));
		}
	}
}
 
class OddballParticle extends Particle
{
	OddballParticle() {

	}
	void move() {
		myX = myX + (int)(Math.random() * 5) - 2;
		myY = myY + (int)(Math.random() * 5) - 2;
	}
	void show() {
		noStroke();
		rectMode(CENTER);
		fill(myColor);
		rect((float)myX, (float)myY, 50, 50);
	}


}
