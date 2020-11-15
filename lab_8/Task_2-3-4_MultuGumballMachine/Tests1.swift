//
//  Tests1.swift
//  MultiGumballMachineTests
//
//  Created by Dmitrii Voronin on 15.11.2020.
//

import XCTest

class Tests1: XCTestCase {
    
    func testSoldOut() {
        let machine = GumballMachineImpl(numBalls: 0)
        XCTAssertEqual(machine.toString(), createGumballMachineState(gumballCount: 0, quarterCount: 0, state: "sold out"))
    }
    
    func testInsertQuarter() {
        let machine = GumballMachineImpl(numBalls: 0)
        machine.insertQuarter()
        XCTAssertEqual(machine.toString(), createGumballMachineState(gumballCount: 0, quarterCount: 1, state: "sold out"))
    }
    
    func testEjectQuarter() {
        let machine = GumballMachineImpl(numBalls: 0)
        machine.insertQuarter()
        machine.insertQuarter()
        XCTAssertEqual(machine.toString(), createGumballMachineState(gumballCount: 0, quarterCount: 2, state: "sold out"))
        machine.ejectQuarter()
        XCTAssertEqual(machine.toString(), createGumballMachineState(gumballCount: 0, quarterCount: 0, state: "sold out"))
    }
    
    func testTurnCrank() {
        let machine = GumballMachineImpl(numBalls: 0)
        XCTAssertEqual(machine.toString(), createGumballMachineState(gumballCount: 0, quarterCount: 0, state: "sold out"))
        
    }
    
    func testHasQuarterState() {
        let machine = GumballMachineImpl(numBalls: 2)
        machine.insertQuarter()
        XCTAssertEqual(machine.toString(), createGumballMachineState(gumballCount: 2, quarterCount: 1, state: "waiting for turn of crank"))
    }
    
    func testEjectQuarter1() {
        let machine = GumballMachineImpl(numBalls: 2)
        machine.insertQuarter()
        XCTAssertEqual(machine.toString(), createGumballMachineState(gumballCount: 2, quarterCount: 1, state: "waiting for turn of crank"))
    }
    
    func testTurnCrank1() {
        let machine = GumballMachineImpl(numBalls: 2)
        machine.insertQuarter()
        machine.TurnCrank()
        XCTAssertEqual(machine.toString(), createGumballMachineState(gumballCount: 2, quarterCount: 0, state: "sold out"))
    }
    
    func testTurnCrank2() {
        let machine = GumballMachineImpl(numBalls: 1)
        machine.insertQuarter()
        machine.insertQuarter()
        machine.insertQuarter()
        machine.insertQuarter()
        machine.insertQuarter()
        machine.TurnCrank()
        XCTAssertEqual(machine.toString(), createGumballMachineState(gumballCount: 0, quarterCount: 4, state: "sold out"))
    }
    
    func testNoQuarterState() {
        let machine = GumballMachineImpl(numBalls: 2)
        XCTAssertEqual(machine.toString(), createGumballMachineState(gumballCount: 2, quarterCount: 0, state: "waiting for quarter"))
        machine.ejectQuarter()
        XCTAssertEqual(machine.toString(), createGumballMachineState(gumballCount: 2, quarterCount: 0, state: "waiting for quarter"))
        machine.TurnCrank()
        XCTAssertEqual(machine.toString(), createGumballMachineState(gumballCount: 2, quarterCount: 0, state: "waiting for quarter"))
        machine.insertQuarter()
        XCTAssertEqual(machine.toString(), createGumballMachineState(gumballCount: 2, quarterCount: 1, state: "waiting for turn of crank"))
    }
    
    
    func testMaxQuartersInMachine() {
        let machine = GumballMachineImpl(numBalls: 5)
        machine.insertQuarter()
        XCTAssertEqual(machine.toString(), createGumballMachineState(gumballCount: 5, quarterCount: 1, state: "waiting for turn of crank"))
        machine.insertQuarter()
        XCTAssertEqual(machine.toString(), createGumballMachineState(gumballCount: 5, quarterCount: 2, state: "waiting for turn of crank"))
        machine.insertQuarter()
        XCTAssertEqual(machine.toString(), createGumballMachineState(gumballCount: 5, quarterCount: 3, state: "waiting for turn of crank"))
        machine.insertQuarter()
        XCTAssertEqual(machine.toString(), createGumballMachineState(gumballCount: 5, quarterCount: 4, state: "waiting for turn of crank"))
        machine.insertQuarter()
        XCTAssertEqual(machine.toString(), createGumballMachineState(gumballCount: 5, quarterCount: 5, state: "quarters store is full. waiting for turn of crank"))
        machine.insertQuarter()
        XCTAssertEqual(machine.toString(), createGumballMachineState(gumballCount: 5, quarterCount: 5, state: "quarters store is full. waiting for turn of crank"))
        
        machine.TurnCrank()
        XCTAssertEqual(machine.toString(), createGumballMachineState(gumballCount: 4, quarterCount: 4, state: "waiting for turn of crank"))
        machine.insertQuarter()
        XCTAssertEqual(machine.toString(), createGumballMachineState(gumballCount: 4, quarterCount: 5, state: "quarters store is full. waiting for turn of crank"))
    }
    
}

fileprivate func createGumballMachineState(gumballCount: Int, quarterCount: Int, state: String) -> String {
    "Mighty Gumball, Inc. C++-enabled Standing Gumball Model #2016 (with state) Inventory: \(gumballCount) gumball\(gumballCount != 1 ? "s" : "") quarters count: \(quarterCount) quarter\(quarterCount != 1 ? "s" : ""). Machine is \(state)"
}
