//
//  main.swift
//  WeatherStationSwift
//
//  Created by Dmitrii Voronin on 04.10.2020.
//  Copyright © 2020 Dmitrii Voronin. All rights reserved.
//

import Foundation

let weatherData = WeatherData()
let display = Display()

weatherData.registerOberver(observer: display, priority: 0)

let statsDisplay = StatsDisplay()
weatherData.registerOberver(observer: statsDisplay, priority: 1)

weatherData.setMeasurements(temp: 10, hum: 0.8, pres: 760)
weatherData.setMeasurements(temp: 20, hum: 0.9, pres: 770)

weatherData.removeObserver(observer: statsDisplay)

weatherData.setMeasurements(temp: 10, hum: 0.6, pres: 760)
weatherData.setMeasurements(temp: -100, hum: 0.9, pres: 760)



