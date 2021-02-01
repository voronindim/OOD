//
//  GumBallMachineWithState.swift
//  MultuGumballMachine
//
//  Created by Dmitrii Voronin on 01.11.2020.
//

import Foundation

protocol State {
    func insertQuarter()
    func ejectQuarter()
    func turnCrank()
    func dispnece()
    func toStrig() -> String
}

protocol GumballMachine {
    var ballCount: UInt32 { get }
    var coinCount: UInt8 { get }
    func releaseBall()
    func setSoldOutState()
    func setNoQuarterState()
    func setSoldState()
    func setHasQuarterState()
}

class SoldState: State {
    private let gumbalMachine: GumballMachine
    
    init(gumbalMachine: GumballMachine) {
        self.gumbalMachine = gumbalMachine
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
    
    func dispnece() {
        self.gumbalMachine.releaseBall()
                
        if gumbalMachine.ballCount == 0 {
            print("Oops, out of gumballs")
            gumbalMachine.setSoldOutState()
        } else {
            if gumbalMachine.coinCount == 0 {
                gumbalMachine.setNoQuarterState()
            } else {
                gumbalMachine.setHasQuarterState()
            }
        }
    }
    
    func toStrig() -> String{
        "delivering a gumball"
    }
}

class SoldOutState: State {
    private let gumballMachine: GumballMachine
    
    init(gumbolMachine: GumballMachine) {
        self.gumballMachine = gumbolMachine
    }
    
    func insertQuarter() {
        print("You can't insert a quarter, the machine is sold out")
    }
    
    func ejectQuarter() {
        if gumballMachine.coinCount != 0 {
            print("Quarter(\(gumballMachine.coinCount)) returned")
            return
        }
        print("You can't eject, you haven't inserted a quarter yet")
    }
    
    func turnCrank() {
        print("You turned but there's no gumballs")
    }
    
    func dispnece() {
        print("No gumball dispensed")
    }
    
    func toStrig() -> String {
        "sold out"
    }
}

class HasQuarterState: State {
    private let gumbolMachine: GumballMachine
    
    init(gumbolMachine: GumballMachine) {
        self.gumbolMachine = gumbolMachine
    }
    
    func insertQuarter() {
        print("You inserted a quarter")
    }
    
    func ejectQuarter() {
        print("Quarter(\(gumbolMachine.coinCount)) returned")
        gumbolMachine.setNoQuarterState()
    }
    
    func turnCrank() {
        print("You turned...")
        gumbolMachine.setSoldState()
    }
    
    func dispnece() {
        print("No gumball dispensed")
    }
    
    func toStrig() -> String {
        "waiting for turn of crank"
    }
}

class NoQuarterState: State {
    private let gumbolMachine: GumballMachine
    
    init(gumbolMachine: GumballMachine) {
        self.gumbolMachine = gumbolMachine
    }
    
    func insertQuarter() {
        print("You inserted a quarter")
        gumbolMachine.setHasQuarterState()
    }
    
    func ejectQuarter() {
        print("You haven't inserted a quarter")
    }
    
    func turnCrank() {
        print("You turned but there's no quarter")
    }
    
    func dispnece() {
        print("You need to pay first")
    }
    
    func toStrig() -> String {
        "waiting for quarter"
    }
}

class NewGumballMachineImpl: GumballMachine {
    var ballCount: UInt32 = 0
    var coinCount: UInt8 = 0
    private var soldOutState: SoldOutState?
    private var soldState: SoldState?
    private var noQuarterState: NoQuarterState?
    private var hasQuarterState: HasQuarterState?
    private var state: State?
    
    
    init(numBalls: UInt32) {
        self.ballCount = numBalls
        self.soldState = SoldState(gumbalMachine: self)
        self.soldOutState = SoldOutState(gumbolMachine: self)
        self.noQuarterState = NoQuarterState(gumbolMachine: self)
        self.hasQuarterState = HasQuarterState(gumbolMachine: self)
        
        if ballCount > 0 {
            state = self.noQuarterState
        } else {
            state = self.soldOutState
        }
    }
    
    func fill(count: UInt32) {
        ballCount += count
        
        if ballCount == 0 {
            state = self.soldOutState
        }
    }
    
    func rejectQuarter() {
        self.state!.ejectQuarter()
        coinCount = 0
    }
    
    func insertQuarter() {
        guard coinCount < 5 else {
            print("You can't insert another quarter. Max 5 quarters")
            return
        }

        coinCount += 1
        state!.insertQuarter()
    }
    
    func turnCrank() {
        guard coinCount != 0 else {
            print("You haven't inserted a quarter")
            return
        }
        coinCount -= 1
        
        state!.turnCrank()
        state!.dispnece()
    }
    
    func toString() -> String {
        "Mighty Gumball, Inc. C++-enabled Standing Gumball Model #2016 (with state) Inventory: \(ballCount) gumball\(ballCount != 1 ? "s" : "") Machine is \(state!.toStrig())"
    }
    
    func releaseBall() {
        if ballCount != 0 {
            print("A gumball comes rolling out the slot...")
            ballCount -= 1
        }
    }
    
    func setSoldOutState() {
        self.state = soldOutState
    }
    
    func setNoQuarterState() {
        self.state = noQuarterState
    }
    
    func setSoldState() {
        self.state = soldState
    }
    
    func setHasQuarterState() {
        self.state = hasQuarterState
    }

    
}
