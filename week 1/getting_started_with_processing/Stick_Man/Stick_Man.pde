void setup() {

   size(600,600); // sets the size of the window

   ellipse(300,100,100,100); // draws the head

   line(300,150,300,300); // draws the body

   line(300,300,250,400); // draws the left leg

   line(300,300,350,400); // draws the right leg

   line(300,225,250,150); // draws the left arm

   line(300,225,350,150); // draws the right arm

   ellipse(285,85,10,10); // draws the left eye

   point(285,85); // draws the left pupil

   ellipse(315,85,10,10); // draws the right eye

   point(315,85); // draws the right pupil

   line(280,120,320,120); // draws the mouth

   text("Stick Man", 280,420); // writes "Stick Man" underneath the stick man

}
