# Weather App TASK

A PowerShell script to fetch and display a 5-day weather forecast for a specified city using the OpenWeatherMap API. The script retrieves the API key from an external database/API's.

## Features
- Fetches a 5-day weather forecast.
- Supports city names in both Bulgarian(Cyrilic) and English. Other Languanges are not test! 
- Displays minimum, maximum, and average temperatures in a formatted table with color-coded output.
- Handles errors gracefully with informative messages.

## Prerequisites/Dependencies

- Windows PowerShell - Tested with latest version. 
- An OpenWeatherMap API key - Registration is required and key needs time to propagate in order to be activated. 
- Internet connection and probaly a source code editor like VS Code or Powershell editor. 

## Diagram or Flow of the script:  
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------





Start #<- User Execution
  |
  |
Fetch API Key from External File 
  |
  |
Check if API Key File Exists
  |--------------------|
  |                    |
  v                    v
File Not Found       File Found
  |                    |
  v                    v
Display Error        Read API Key
  |                    |
  v                    v
Exit                Check if API Key is Valid
                      |--------------------|
                      |                    |
                      v                    v
                Invalid API Key         Valid API Key
                      |                    |
                      v                    v
                Display Error       Prompt for City Name
                      |                    |
                      v                    v
                     Exit           Get-5DayForecast Function
                                          |
                                          v
                                  Construct API URL
                                          |
                                          v
                                  Send Web Request
                                          |
                                          v
                              Check if Response Contains Data
                                          |--------------------|
                                          |                    |
                                          v                    v
                                No Valid Data             Valid Data <--------------------------
                                          |                    |                               |
                                          v                    v                               |
                                    Display Error     Extract Forecast Information             |
                                          |                    |                               |
                                          v                    v                               |
                                         Exit           Create Table                           |
                                                            |                                  |
                                                            v                                  |
                                                  Add Color Coding                             |
                                                            |                                  |
                                                            v                                  |
                                                      Output Table                             |
                                                            |                                  |
                                                            v                                  |
                                                      Error Handling   ------------------------- #Error Handling should post if there is no data avaialbe aka $city in the API list of OpenWeatherMap. 
                                                            |
                                                            v
                                                           End
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


## Setup Instructions

1. **Get an API Key**:
   - Sign up for an account at [OpenWeatherMap](https://openweathermap.org/).
   - verify your email
   - wait for key to be activated. 
   - test your key with a sample CALL: https://api.openweathermap.org/geo/1.0/direct?q=London&limit=20&appid={Add_Your_API_Key}

2. **Create API Key File**:
   - Create a text file named `WeatherAPIkey.txt`.
   - Paste your key into the txt file and move the file in C:/ location/folder and make sure that it has the correct rights. 
   -

3. **Download the repo localy and RUN**
   - Pull your repo from GitHub via your shell or gitBash if using Windows. "Git clone...." 
   - Open Powershell with Admin rights and located the download folder fo the script. 
   - run the script with ./script named
   - You might need to use -ExecutionPolicy Bypass if Powershell is not set to bypass the default execution policy. 



## Sources used to complete the task: 

  - ANSI escape code is used here to set the color. I've used basic 3-bit colors: "31: Red", "34: Blue", "33: Yellow". More details can be found here: https://en.wikipedia.org/wiki/ANSI_escape_code#3-bit_and_4-bi
  - Visual Basic language reference - https://learn.microsoft.com/en-us/office/vba/language/reference/character-sets
  - https://openweathermap.org/forecast5 
  - https://learn.microsoft.com/en-us/powershell/scripting/overview?view=powershell-7.4
  + A few of random forums and YouTube videos. 
