//
// Created by Dmitrii Voronin on 04.10.2020.
//

#include <iostream>
#include "Observer.h"

struct SWeatherInfo
{
    double temperature = 0;
    double humidity = 0;
    double pressure = 0;
};

class CDisplay : public IObserver<SWeatherInfo>
{
private:
    /* Метод Update сделан приватным, чтобы ограничить возможность его вызова напрямую
        Классу CObservable он будет доступен все равно, т.к. в интерфейсе IObserver он
        остается публичным
    */
    void Update(SWeatherInfo const& data) override
    {
        std::cout << "Current Temp " << data.temperature << std::endl;
        std::cout << "Current Hum " << data.humidity << std::endl;
        std::cout << "Current Pressure " << data.pressure << std::endl;
        std::cout << "----------------" << std::endl;
    }
};

class CStatistic
{
public:
    void Update(double value)
    {
        m_min = std::min(m_min, value);
        m_max = std::max(m_max, value);
        m_acc += value;
        ++m_countAcc;
    }

    [[nodiscard]] std::string ToString() const
    {
        return "\tmin: " + std::to_string(m_min) + "\n\tmax: " + std::to_string(m_max) + "\n\taverage: " + std::to_string(m_acc / m_countAcc); // деление на 0
    }

private:
    double m_min = std::numeric_limits<double>::infinity();
    double m_max = -std::numeric_limits<double>::infinity();
    double m_acc = 0;
    unsigned m_countAcc = 0;
};

class CStatsDisplay : public IObserver<SWeatherInfo>
{
private:
    /* Метод Update сделан приватным, чтобы ограничить возможность его вызова напрямую
    Классу CObservable он будет доступен все равно, т.к. в интерфейсе IObserver он
    остается публичным
    */
    void Update(SWeatherInfo const& data) override
    {
        m_temperatureStats.Update(data.temperature);
        m_humidityStats.Update(data.humidity);
        m_pressureStats.Update(data.pressure);

        std::cout << "Temperature\n"
                  << m_temperatureStats.ToString() << std::endl;
        std::cout << "Humidity\n"
                  << m_humidityStats.ToString() << std::endl;
        std::cout << "Pressure\n"
                  << m_pressureStats.ToString() << std::endl;
        std::cout << "----------------" << std::endl;
    }

    CStatistic m_temperatureStats;
    CStatistic m_humidityStats;
    CStatistic m_pressureStats;
};

class CWeatherData : public CObservable<SWeatherInfo>
{
public:
    // Температура в градусах Цельсия
    double GetTemperature() const
    {
        return m_temperature;
    }
    // Относительная влажность (0...100)
    double GetHumidity() const
    {
        return m_humidity;
    }
    // Атмосферное давление (в мм.рт.ст)
    double GetPressure() const
    {
        return m_pressure;
    }

    void MeasurementsChanged()
    {
        NotifyObservers();
    }

    void SetMeasurements(double temp, double humidity, double pressure)
    {
        m_humidity = humidity;
        m_temperature = temp;
        m_pressure = pressure;

        MeasurementsChanged();
    }

protected:
    [[nodiscard]] SWeatherInfo GetChangedData() const override
    {
        SWeatherInfo info;
        info.temperature = GetTemperature();
        info.humidity = GetHumidity();
        info.pressure = GetPressure();
        return info;
    }

private:
    double m_temperature = 0.0;
    double m_humidity = 0.0;
    double m_pressure = 760.0;
};