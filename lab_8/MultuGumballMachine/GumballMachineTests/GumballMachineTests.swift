//
//  GumballMachineTests.swift
//  GumballMachineTests
//
//  Created by Dmitrii Voronin on 01.11.2020.
//

import XCTest

class GumballMachineTests: XCTestCase {
    
    func testStandartUseMachine() {
        let machine = NewGumballMachineImpl(numBalls: 5)
        XCTAssertEqual(machine.ballCount, 5)
        
        XCTAssertEqual(machine.toString(), toString(count: 5, state: "waiting for quarter"))
        machine.insertQuarter()
        XCTAssertEqual(machine.toString(), toString(count: 5, state: "waiting for turn of crank"))
        
        machine.turnCrank()
        XCTAssertEqual(machine.toString(), toString(count: 4, state: "waiting for quarter"))
        XCTAssertEqual(machine.ballCount, 4)
        
        machine.insertQuarter()
        machine.turnCrank()
        XCTAssertEqual(machine.ballCount, 3)
        
        machine.insertQuarter()
        machine.turnCrank()
        XCTAssertEqual(machine.ballCount, 2)
        
        machine.insertQuarter()
        machine.turnCrank()
        XCTAssertEqual(machine.ballCount, 1)
        
        XCTAssertEqual(machine.toString(), toString(count: 1, state: "waiting for quarter"))
        machine.insertQuarter()
        XCTAssertEqual(machine.toString(), toString(count: 1, state: "waiting for turn of crank"))
        machine.turnCrank()
        XCTAssertEqual(machine.toString(), toString(count: 0, state: "sold out"))
        XCTAssertEqual(machine.ballCount, 0)
        
        XCTAssertEqual(machine.toString(), toString(count: 0, state: "sold out"))
        machine.insertQuarter()
        XCTAssertEqual(machine.toString(), toString(count: 0, state: "sold out"))
        machine.turnCrank()
        XCTAssertEqual(machine.toString(), toString(count: 0, state: "sold out"))
        XCTAssertEqual(machine.ballCount, 0)
        
    }
    
    func testCanFillMachine() {
        let machine = NewGumballMachineImpl(numBalls: 0)
        
        machine.fill(count: 10)
        XCTAssertEqual(machine.ballCount, 10)
    }
    
    func testSoldOutState() {
        let machine = NewGumballMachineImpl(numBalls: 0)
        machine.insertQuarter()
        XCTAssertEqual(machine.toString(), toString(count: 0, state: "sold out"))
        machine.turnCrank()
        XCTAssertEqual(machine.toString(), toString(count: 0, state: "sold out"))
        machine.rejectQuarter()
        XCTAssertEqual(machine.toString(), toString(count: 0, state: "sold out"))
        machine.fill(count: 2)
        XCTAssertEqual(machine.toString(), toString(count: 2, state: "waiting for quarter"))
    }
    
    func testHasQuarterState() {
        let machine = NewGumballMachineImpl(numBalls: 2)
        
        machine.insertQuarter()
        XCTAssertEqual(machine.toString(), toString(count: 2, state: "waiting for turn of crank"))
        machine.insertQuarter()
        XCTAssertEqual(machine.toString(), toString(count: 2, state: "waiting for turn of crank"))
        machine.rejectQuarter()
        XCTAssertEqual(machine.toString(), toString(count: 2, state: "waiting for quarter"))
        machine.insertQuarter()
        XCTAssertEqual(machine.toString(), toString(count: 2, state: "waiting for turn of crank"))
        machine.fill(count: 2)
        XCTAssertEqual(machine.toString(), toString(count: 4, state: "waiting for turn of crank"))
        machine.turnCrank()
        XCTAssertEqual(machine.toString(), toString(count: 3, state: "waiting for quarter"))
    }
    
    func testNoQuarterState() {
        let machine = NewGumballMachineImpl(numBalls: 2)
        
        XCTAssertEqual(machine.toString(), toString(count: 2, state: "waiting for quarter"))
        machine.rejectQuarter()
        XCTAssertEqual(machine.toString(), toString(count: 2, state: "waiting for quarter"))
        machine.fill(count: 2)
        XCTAssertEqual(machine.toString(), toString(count: 4, state: "waiting for quarter"))
    }
}

fileprivate func toString(count: UInt32, state: String) -> String {
    "Mighty Gumball, Inc. C++-enabled Standing Gumball Model #2016 (with state) Inventory: \(count) gumball\(count != 1 ? "s" : "") Machine is \(state)"
}
