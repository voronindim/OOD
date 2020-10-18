//
//  WeatherStationTests.swift
//  WeatherStationTests
//
//  Created by Dmitrii Voronin on 05.10.2020.
//  Copyright © 2020 Dmitrii Voronin. All rights reserved.
//
@testable
import WeatherStationSwift
//import XCTest

class WeatherStationTests: XCTestCase {
    func testDoubleRemoved() {
        let weatherStation = WeatherData()
        let removedObserver = MockRemovedObserver(observer: weatherStation)
        
        weatherStation.registerOberver(observer: removedObserver, priority: 0)
        
        weatherStation.setMeasurements(temp: 20, hum: 0.9, pres: 760)
    }
    
    func testPriority() {
        var output: String = ""
        
        let weatherData = WeatherData()
        
        let observer1 = PriorityObserver(1, out: output)
        let observer2 = PriorityObserver(2, out: output)
        let observer3 = PriorityObserver(3, out: output)
        
        weatherData.registerOberver(observer: observer1, priority: 2)
        weatherData.registerOberver(observer: observer2, priority: 1)
        weatherData.registerOberver(observer: observer3, priority: 3)
        
        XCTAssertEqual("213", output)
    }
}

extension WeatherStationTests {
    class MockObservable: IObservable {

        private var observers: [(priority: Int, observer: IObserver)] = []
        
        func registerOberver(observer: IObserver, priority: Int) {
            observers.append((priority, observer))
            observers = observers.sorted(by: { $0.priority > $1.priority })
        }
        
        func notifyObservers() {
            let data = getChangedData()
            for item in observers {
                item.observer.update(data)
                item.observer.update(data)
            }
        }

        func removeObserver(observer: IObserver) {
            observers.removeAll(where: { $0.observer as AnyObject === observer as AnyObject })
        }
        
        func getChangedData() -> WeatherInfo {
            fatalError("Вызван метод у родительского класса")
        }
    }
    
}

extension WeatherStationTests {
    
    class MockRemovedObserver: IObserver {
        private let observer: IObservable
        
        init(observer: IObservable) {
            self.observer = observer
        }
        func update(_ data: WeatherInfo) {
            self.observer.removeObserver(observer: self)
        }
    }
}

extension WeatherStationTests {
    class PriorityObserver: IObserver {
        private let id: Int
        var outStream: TextOutputStream
        
        init(_ id: Int, out: TextOutputStream) {
            self.id = id
            self.outStream = out
        }
        
        func update(_ data: WeatherInfo) {
//            outStream.write("\(id)")
        }
        
    }
}


 // тест проверябщий удаление самого себя в update и удаление других элмментов array в update
// интерфейс записи в переменную
