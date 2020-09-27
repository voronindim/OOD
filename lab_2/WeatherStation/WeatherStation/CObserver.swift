//
//  CObservable.swift
//  WeatherStation
//
//  Created by Dmitrii Voronin on 20.09.2020.
//  Copyright © 2020 Dmitrii Voronin. All rights reserved.
//

import Foundation

class CObservable: Observable {
    
    lazy var observers: [(observer: Observer, priority: Int8)] = []
    
    func registerObserver(observer: Observer, priority: Int8) {
        observers.append((observer, priority))
    }
    
    func removeObserver(observer: Observer) {
        guard let index = observers.firstIndex(where: { $0.observer as AnyObject === observer as AnyObject }) else { return }
        observers.remove(at: index)
    }
    
    func notifyObservers() {
        let data = getChangedData()
        observers.forEach({ $0.observer.update(data: data)})
    }
    
    func getChangedData() -> WeatherInfo {
        fatalError("Вызван метод: который не нужно вызывать!")
    }
    
}

