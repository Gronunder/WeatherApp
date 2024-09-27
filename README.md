# Weather App TASK

A PowerShell script to fetch and display a 5-day weather forecast for a specified city using the OpenWeatherMap API. The script retrieves the weather via API key from an external database/API's.
- Min,Max,Avg and current weather overview if it's clear sky, cloudy, windy etc. 

## Features
- Fetches a 5-day weather forecast. - Limiation of the Free Account in OpenWeatherMap. 
- Dynamic city selection.
- Supports city names in both Bulgarian(Cyrilic) and English. Other Languanges are not tested! 
- Min,Max,Avg and current weather overview if it's clear sky, cloudy, windy etc. Temp is color-coded on it's intensity. 
- Handles errors gracefully with informative messages.
- Built around "https://api.openweathermap.org/data/2.5/forecast?q={city}&appid={apiKey}&units=metric"

## Bug's
- Possible math issue for average tempetrature, as AvgTemp is calcualted localy due to API not available, thus there might be a better option to get AvgTemp. 
- Due to the nature of 3h ticks, we might have discrepency in the MinTemp. 

## Nice to have
- Dynamic day selection. 
- 5DayFroecast function to be separated into few smaller functions for better consumation of the code.  

## Prerequisites/Dependencies

- Windows PowerShell - Tested with latest version. 
- An OpenWeatherMap API key - Registration is required and key needs time to propagate in order to be activated. 
- Internet connection and probaly a source code editor like VS Code or Powershell editor. 

## Diagram or Flow of the script:  

![image](https://github.com/user-attachments/assets/6e0d2872-0496-4b0a-aa92-e29ffcd9da74)



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
