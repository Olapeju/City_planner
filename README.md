# City_planner
An IOS application that helps plan how a city can be structured.


DESCRIPTION

A governor of a state that contains 4 cities is tasked with a decision to place a garbage processing facility within the state. It is known that no one wants a garbage processing facility next to where they live. Therefore, the closer the facility is to you, the unhappier you will be.

Given that the governor would like to be re-elected, he/she doesn't want their constituents to be unhappy, yet the facility must be placed somewhere in the state. Therefore, the task of the governor is to place this facility somewhere such that the unhappiness of the state is minimized.

The good news is that the state is actually a very simple, 25x25 square miles area and it contains 4 cities only.

Method:
Assume each city is located in an integer-pair (x, y) valued location within a 25 x 25 square mile area. For example, a city can be located at (4, 19), but not at (4.5, 19.8). In other words, there are no real valued coordinate for a location of a city.

Your program will consider each integer-pair valued location within the area as a possible site for the garbage facility, starting at (1, 1) and continuing across each row until the final site (25, 25) is reached.

At each possible location for the garbage facility, your program will compute the average unhappiness if the facility were located there. The following two rules will be used to compute the unhappiness for a city.

1)	 If the facility is within two miles or less of a city, the unhappiness is infinite (that is, assign a very large number to the unhappiness for that city).
2)	 Otherwise, the unhappiness is equal to the population of the city divided by the distance of the facility from the city.

      The average unhappiness equals:

      Avg. Unhappiness = Sum of the unhappiness of 4 cities /
                          The total state's population.

Your program should select the site at which the average unhappiness is smallest.

Requirements:
You are to design and develop a universal iOS app that helps the governor in this decision. The app should run on both iPhones and iPads, and must use auto-layout. Your app must MVC compliant as well to receive credit. 

Running the App:
Immediately the app should display a welcome message and a button to say start. Once the button is pushed, it, along with the welcome message will disappear, and 8 labeled text boxes with 8 steppers next to them should be displayed on the screen. The stepper values should be between 1 and 25 and they should wrap around and auto repeat. The text boxes and the stepper next to them are for entering the values for each city's location (x, and y). Initial value for the stepper and the text boxes should be 1 for all 8 values. You may modify the locations by either clicking on the stepper or entering the correct value in integer format in the text box.

Under each location objects, there should be a labeled text box that has a slider next to it. These represent the city's population in thousands with an initial value of 1 indicating each city has 1000 people. You may modify the population using either the text box or the slider. Slider values can be between 1 and 100 inclusive.

In addition, there should be two buttons, the first button labeled "Compute", and the other is labeled "Reset". Upon clicking the reset button, all values for each city's location and population should go back to their default values mentioned above. Upon clicking Compute, all the objects on the screen will disappear and a label showing the location of the garbage facility should display the correct location. Along with the location, an image of a garbage processing facility should display on the screen.

In addition, a button should also appear on the screen, and upon clicking it, the label, the image and the button itself will disappear and you should be able now to re-enter the information or modify it to be able to re-compute the location of the garbage facility.

Your program must look as clean as possible, and must have a professional feel to it as much as possible.

