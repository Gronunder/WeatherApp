# Weather App Task

A PowerShell script to fetch and display a 5-day weather forecast for a specified city using the OpenWeatherMap API. The script retrieves the weather via API call with private key from an external database/API's.

## Features
- Fetches a 5-day weather forecast. - Limiation of the Free Account in OpenWeatherMap. 
- Dynamic city selection.
- Supports city names in both Bulgarian (Cyrilic) and English. Other languages are not tested! 
- Min, Max, Avg and current weather overview if it's clear sky, cloudy, windy, etc. Temp is color-coded on it's intensity. 
- Handles errors gracefully with informative messages.
- Built around "https://api.openweathermap.org/data/2.5/forecast?q={city}&appid={apiKey}&units=metric"

## Bug's
- Possible math issue for average temperature, as AvgTemp is calculated locally due to API not available, thus there might be a better option to get AvgTemp. 
- Due to the nature of 3h ticks, we might have discrepancy in the MinTemp. 

## Nice to have
- Dynamic day selection. 
- 5DayFroecast function to be separated into a few smaller functions for better consumption of the code.  

## Prerequisites/Dependencies

- Windows PowerShell: Tested with the latest version. 
- An OpenWeatherMap API key Registration is required, and the key needs time to propagate in order to be activated. 
- Internet connection and probably a source code editor like VS Code or Powershell editor. 

## Diagram or Flow of the script:  

![image](https://github.com/user-attachments/assets/6e0d2872-0496-4b0a-aa92-e29ffcd9da74)



## Setup Instructions

1. **Get an API Key**:
   - Sign up for an account at [OpenWeatherMap](https://openweathermap.org/).
   - Verify your email.
   - Wait for the key to be activated. 
   - Test your key with a sample CALL: https://api.openweathermap.org/geo/1.0/direct?q=London&limit=20&appid={Add_Your_API_Key}

2. **Create API Key File**:
   - Create a text file named `WeatherAPIkey.txt`.
   - Paste your key into the txt file and move the file to C:/ location/folder and make sure that it has the correct rights. 
   -

3. **Download the repo localy and RUN**
   - Pull your repo from GitHub via your shell or gitBash if using Windows. "Git clone...." 
   - Open Powershell with Admin rights and locate the download folder fo the script. 
   - Run the script with ./{scriptname}
   - You might need to use -ExecutionPolicy Bypass if Powershell is not set to bypass the default execution policy. 



## Sources used to complete the task: 

  - ANSI escape code is used here to set the color. I've used basic 3-bit colors: "31: Red", "34: Blue", "33: Yellow". More details can be found here: https://en.wikipedia.org/wiki/ANSI_escape_code#3-bit_and_4-bi
  - Visual Basic language reference - https://learn.microsoft.com/en-us/office/vba/language/reference/character-sets
  - https://openweathermap.org/forecast5 
  - https://learn.microsoft.com/en-us/powershell/scripting/overview?view=powershell-7.4
  + A few of random forums and YouTube videos. 
