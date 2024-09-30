# Fetch the API key from an external file
$apiKeyFilePath = "C:\WeatherAPIkey.txt"  # <- When using FilePath, please update your path if not in the default location. !!! I haven't tested this with any Secrets Manager/Server !!!
if (-not (Test-Path $apiKeyFilePath)) {
    Write-Error "API key file not found at $apiKeyFilePath." -ForegroundColor Black -BackgroundColor Red  #Graceful Error
    exit
}
$apiKey = Get-Content -Path $apiKeyFilePath -ErrorAction Stop

# Checkout step for APi validity. This step will shout out if there is an error/missing Key or unrecognized file. 
if (-not $apiKey) {
    Write-Error "API key is empty or invalid."  -ForegroundColor Black -BackgroundColor Red
    exit
}

# Write-Host will prompt the user to select a city. English and Cyrillic is tested only! 
# Nice to have: Basic list of cities in EU prompt. 
Write-Host "Please enter the name of the city (Cyrillic or English entries tested):" -ForegroundColor Black -BackgroundColor Green
$city = Read-Host

# Main Function/Process to fetch and display the "5-day weather forecast" - I've done a 5-day due to a limitation on the API request of up-to 5-day forecast for free accounts. 
function Get-5DayForecast {
    param (
        [string]$city,
        [string]$apiKey
    )

    # 5-day forecast API URL or start building the API URL for bellow modules/steps. 
    $apiUrl = "https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=$apiKey&units=metric"

    # Call to fetch data and do debug if 'city' is not found in the list. 
    # Send a request to the API of Open Weather Map. 
    try {
        $response = Invoke-RestMethod -Uri $apiUrl -Method Get -ErrorAction Stop

         # Check if the response contains data and extract forecast information
        if ($response -and $response.list) {
            $forecastData = $response.list | Group-Object { $_.dt_txt.Split(" ")[0] } | Select-Object -First 5

            # Create a table to display the forecast information - Table created using official documentation
            $table = @()
            foreach ($group in $forecastData) {  # This part should sort out the day, remove the time as it has 3h ticks only. Resources: Forums and YouTube. 
                $day = $group.Group[0]  # Get the first entry for the day
                $date = $group.Name     # Grouped by date and removed the time, due to the 3h ticks available for this API key. 
                $tempMin = [math]::Round($day.main.temp_min)
                $tempMax = [math]::Round($day.main.temp_max)
                $tempAvg = [math]::Round(($tempMin + $tempMax) / 2)
                $weather = $day.weather[0].description

                # Add color coding for temperatures - ANSI escape code is used here to set the color. I've used basic 3-bit colors: "31: Red", "34: Blue", "33: Yellow". More details can be found here: https://en.wikipedia.org/wiki/ANSI_escape_code#3-bit_and_4-bit
                $table += [PSCustomObject]@{
                    Date       = $date
                    MinTemp    = "$([char]27)[34m${tempMin}" + [char]176 + "C$([char]27)[0m"
                    MaxTemp    = "$([char]27)[31m${tempMax}" + [char]176 + "C$([char]27)[0m"
                    AvgTemp    = "$([char]27)[33m${tempAvg}" + [char]176 + "C$([char]27)[0m"
                    Weather    = $weather
                }
            }

            # This is the table that is set with PS default -AutoSize. Need to investigate other format-table options... 
            $table | Format-Table -AutoSize
        }
    }
    catch {
        # Error/Issue handling. These are basic error messages that will be outputted at the same time, due to the unified block. The idea is to navigate the end user to better troubleshoot the issue. Note: I managed to generate "cod":404 error only, as I think this the only one for the "City" API's. 
        Write-Host "An error occurred while trying to fetch the weather data for ${city}." -ForegroundColor Black -BackgroundColor Red
        Write-Host "API error details, or Error code: $_" -ForegroundColor Red 
    }
}

# Call the function that is started on line"5DayForecast. I've used this name, as it was a default one in the OpenWeatherMap documentation! 
Get-5DayForecast -city $city -apiKey $apiKey



