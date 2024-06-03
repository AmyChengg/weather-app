# Weather App
Weather app created from Dart to show the weather in a specific location.

## Resources Used

I used Google Fonts to find icons for each weather condition. I also used dart.dev for understanding most of the Dart language syntax. 

### New Learnings

I learned how to write switch expressions to switch the colors and texts based on weather condition. It was similar to if/else case. Another thing I learned was that the provider isn't where I should put my code in for updating the app. For instance, I initially added code for the UI in the provider, but the code should be in live_weather instead.

## Challenges

A challenge I had was typing certain expressions. For example, I searched through the flutter documentation for switch expressions, and there were more than one way to write them. There were also examples of switch statements, which is not what this project needed, but I almost wrote in switch statements because I wasn't sure which form is the correct one to use. For future years, this assignment can hint at what is the correct expression form to use. 

Another challenge doing this assignment was understanding how to instantiate a WeatherProvider for our Consumer<WeatherProvider> to get updates from. I didn't know where to add the given code to, so I kept inserting it in live_weather's build method. I learned that I have to read each word carefully so I don't miss any information. It turns out I have to insert that code portion in main.dart.

### Mistakes

One mistake I made was changing a file that I shouldn't have changed. There was an error for my IconData, so VSCode prompted me to add two positional arguments to IconData. Later, I realized that it was unncessary to add more arguments because my other code started breaking and asking for the expected arguments. It took me 7 hours to realize what I did wrong, and fix it so my code can run. As a result of this mistake, I will not follow VSCode to fix my errors in the future, because that can potentially cause new errors.

### Acknowledgements
This is an assignment from the University of Washington course, CSE340 Interaction Programming, offered in Spring 2024.
