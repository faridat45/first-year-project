//I imported grafica so that I am able to make the graphs
import grafica.*;
GPlot plot1;
GPlot plot2;
GPlot plot3;
//I created tables to store data here:
Table table;
Table table2;
Table table3;

//This code is from the link I refereced in line 172 to make the ocean waves.:
float time = 0; //created a float called time  here.

//import ddf.minim.analysis.*;
// import ddf.minim.*;
// Minim minim;
// AudioPlayer jingle;

//This is where I cretaed the variables to store all my images
/* I also created integers and floats for each of the images to
 store their corresponding x and y values*/

//the fish images and variables are here:
PImage fish;
int fish_x, fish_y ;
PImage fish1, fish1back;
float fish1_x, fish1_y, backfish1_x, backfish1_y;

//the seahorse images and variables are here
PImage seaHorse;
int horse_x, horse_y;

/*the image and variables for the rubbish floating
 in the water are in the next few lines*/
PImage crisps;
int crisps_x, crisps_y;
PImage bottle;
int bottle_x, bottle_y;
PImage wrapper;
int wrapper_x, wrapper_y;
PImage pBag;
int pBag_x, pBag_y, pBag2_x, pBag2_y;

//The clouds in the sky and their x and y values are made here.
PImage cloud;
int cloud_x, cloud_y;
PImage cloud1;
int cloud1_x, cloud1_y;
PImage cloud2;
float cloud2_x, cloud2_y;

void setup() {
  //I created a window size of width 600 and heigh 500(600*500)
  size(600, 500);
  //textureMode(NORMAL);
  //blendMode(BLEND);
  //noStroke();

  //Here I am loding the images into their PImage variables
  // All of the images are of the type .png
  fish = loadImage("fish.png");
  fish1 = loadImage("fish1.png");
  fish1back = loadImage("fish1back.png");
  seaHorse = loadImage("seaHorse.png");
  bottle = loadImage("bottle.png");
  crisps = loadImage("crispsWrapper.png");
  wrapper = loadImage("sweet1.png");
  pBag = loadImage("pBag.png");
  cloud = loadImage("Cloud.png");
  cloud1 = loadImage("Cloud.png");
  cloud2 = loadImage("Cloud.png");

  //here I am setting the x and y values of some of the variables:
  cloud_x = 600;// I set the x value of the first cloud to 600
  cloud1_x = 500; // I set the x value of the second cloud to 500
  cloud2_x = 280; // I set the x value of the third cloud to 280
  fish1_y = (int)random(200, 450); // here I let the programme choose a random value
  //between 200 and 450 for the y value of the fish

  fish_x = 580; // the initial x value for the fish is 580
  fish_y = (int)random(200, 450);// a random number between 200 and 450 is
  //chosen for the y value of another fish

  backfish1_y = (int)random(200, 450); //the y value is a random number between 200 and 450
  backfish1_x = 600; // the x value of the fish is 600
  horse_y = (int)random(200, 450); // the y value of the seaahorse is a random number betwee 200 and 450
  horse_x = -2; //The initial x value of the sea horse is -2

  //over here I used code from lab 5 part b to create the graphs:

  //creating the food wrappers(plot1) graph
  table = loadTable("crisps_stats.csv", "csv");  //loading in the CSV file
  GPointsArray points = new GPointsArray(table.getRowCount());
  for (TableRow row : table.rows())
  {
    float year = row.getFloat(0); //getting all of the points from the year column
    float count = row.getFloat(1); //getting all of the points from the count column
    points.add(year, count);  //adding the points to the list
  }

  plot1 = new GPlot(this); //here I am creating the first plot
  plot1.setPos(60, 0); // position of plot1
  plot1.setDim(350, 200); // this is the size of the graph
  plot1.setMar(60, 70, 40, 70);//the margin size is being set here
  plot1.setPointSize(5); // the diameter of each of the points is set here
  plot1.setTitleText("Amount of food wrappers in the ocean"); // title of the graph
  plot1.getXAxis().setAxisLabelText("Year"); //labelling the x axis
  plot1.getYAxis().setAxisLabelText("count (x million tons)"); //labelling the y axis

  plot1.setYLim(79, 148); //setting the range of values the
  //y axis is between 79 and 148
  plot1.setXLim(2011, 2022); //setting the range of years the
  //x axis is between 2011 and 2022
  plot1.setPoints(points);



  //creating the plastic bottles(plot2) graph
  table2 = loadTable("pbottle_stats.csv", "csv");  //loading in the CSV file
  GPointsArray points1 = new GPointsArray(table.getRowCount());
  for (TableRow row2 : table2.rows())
  {
    float year1 = row2.getFloat(0); //getting all of the points from the year column
    float count1 = row2.getFloat(1); //getting all of the points from the count column
    points1.add(year1, count1);  //adding the points to the graph
  }

  plot2 = new GPlot(this); // I am creating the second plot here
  plot2.setPos(60, 0); //I set the poition of the graph to (60,0) here
  plot2.setDim(350, 200); // I set the size of the graph to a width of 350 and a height of 200
  plot2.setMar(60, 70, 40, 70); //I set the margin size here
  plot2.setPointSize(5); // This is where the diameter of each point is set to 5
  plot2.setTitleText("Amount of plastic bottles in the ocean"); // Created the title of the graph
  plot2.getXAxis().setAxisLabelText("Year"); // Set the title of the X axis here
  plot2.getYAxis().setAxisLabelText("count (x million tons)");// I set the title of the Y axis here

  plot2.setYLim(12, 52); //This is the range of values for the y axis
  plot2.setXLim(2010, 2022); //this is the range of values for the x axis
  plot2.setPoints(points1);



  //creating a table for plastic bags (plot3) graph
  table3 = loadTable("plasticBagsStats.csv", "csv");  //loading in the CSV file
  GPointsArray points2 = new GPointsArray(table.getRowCount());
  for (TableRow row3 : table3.rows())
  {
    float year2 = row3.getFloat(0); //getting all of the points from the year column
    float count2 = row3.getFloat(1); //getting all of the points from the count column
    points2.add(year2, count2);  //adding the points to the list
  }

  plot3 = new GPlot(this);
  plot3.setPos(60, 0); // position of plot3
  plot3.setDim(350, 200); // this is the size that i have given to the graph. It has a width of 350 and a height of 200
  plot3.setMar(60, 70, 40, 70);//the margin size is placed here
  plot3.setPointSize(5); // the diameter of each of the points is given here
  plot3.setTitleText("Amount of plastic bags in the ocean"); // title of the graph
  plot3.getXAxis().setAxisLabelText("Year"); //I labelled the x axis here
  plot3.getYAxis().setAxisLabelText("count (x billion)"); //I labelled the y axis here

  plot3.setYLim(179, 850); //setting the range of values the
  //y axis is between 179 and 850
  plot3.setXLim(2010, 2022); //setting the range of years the
  //x axis is between 2010 and 2022
  plot3.setPoints(points2);
}

