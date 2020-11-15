//
//  MultiGumbaalMachine.swift
//  Task_2-3-4_MultuGumballMachine
//
//  Created by Dmitrii Voronin on 15.11.2020.
//

import Foundation

protocol State {
    func insertQuarter()
    func ejectQuarter()
    func turnCrank()
    func dispance()
    func refill(count: Int)
    func toString() -> String
}

protocol GumballMachine {
    var ballCount: Int { get set }
    var quarterCount: Int { get set }
    
    func releaseBall()
    func releaseQuarter()
    func addQuarter()
    func refillImpl(count: Int)
    
    func setSoldOutState()
    func setNoQuarterState()
    func setSoldState()
    func setHasQuarterState()
    func setmaxQuarterState()
}

class SoldState: State {
    
    private let gumballMachine: GumballMachine
    
    init(gumballMachine: GumballMachine) {
        self.gumballMachine = gumballMachine
    }
    
    func insertQuarter() {
        print("Please wait, we're already giving you a gumball")
    }
    
    func ejectQuarter() {
        print("Sorry you already turned the crank")
    }
    
    func turnCrank() {
        print("Turning twice doesn't get you another gumball")
    }
    
    func dispance() {
        gumballMachine.releaseBall()
        if gumballMachine.ballCount == 0 {
            print("Oops, out of gumballs")
            gumballMachine.setSoldOutState()
        } else {
            if gumballMachine.quarterCount > 0 {
                gumballMachine.setHasQuarterState()
            } else {
                gumballMachine.setNoQuarterState()
            }
        }
        
    }
    
    func refill(count: Int) {
        print("Cannot refill  while giving a gumball")
    }
    
    func toString() -> String{
        "delivering a gumball"
    }

}

let maxQuarter = 5

class SoldOutState: State {
    private let gumballMachine: GumballMachine
    
    init(gumballMachine: GumballMachine) {
        self.gumballMachine = gumballMachine
    }
    func insertQuarter() {
        gumballMachine.addQuarter()
    }
    
    func ejectQuarter() {
        print("Quarter returned (\(gumballMachine.quarterCount))")
        while gumballMachine.quarterCount != 0 {
            gumballMachine.releaseQuarter()
        }
    }
    
    func turnCrank() {
        print("You turned but there's no gumballs")
    }
    
    func dispance() {
        print("No gumball dispensed")
    }
    
    func refill(count: Int) {
        gumballMachine.refillImpl(count: count)
        if gumballMachine.ballCount == 0 {
            gumballMachine.setSoldOutState()
        } else if gumballMachine.quarterCount == maxQuarter {
            gumballMachine.setmaxQuarterState()
        } else if gumballMachine.quarterCount > 0 {
            gumballMachine.setHasQuarterState()
        } else {
            gumballMachine.setNoQuarterState()
        }
    }
    
    func toString() -> String {
        "sold out"
    }
    
}

class HasQuarterState: State {
    
    private let gumballMachine: GumballMachine
    
    init(gumballMachine: GumballMachine) {
        self.gumballMachine = gumballMachine
    }
    
    func insertQuarter() {
        gumballMachine.addQuarter()
        if gumballMachine.quarterCount == maxQuarter {
            gumballMachine.setmaxQuarterState()
        }
    }
    
    func ejectQuarter() {
        print("Quarter returned (\(gumballMachine.quarterCount))")
        while gumballMachine.quarterCount != 0 {
            gumballMachine.releaseQuarter()
        }
        gumballMachine.setNoQuarterState()
    }
    
    func turnCrank() {
        print("You turned...")
        gumballMachine.releaseQuarter()
        gumballMachine.setSoldOutState()
    }
    
    func dispance() {
        print("No gumball dispensed")
    }
    
    func refill(count: Int) {
        gumballMachine.refillImpl(count: count)
    }
    
    func toString() -> String {
        "waiting for turn of crank"
    }
    
}

class NoQuarterState: State {
    private let gumballMachine: GumballMachine
    
    init(gumballMachine: GumballMachine) {
        self.gumballMachine = gumballMachine
    }
    
