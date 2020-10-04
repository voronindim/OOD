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
    var windInfo = WindInfo(speed: 0, direction: 0)
}

struct WindInfo {
    var speed = 0.0
    var direction = 0.0
    
    static func == (lhs: WindInfo, rhs: WindInfo) -> Bool {
        return lhs.speed == rhs.speed && lhs.direction == rhs.direction
    }
    
    static func != (lhs: WindInfo, rhs: WindInfo) -> Bool {
        return lhs.speed != rhs.speed || lhs.direction != rhs.direction
    }
}

enum WeatherEvent {
    case Temperature
    case Humidity
    case Pressure
    case Wind

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
    
    func returnInfo() -> String {
        "min: \(min)\n" + "    max: \(max)\n" + "    taverage: \(calculate())"
    }
    
    private func calculate() -> Double {
        guard countAcc != 0 else {
            fatalError("Деление на 0")
        }
        
        return acc/Double(countAcc)
    }
    
}

class DirectionStatistic {
    private var sinSum = 0.0
    private var cosSum = 0.0
    
    func update(value: Double) {
        sinSum += sin(DirectionStatistic.toRadius(value))
        cosSum += cos(DirectionStatistic.toRadius(value))
    }
    
    func returnInfo() -> String {
        let x = DirectionStatistic.toDegrees(atan(sinSum / cosSum)) + 360.0
        let average = x - trunc(x / 360) * 360
        return "average direction: \(average)"
    }
    
    static private func toDegrees(_ value: Double) -> Double {
        value * 180 / Double.pi
    }
    
    static private func toRadius(_ value: Double) -> Double {
        value * Double.pi / 180
    }
    
}


class StatsDisplay: IObserver {
    private let temperatureStats = Statistic()
    private let humidityStats = Statistic()
    private let pressureStats = Statistic()
    private let windSpeedStats = Statistic()
    private let windDirectionStats = DirectionStatistic()
    
    func update(_ data: WeatherInfo) {
        temperatureStats.update(value: data.temperature)
        humidityStats.update(value: data.humidity)
        pressureStats.update(value: data.pressure)
        windSpeedStats.update(value: data.windInfo.speed)
        windDirectionStats.update(value: data.windInfo.direction)
        
        print("Temparature: \n    \(temperatureStats.returnInfo())")
        print("Humidity\n    \(humidityStats.returnInfo())")
        print("Pressure\n    \(pressureStats.returnInfo())")
        print("Wind\n    \(windSpeedStats.returnInfo())")
        print("    \(windDirectionStats.returnInfo())")
        print("--------------")
        print("")
    }
    
}

class WeatherData: Observable {
    private var temperature = 0.0
    private var humidity = 0.0
    private var pressure = 0.0
    private var windInfo = WindInfo()
    
    func measurementsChanged() {
        notifyObservers()
    }
    
    func setMeasurements(temp: Double, hum: Double, pres: Double, windInfo: WindInfo) {
        self.temperature = temp
        self.humidity = hum
        self.pressure = pres
        self.windInfo = windInfo
        
        measurementsChanged()
    }
    
    func getChangedEvents(temp: Double, hum: Double, pres: Double, windInfo: WindInfo) -> [WeatherEvent] {
        var events: [WeatherEvent] = []
        
        if temperature != temp {
            events.append(.Temperature)
        }
        if humidity != hum {
            events.append(.Humidity)
        }
        if pressure != pres {
            events.append(.Pressure)
        }
        if windInfo != windInfo {
            events.append(.Wind)
        }
    }

    override func getChangedData() -> WeatherInfo {
        var info = WeatherInfo()
        info.humidity = humidity
        info.temperature = temperature
        info.pressure = pressure
        info.windInfo.direction = windInfo.direction
        info.windInfo.speed = windInfo.speed
        return info
    }
    
}
