//
//  main.swift
//  WeatherStationProSwift
//
//  Created by Dmitrii Voronin on 04.10.2020.
//  Copyright © 2020 Dmitrii Voronin. All rights reserved.
//

import Foundation

let weatherStation = WeatherData(
)
let statsDisplay = StatsDisplay()
weatherStation.registerOberver(observer: statsDisplay, priority: 0)

let statsDisplay1 = StatsDisplay()
weatherStation.registerOberver(observer: statsDisplay1, priority: 1)

weatherStation.setMeasurements(temp: 10, hum: 0.8, pres: 760, windInfo: WindInfo(speed: 10, direction: 45))
weatherStation.setMeasurements(temp: 20, hum: 0.9, pres: 770, windInfo: WindInfo(speed: 20, direction: 180))

weatherStation.removeObserver(observer: statsDisplay)

weatherStation.setMeasurements(temp: 20, hum: 0.7, pres: 760, windInfo: WindInfo(speed: 10, direction: 90))
weatherStation.setMeasurements(temp: -20, hum: 0.8, pres: 750, windInfo: WindInfo(speed: 5, direction: 135))

