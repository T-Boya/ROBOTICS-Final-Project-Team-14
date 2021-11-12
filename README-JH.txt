README for team 14 robotics 1 dobot project, wirtten by John Healey

The code in this branch does 2 things.

1) elstablishes connection and creates functions for read data and writing data to the dobot.
2) Simulating dobot using kinmatics in MATLAB, which infomraiton can be fed from the MATLAB to the real robot.

there are several progams and fucntions used to do this. 

dobotinit.m intializes both the serial connection and matlab model of the robot. 
dobotik.m is a function that takes in a robot object and computes the angles needed to get to the desired point.
q2ang.m taken in the joint angles and outputs the motor angles for the robot. 
setdobotangles.m sets the joint angles output by dobotik to the robot (uses q2ang.m)
readdobotangles.m reads the angles from the dobot