    func insertQuarter() {
        gumballMachine.addQuarter()
        gumballMachine.setHasQuarterState()
    }
    
    func ejectQuarter() {
        print("You haven't inserted a quarter")
    }
    
    func turnCrank() {
        print("You turned but there's no quarter")
    }
    
    func dispance() {
        print("You need to pay first")
    }
    
    func refill(count: Int) {
        gumballMachine.refillImpl(count: count)
    }
    
    func toString() -> String {
        "waiting for quarter"
    }

}

class MaxQuartersState: State {
    
    private let gumballMachine: GumballMachine
    
    init(gumballMachine: GumballMachine) {
        self.gumballMachine = gumballMachine
    }
    
    func insertQuarter() {
        print("You can't insert another quarter: max \(maxQuarter) quarters")
    }
    
    func ejectQuarter() {
        print("Quarter returned (\(gumballMachine.quarterCount))")
        while gumballMachine.quarterCount != 0 {
            gumballMachine.releaseQuarter()
        }
        gumballMachine.setNoQuarterState()
    }
    
    func turnCrank() {
        print("You turned...")
        gumballMachine.releaseQuarter()
        gumballMachine.setSoldState()
    }
    
    func dispance() {
        print("No gumball dispensed")
    }
    
    func refill(count: Int) {
        gumballMachine.refillImpl(count: count)
    }
    
    func toString() -> String {
        "quarters store is full. waiting for turn of crank"
    }
    
}

class GumballMachineImpl: GumballMachine {
    var ballCount: Int = 0
    var quarterCount: Int = 0
    
    private var soldOutState: SoldOutState?
    private var soldState: SoldState?
    private var noQuarterState: NoQuarterState?
    private var hasQuarterState: HasQuarterState?
    private var maxQuartersState: MaxQuartersState?
    private var state: State?
    
    
    init(numBalls: Int) {
        self.ballCount = numBalls
        
        self.soldState = SoldState(gumballMachine: self)
        self.soldOutState = SoldOutState(gumballMachine: self)
        self.noQuarterState = NoQuarterState(gumballMachine: self)
        self.hasQuarterState = HasQuarterState(gumballMachine: self)
        self.maxQuartersState = MaxQuartersState(gumballMachine: self)
        self.state = soldOutState
        
        if ballCount > 0 {
            state = noQuarterState
        }
    }
    
    func ejectQuarter() {
        state?.ejectQuarter()
    }
    
    func insertQuarter() {
        state?.insertQuarter()
    }
    
    func TurnCrank() {
        state?.turnCrank()
        state?.dispance()
    }
    
    func releaseBall() {
        if ballCount != 0 {
            print("A gumball comes rolling out the slot...")
            ballCount -= 1
        }
    }
    
    func refiil(count: Int) {
        state?.refill(count: count)
    }
    
    func toString() -> String {
        "Mighty Gumball, Inc. C++-enabled Standing Gumball Model #2016 (with state) Inventory: \(ballCount) gumball\(ballCount != 1 ? "s" : "") quarters count: \(quarterCount) quarter\(quarterCount != 1 ? "s" : ""). Machine is \(state?.toString() ?? "")"
    }
    
    func releaseQuarter() {
        if quarterCount != 0 {
            quarterCount -= 1
        }
    }
    
    func addQuarter() {
        if quarterCount < maxQuarter {
            quarterCount += 1
            print("You inserted a quarter")
        } else {
            print("You can't insert another quarter: max \(maxQuarter) quarters")
        }
    }
    
    func refillImpl(count: Int) {
        ballCount = count
        if count == 0 {
            state = soldOutState
        }
        print("Refill gumballs: \(count)")
    }
    
    func setSoldOutState() {
        state = soldOutState
    }
    
    func setNoQuarterState() {
        state = noQuarterState
    }
    
    func setSoldState() {
        state = soldState
    }
    
    func setHasQuarterState() {
        state = hasQuarterState
    }
    
    func setmaxQuarterState() {
        state = maxQuartersState
    }
    
    
}
