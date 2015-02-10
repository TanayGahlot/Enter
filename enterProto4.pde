//oggpnosn
//hkhr 

//oggpnosn 
//hkhr 

//proto1 : storytelling ENTER

/* --------------------------------------------------------------------------
 * SimpleOpenNI User3d Test
 * --------------------------------------------------------------------------
 * Processing Wrapper for the OpenNI/Kinect 2 library
 * http://code.google.com/p/simple-openni
 * --------------------------------------------------------------------------
 * prog:  Max Rheiner / Interaction Design / Zhdk / http://iad.zhdk.ch/
 * date:  12/12/2012 (m/d/y)
 * ----------------------------------------------------------------------------
 */
 

import ddf.minim.*;
import processing.video.*;
import gab.opencv.*;

Capture video;
OpenCV opencv;
AudioPlayer player;
Minim minim;//audio context


float standardDelay = 1.5;
int state;
float detecterRadius = 50, pointerRadius = 40;
PImage  img; 

int dimensionx = 1024, dimensiony = 768;

float displacement = (float) dimensionx;


void setup()
{
  size(dimensionx, dimensiony); // strange, get drawing error in the cameraFrustum if i use P3D, in opengl there is no problem
  
  video = new Capture(this, dimensionx, dimensiony);
  opencv = new OpenCV(this, dimensionx, dimensiony);
  state = 2;  
  img = loadImage("Image1.png");
  image(img, 0, 0);
 
  video.start(); 
 
  stroke(255,255,255);
  smooth();  

}

int checkChoice(int userid, int x1, int y1, int x2, int y2, int x3, int y3){
  float x0, y0;
  PVector jointpos1 = opencv.max();
  x0 = displacement - jointpos1.x;
  y0 = jointpos1.y;
  circle(x0, y0, pointerRadius);
    
    if(pow(x0 - x1, 2) + pow(y0 - y1, 2) < pow(detecterRadius, 2)){
      if(sameAs(x0, y0, x1, y1))
        return 1;  
    }
    else if (pow(x0 - x2, 2) + pow(y0 - y2, 2) < pow(detecterRadius, 2)){
      if(sameAs(x0, y0, x2, y2))
        return 2;
    }
    else if (pow(x0 - x3, 2) + pow(y0 - y3, 2) < pow(detecterRadius, 2)){
      if(sameAs(x0, y0, x3, y3))
        return 3;
    }
  
  return -1;
}

boolean sameAs(float x0, float y0 ,float x, float y){;
  float score = sleep(standardDelay, x, y);
  if(score > .75)
   return true;
  else 
   return false; 
  //return true;
}  
  
int checkChoice(int userId, int x1, int y1, int x2, int y2){
  float x0, y0;
  PVector jointpos1 = opencv.max();
  x0 = displacement - jointpos1.x;
  y0 = jointpos1.y;
  circle(x0, y0, pointerRadius);  
  
    if(pow(x0 - x1, 2) + pow(y0 - y1, 2) < pow(detecterRadius, 2)){
      if(sameAs(x0, y0, x1, y1))
        return 1;  
    }
    else if (pow(x0 - x2, 2) + pow(y0 - y2, 2) < pow(detecterRadius, 2)){
      if(sameAs(x0, y0,
      x2, y2))
        return 2;
    }
    
  
  return -1;
}

int checkChoice(int userid, int x1, int y1){
  float x0, y0;
  PVector jointpos1 = opencv.max();
  x0 = displacement - jointpos1.x;
  y0 = jointpos1.y;
  circle(x0, y0, pointerRadius);   
    
    if(pow(x0 - x1, 2) + pow(y0 - y1, 2) < pow(detecterRadius, 2)){
      if(sameAs(x0, y0, x1, y1))
        return 1;  
    }
  
  return -1;
}

void updateState(int choice, int s1, int s2, int s3){
  if(choice == 1)
    state = s1;
  else if(choice == 2)
    state = s2;
  else if(choice == 3)
    state = s3;
}