void draw() {
  background(187, 239, 253);

  // I got the code for the ocean surface here: https://funprogramming.org/38-Animate-the-ocean-surface-using-noise.html
  // in the original code the ocean was just black but I modified the code and changes the
  // colour to blue so that it would seem more realistic
  float x = 0;

  while (x < width) {
    line(x, 200 + 50 * noise(x / 100, time), x, height);
    x = x + 1;
    stroke(#6c96ff);
  }

  time = time + 0.02;

  /*  I wanted to add waves noise in the background and I did so in the commented code below.The project works for a
   few seconds but then after a while it gives an error saying OutOfMemoryError:Java heap space ,
   and I was unsure of how to fix this. */

  /*minim = new Minim(this);
   jingle = minim.loadFile("waves1.mp3");
   jingle.loop();*/



  /*over here I made it so that the x value of the
   cloud would be decreasing by 2 */
  cloud_x = cloud_x-2;
  cloud_y = 10;//I set the y value to 10
  image(cloud, cloud_x, cloud_y, 120, 90);  //I'm drawing the image of the cloud here
  if (cloud_x<-100)// Whenever the cloud passes the edge of the screen it returns back to the other end
  {
    cloud_x=600;
  }

  //The x value of this cloud decreases by 1 constantly
  cloud1_x = cloud1_x-1;
  cloud1_y = 20; // I set the y value to 20
  image(cloud1, cloud1_x, cloud1_y, 120, 90); //draws the 2nd cloud
  if (cloud1_x<-100)
  {
    //when the cloud moves off the screen it reappears
    cloud1_x=600;
  }

  //the x value decreases by 1.5
  cloud2_x = cloud2_x-1.5;
  cloud2_y = 35;// I set the y value to 35
  image(cloud2, cloud2_x, cloud2_y, 120, 90);//the third cloud is being drawn here
  if (cloud2_x<-100)
  {
    //the cloud is brought back onto the screen after it disappears
    cloud2_x=600;
  }


  bottle_x+=1.5;//increasing the value by 1.5
  bottle_y = 250;//set the value to 250
  if (bottle_x>600)
  {
    //brings back the bottle after it reaches the end of the screen
    bottle_x=-2;
  }

  image(bottle, bottle_x, bottle_y, 30, 80);//displays the image to the screen

  crisps_y = 320; // set the y value to 320
  crisps_x+=(int)random(1, 3); //chooses a random speed
  // the x value increases randomly
  if (crisps_x>600)
  {
    //once the crisps wrapper is removed from the
    //screen it is brought back to the start
    crisps_x=-10;
  }

  image(crisps, crisps_x, crisps_y, 50, 65);//illustrates the image



  wrapper_x+=1.5;//increasing the variable by 1.5
  if (wrapper_x>600)
  {
    //when the wrapper_x is greater than 600 it will go back to -10
    wrapper_x=-10;
  }
  wrapper_y = 450;//The value of wrapper_y is set to 450

  image(wrapper, wrapper_x, wrapper_y, 60, 75);//this part displays the image

  pBag_x+=2.75;//this variable increases by 2.75 continuouslt so that it can move across the screen
  pBag_y = 390; //i set the value of pBag_y to 390.
  if (pBag_x>600)
  {
    //when pBag_x is greater than 600 this code will be executed
    //the value of pBag_x will change to -10
    pBag_x=-10;
  }

  image(pBag, pBag_x, pBag_y, 60, 75);//the image is displayed


  pBag2_x = pBag2_x-2;// the value stored in fish_x decreases by 2 constantly
  pBag2_y=380;
  image(pBag, pBag2_x, pBag2_y, 50, 65);//the image is shown
  if (pBag2_x<-100)
  {
    //when the value of fish_x is less than -100 the value stored in this variable will change to 560
    // and a random number between 200 and 450 will be stored in fish_y
    pBag2_x=560;
  }





  fish_x = fish_x-2;// the value stored in fish_x decreases by 2 constantly
  image(fish, fish_x, fish_y, 80, 60);//the image is shown
  if (fish_x<-100)
  {
    //when the value of fish_x is less than -100 the value stored in this variable will change to 560
    // and a random number between 200 and 450 will be stored in fish_y
    fish_y = (int)random(200, 450);
    fish_x=560;
  }



  fish1_x+=2; // the value stored in fish1_x increases by 2 constantly
  if (fish1_x>600)
  {
    //when the value stored in fish1_x is greater than 600 it goes back to -29
    // and a random number between 200 and 450 is stored in fish1_y
    fish1_y = (int)random(200, 450);
    fish1_x=-20;
  }

  image(fish1, fish1_x, fish1_y, 80, 60);//the image is shown on the screen


  backfish1_x = backfish1_x-2.4;// the float stored in backfish1_x decreases by 2.4 constantly
  image(fish1back, backfish1_x, backfish1_y, 260, 160);//the image is presented on the screen
  if (backfish1_x<-100)
  {
    //when backfish1_x is less than -100 its value goes to 560
    //and backfish1_y is set to a ranom number between 200 and 450
    backfish1_y = (int)random(200, 450);
    backfish1_x=560;
  }

  //here I am creating the movement for the sea horse in my project
  horse_x+=3.1; // horse x is increasing by 3.1 all the time
  // but when the x value of the sea horse is greater 590
  // it will go back to down to -2
  if (horse_x>590)
  {
    //but this time the y value of the sea horse will change
    horse_y = (int)random(200, 450);//the programme chooses a random y value between 200 and 450
    horse_x=-2;
  }

  image(seaHorse, horse_x, horse_y, 80, 105);//the image is displayed on the screen


  // this is where I draw the graphs based on wheather the user has their mouse over the item.
  //I created an invisible box around each of the items in the water ind if the user places
  //their mouse over it the graph that I specified will appear.

  //the first if statements asks the programme if the mouse is over the crisps wrapper or the chocolate wrapper
  // If it is then the plot1 graph will appear
  if (mouseX >= crisps_x && mouseX<= crisps_x + 50 && mouseY <=crisps_y+50 && mouseY >=crisps_y || mouseX >= wrapper_x && mouseX<= wrapper_x + 50 && mouseY <=wrapper_y+50 && mouseY >=wrapper_y)
  {

    plot1.defaultDraw();
  }
  //this if statement checks if the mouse is over the plastic bottle
  // when the mouse is over the plastic botle plot2 will be displayed
  if (mouseX >= bottle_x && mouseX<= bottle_x + 50 && mouseY <=bottle_y+70 && mouseY >=bottle_y)
  {
    plot2.defaultDraw();
  }
  //in the code below the programme checks if the mouse is over the plastic bag in the water
  //when the user places the mouse over it this time plot3 is drawn.
  if (mouseX >= pBag_x && mouseX<= pBag_x + 50 && mouseY <=pBag_y+50 && mouseY >=pBag_y||mouseX >= pBag2_x && mouseX<= pBag2_x + 50 && mouseY <=pBag2_y+50 && mouseY >=pBag2_y)
  {
    plot3.defaultDraw();
  }
}
