//
//  WeatherData.swift
//  WeatherStationSwift
//
//  Created by Dmitrii Voronin on 04.10.2020.
//  Copyright © 2020 Dmitrii Voronin. All rights reserved.
//

import Foundation

struct WeatherInfo {
    var temperature = 0.0
    var humidity = 0.0
    var pressure = 0.0
}

class Display: IObserver {
    func update(_ data: WeatherInfo) {
        print("Current temperature \(data.temperature)")
        print("Current humidity \(data.humidity)")
        print("Current pressure \(data.pressure)")
        print("")
    }

}

class Statistic {
    private var min = Double.infinity
    private var max = -Double.infinity
    private var acc = 0.0
    private var countAcc = 0
    
    func update(value: Double) {
        min = Swift.min(self.min, value)
        max = Swift.max(self.max, value)
        
        acc += value
        countAcc += 1
    }
    
    func printInfo() -> String {
        "min: \(min)\n" + "    max: \(max)\n" + "    taverage: \(calculate())"
    }
    
    private func calculate() -> Double {
        guard countAcc != 0 else {
            fatalError("Деление на 0")
        }
        
        return acc/Double(countAcc)
    }
}

class StatsDisplay: IObserver {
    private var temperatureStats = Statistic()
    private var humidityStsts = Statistic()
    private var pressureStats = Statistic()
    
    
    func update(_ data: WeatherInfo) {
        temperatureStats.update(value: data.temperature)
        humidityStsts.update(value: data.humidity)
        pressureStats.update(value: data.pressure)
        
        print("Temperature\n    \(temperatureStats.printInfo())")
        print("Humidity\n    \(humidityStsts.printInfo())")
        print("pressure\n    \(pressureStats.printInfo())")
        print("--------------")
        print("")
    }
    
}

class WeatherData: Observable {
    private var temperature = 0.0
    private var humidity = 0.0
    private var pressure = 0.0
    
    func measurementsChanged() {
        notifyObservers()
    }
    
    func setMeasurements(temp: Double, hum: Double, pres: Double) {
        self.temperature = temp
        self.humidity = hum
        self.pressure = pres
        
        measurementsChanged()
    }
    
    override func getChangedData() -> WeatherInfo {
        var info = WeatherInfo()
        info.temperature = temperature
        info.humidity = humidity
        info.pressure = pressure
        return info
    }
}
