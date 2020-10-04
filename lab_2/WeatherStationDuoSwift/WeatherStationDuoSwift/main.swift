//
//  main.swift
//  WeatherStationDuoSwift
//
//  Created by Dmitrii Voronin on 04.10.2020.
//  Copyright © 2020 Dmitrii Voronin. All rights reserved.
//

import Foundation

let weatherDataIn = WeatherData()
let weatherDataOut = WeatherData()

let display = StatsDisplay(inObservable: weatherDataIn, outObservable: weatherDataOut)

weatherDataIn.registerOberver(observer: display, priority: 0)
weatherDataOut.registerOberver(observer: display, priority: 1)

let display1 = StatsDisplay(inObservable: weatherDataIn, outObservable: weatherDataOut)
weatherDataOut.registerOberver(observer: display1, priority: 0)

weatherDataIn.setMeasurements(temp: 10, hum: 0.7, pres: 760)
weatherDataOut.setMeasurements(temp: 20, hum: 0.9, pres: 770)

weatherDataOut.removeObserver(observer: display)

weatherDataIn.setMeasurements(temp: 20, hum: 0.5, pres: 750)
weatherDataOut.setMeasurements(temp: -20, hum: 0.4, pres: 752)
