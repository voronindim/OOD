#include "WeatherData.h"

int main() {
    CWeatherData weatherData;
    CDisplay display;

    weatherData.RegisterObserver(display, 0);

    CStatsDisplay statsDisplay;
    weatherData.RegisterObserver(statsDisplay, 1);

    weatherData.SetMeasurements(10, 0.9, 760);
    weatherData.SetMeasurements(20, 1, 770);

    weatherData.RemoveObserver(statsDisplay);

    weatherData.SetMeasurements(40, 0.5, 750);
    weatherData.SetMeasurements(-40, 0.6, 740);

    return 0;
}
