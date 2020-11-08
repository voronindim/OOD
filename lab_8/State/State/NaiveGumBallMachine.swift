//
//  GumballMachine.swift
//  State
//
//  Created by Dmitrii Voronin on 26.10.2020.
//

import Foundation

class GumballMachineImpl {
    enum State {
        case soldOut
        case noQuarter
        case hasQuarter
        case sold
    }
    
    private var count: UInt32 = 0
    private var state: State = .soldOut
    
    init(count: UInt32) {
        self.count = count
        self.state = count > 0 ? .noQuarter : .soldOut
    }
    
    func insertQuarter() {
        switch state {
        case .soldOut:
            print("You can't insert a quarter, the machine is sold out")
        case .noQuarter:
            print("You inserted a quarter")
            self.state = .hasQuarter
        case .hasQuarter:
            print("You can't insert another quarter")
        case .sold:
            print("Please wait, we're already giving you a gumball")
        }
    }
    
    func ejectQuarter() {
        switch state {
        case .hasQuarter:
            print("Quarter returned")
            self.state = .noQuarter
        case .noQuarter:
            print("You haven't inserted a quarter")
        case .sold:
            print("Sorry you already turned the crank")
        case .soldOut:
            print("You can't eject, you haven't inserted a quarter yet")
        }
    }
    
    func turnCrank() {
        switch state {
        case .soldOut:
            print("You turned but there's no gumball")
        case .noQuarter:
            print("You turned but there's no quarter")
        case .hasQuarter:
            print("You turned...")
            self.state = .sold
        case .sold:
            print("Turning twice doesn't get you another gumball")
        }
    }
    
    func refill(numBalls: UInt32) {
        self.count = numBalls
        self.state = numBalls > 0 ? .noQuarter : .soldOut
    }
    
    func toString() -> String {
        let stateStr: String
        switch state {
        case .soldOut:
            stateStr = "sold out"
        case .noQuarter:
            stateStr = "waiting for quarter"
        case .hasQuarter:
            stateStr = "waiting for turn of crank"
        case .sold:
            stateStr = "delivering a gumball"
        }
        
        return "Mighty Gumball, Inc. C++-enabled Standing Gumball Model #2016 Inventory: \(count) gumball\(count != 1 ? "s" : "") Machine is \(stateStr)"
    }
    
    private func dispence() {
        switch state {
        case .sold:
            print("A gumball comes rolling out the slot")
            count -= 1
            if count == 0 {
                print("Oops, out of gumballs")
                self.state = .soldOut
            } else {
                self.state = .noQuarter
            }
        case .noQuarter:
            print("You need to pey first")
        case  .soldOut:
            break
        case .hasQuarter:
            print("No gumball dispensed")
        }
    }
    
}
