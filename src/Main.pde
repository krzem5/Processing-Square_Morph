final int TOTAL_VERT=40;
final int TOTAL_STEP=20;



ArrayList<PVector> square=new ArrayList<PVector>();
ArrayList<PVector> circle=new ArrayList<PVector>();
ArrayList<PVector> verts=new ArrayList<PVector>();
boolean st=true;



void setup(){
	size(500,500);
	for (int a=0;a<360;a+=360/TOTAL_VERT){
		PVector v=PVector.fromAngle(radians(a-135));
		v.mult(100);
		circle.add(v);
	}
	for (int x=-50;x<50;x+=100/(TOTAL_VERT/4)){
		PVector v=new PVector(x,-50);
		square.add(v);
	}
	for (int y=-50;y<50;y+=100/(TOTAL_VERT/4)){
		PVector v=new PVector(50,y);
		square.add(v);
	}
	for (int x=50;x>-50;x-=100/(TOTAL_VERT/4)){
		PVector v=new PVector(x,50);
		square.add(v);
	}
	for (int y=50;y>-50;y-=100/(TOTAL_VERT/4)){
		PVector v=new PVector(-50,y);
		square.add(v);
	}
	for (int i=0;i<TOTAL_VERT;i++){
		verts.add(new PVector());
	}
}



void draw(){
	background(45);
	float dst=0;
	for (int i=0;i<TOTAL_VERT;i++){
		PVector t;
		if (st){
			t=circle.get(i);
		}
		else{
			t=square.get(i);
		}
		PVector v=verts.get(i);
		v.lerp(t,1.0/TOTAL_STEP);
		dst+=PVector.dist(t,v);
	}
	if (dst<=0.5){
		st=!st;
	}
	translate(width/2,height/2);
	strokeWeight(4);
	beginShape();
	noFill();
	stroke(255);
	for (PVector v:verts){
		vertex(v.x,v.y);
	}
	endShape(CLOSE);
}
