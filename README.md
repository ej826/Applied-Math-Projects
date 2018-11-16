# Applied-Math-Projects

This folder will contain MATLAB files that I worked along with Aubrey Hormel (ahbyda) and Bethany Morgan.

From Project 1:
The file "bezier.m" contains a bezier function with the input control points and will plot the Bezier curve accordingly. The inputs of this programs will create an n x 8 matrix, where each row consists of the coordinates of the four control points of each piece fo the curve. The file was used to create the file "R.pdf" with points given by in the book "A First Course in Applied Mathematics" written by Jorge Rebaza (Figure 1.13 on page 68).
The file "heart.m" contains a heart function with no input. It copies the the "bezier.m" file, but it already has preset inputs inorder to create the heart. This file will also plot the a graph of the heart. The file "heart.pdf" is the output of this function.
the file "pwr.m" contains the power method function at a particular H matrix that we applied. However it would be easy to make the H matrix changeable. Also the inital vector starts at 1. 
The file "usermat.m" lists the 10 highest ranking pages along with their ranks using the "usermat.mat" (contains 2 subfile: 'stanford' is a matrix of 281,903 x 281,903 and 'a' is a 281,903 x 1 matrix) in descending order by using the power method.
The file "googleTwitter.m" uses the file "twitter.m" which also uses "msutweets.mat" (contains a subfile: tweets is a 2308 x 2 cell matrix which has the person who sent the tweet in the first column and the person they tweeted at in the second column realted to the phrase 'missouristate') which uses the power method to rank the users and displays the 10 highest ranking users along with their ranks.
The file "monopoly.m" contains the probability of where you will land on a Monopoly board the most. A Monopoly board has 40 squares. There's a matrix H that has entries H(i, j) the represents the probability of moving from square j to square i on one roll of the dice. Then we use the power method to rank the squares in order of the most likely to be landed on in the long run.

From Project 2:
The file "QR_Algo.m" contains a function to execute the QR Algorithm.
The file "SVD.m" uses Singular Value Decomposition (SVD) to construct a tank-6 approximation of the matrix. This file also uses the 'monopoly(1).mat' which contains the probabilities of moving from one square on a Monopoly board to another. Then the file also uses the power method to both the original matrix and teh approximation and compares the two different rankings.
The file "shakespear.m" constructs a query using four words from the 'dictionary' (which is in the 'shake.mat' file) and returns all relevant documents. Then it also constructs a rank-10 approximation of the Term Document Matrix.
The file "leastsquares.m" uses the method of least squares to find the line y=mx+b that best fits the data for linear regression. Then for cubic regression, it uses least squares to find the cubic polynormail y=ax^3+bx^2+cx+d that best fits the data. For exponential regression, it uses least squares method to find the exponential function y=Ce^(kx) that best fits the data. Then plots the three functions on the same graph with the original points.

From Project 3:

