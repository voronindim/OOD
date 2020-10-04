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
    func notifyObservers(changedEvents: [WeatherEvent])
    func removeObserver(observer: IObserver)
    
    func setEventSubscription(observer: IObserver, event: WeatherEvent)
    func delEventSubscription(observer: IObserver, event: WeatherEvent)
}

class Observable: IObservable {
    
    private var observers: [(priority: Int, observer: IObserver)] = []
    private var subscriptions: [: [WeatherEvent]] = [:]
    
    func registerOberver(observer: IObserver, priority: Int) {
        observers.append((priority, observer))
        observers = observers.sorted(by: { $0.priority > $1.priority })
    }
    
    func notifyObservers(changedEvents: [WeatherEvent]) {
        let data = getChangedData()
        for item in observers {
            
//            item.observer.update(data)
        }
    }
    
    func removeObserver(observer: IObserver) {
        observers.removeAll(where: { $0.observer as AnyObject === observer as AnyObject })
    }
    
    func getChangedData() -> WeatherInfo {
        fatalError("Вызван метод у родительского класса")
    }
    
    private func isSubscribe(observer: IObserver, events: [WeatherEvent]) -> Bool {
        
    }
    
}