void updateState(int choice, int s1, int s2){
  if(choice == 1)
    state = s1;
  else if(choice == 2)
    state = s2;

}


void updateState(int choice, int s1){
  if(choice == 1)
    state = s1;

}

void draw()
{
  
  video.read();
  opencv.loadImage(video);
 
  int choice;
  
  
      img = loadImage("Image" + state + ".png");
      image(img, 0, 0);
      if(state == 1){
        choice = checkChoice(1, 951, 150);  //                    here, add values!
        updateState(choice, 2);
      }
      else if( state == 2){
        choice = checkChoice(1, 378, 251, 871, 251, 602, 251);  //                    here, add values!
        updateState(choice, 3, 9, 13);
      }
      else if( state == 3){
        choice = checkChoice(1, 886, 150);  
        updateState(choice,  4 );
      }
      else if( state == 4){
        choice = checkChoice(1, 886, 150);                     
        updateState(choice,  5);
      }
      else if( state == 5){
        choice = checkChoice(1, 378, 251, 871, 251, 602, 251);  
        updateState(choice,  6, 10, 14);
      }
      else if( state == 6){
        choice = checkChoice(1, 886, 150);  
        updateState(choice,  7);
      }
      else if( state == 7){
        choice = checkChoice(1, 886, 150);  
        updateState(choice, 8);
      }
      else if( state == 8){
        choice = checkChoice(1, 886, 150);  
        updateState(choice,  18);
      }
     
      else if( state == 9){
        choice = checkChoice(1, 886, 150);  //                    here, add values!
        updateState(choice,  5);
      }
      else if( state == 10){
        choice = checkChoice(1,886, 150);  //                    here, add values!
        updateState(choice,  11);
      }
      else if( state == 11){
        choice = checkChoice(1, 886, 150);  //                    here, add values!
        updateState(choice,  12);
      }else if( state == 12){
        choice = checkChoice(1, 886, 150);  //                    here, add values!
        updateState(choice,  19);
      }
      else if( state == 13){
        choice = checkChoice(1, 886, 150);  //                    here, add values!
        updateState(choice,  5);
      }
      else if( state == 14){
        choice = checkChoice(1, 886, 150);  //                    here, add values!
        updateState(choice,  15);
      }
      else if( state == 15){
        choice = checkChoice(1, 886, 150);  //                    here, add values!
        updateState(choice,  16);
      }
      else if( state == 16){
        choice = checkChoice(1, 886, 150);  //                    here, add values!
        updateState(choice,  17);
      }
      else if( state == 17){
        choice = checkChoice(1, 886, 150);  //                    here, add values!
        updateState(choice,  20 );
      }
      else if( state == 18){
        choice = checkChoice(1, 886, 150);  //                    here, add values!
        updateState(choice,  18 );
      }
      else if( state == 19){
        choice = checkChoice(1, 886, 150);  //                    here, add values!
        updateState(choice,  18 );
      }
      else if( state == 20){
        choice = checkChoice(1, 886, 150);  //                    here, add values!
        updateState(choice,  18 );
      }  
        
}

// draw the skeleton with the selected joints


float sleep(float duration, float x, float y){
  //input: seconds 
  int time = millis();
  float count = 0, hit = 0 ; 
  float x0, y0;
  while(true){
    video.read();
    opencv.loadImage(video);
    PVector loc = opencv.max();
    x0 = displacement - loc.x; y0 = loc.y;
    if(pow(x0 - x, 2) + pow(y0 - y, 2) < pow(detecterRadius, 2))
      hit += 1;
    count += 1;  
    circle(x0, y0,  pointerRadius); 
    if(millis() - time > duration*1000)
      break;
  }
  return (float)hit/count;
}

void realSleep(float duration){
  //input: seconds 
  int time = millis();
  while(true){
    if(millis() - time > duration*1000)
      break;
  }
}

void circle(float x, float y, float r){
  ellipse(x, y, r, r);
}







