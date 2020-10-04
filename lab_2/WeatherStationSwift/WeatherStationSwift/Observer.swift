//
//  Observer.swift
//  WeatherStationSwift
//
//  Created by Dmitrii Voronin on 04.10.2020.
//  Copyright © 2020 Dmitrii Voronin. All rights reserved.
//

import Foundation

protocol IObserver {
    func update(_ data: WeatherInfo)
}

protocol IObservable {
    func registerOberver(observer: IObserver, priority: Int)
    func notifyObservers()
    func removeObserver(observer: IObserver)
}

class Observable: IObservable {
    
    private var observers: [(priority: Int, observer: IObserver)] = []
    
    func registerOberver(observer: IObserver, priority: Int) {
        observers.append((priority, observer))
        observers = observers.sorted(by: { $0.priority > $1.priority })
    }
    
    func notifyObservers() {
        let data = getChangedData()
        for item in observers {
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
