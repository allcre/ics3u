void setup() {

  size(300, 300);

  int x, y, wid, ht;//declares four integer variables

  color purple; //declares a variable to store a                 

  //colour



  //assign values to the variables

  x = 150;

  y = 200;

  wid = 75;

  ht = 100;



  purple = color(#B124B2);




  //use variables to draw an ellipse

  fill (purple);

  ellipse(x, y, wid, ht);




  /*add code below to reassign the four integer variables to
   
   new values so that the second ellipse is drawn in a different location
   
   with a different size*/
   
   x = 50;
   y = 70;
   wid = 30;
   ht = 90;



  ellipse(x, y, wid, ht);
}
