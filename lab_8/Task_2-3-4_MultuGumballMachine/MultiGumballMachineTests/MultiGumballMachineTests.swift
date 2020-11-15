//
//  MultiGumballMachineTests.swift
//  MultiGumballMachineTests
//
//  Created by Dmitrii Voronin on 15.11.2020.
//

import XCTest
@testable import Task_2_3_4_MultuGumballMachine

class MultiGumballMachineTests: XCTestCase {
    let machine = GumballMachineImpl(numBalls: 0)
    
    func testRefillInSoldOutState() {
        machine.insertQuarter()
        machine.insertQuarter()
        machine.insertQuarter()
        machine.insertQuarter()
        machine.insertQuarter()
        
        machine.refiil(count: 3)
        XCTAssertEqual(machine.toString(), createGumballMachineState(gumballCount: 3, quarterCount: 5, state: "quarters store is full. waiting for turn of crank"))
    }
    
    func testThereAreQuarters() {
        machine.insertQuarter()
        machine.insertQuarter()
        
        machine.refiil(count: 5)
        XCTAssertEqual(machine.toString(), createGumballMachineState(gumballCount: 5, quarterCount: 2, state: "waiting for turn of crank"))
    }
    
    func testThereAreNoQuarters() {
        machine.refiil(count: 5)
        XCTAssertEqual(machine.toString(), createGumballMachineState(gumballCount: 5, quarterCount: 0, state: "waiting for quarter"))
    }
    
    func testRefillInHasNoQuarter() {
        machine.refiil(count: 3)
        machine.insertQuarter()
        machine.insertQuarter()
        XCTAssertEqual(machine.toString(), createGumballMachineState(gumballCount: 3, quarterCount: 2, state: "waiting for turn of crank"))
        
        machine.refiil(count: 5)
        XCTAssertEqual(machine.toString(), createGumballMachineState(gumballCount: 5, quarterCount: 2, state: "waiting for turn of crank"))
    }
    
    func testRefillInMaxQuarters() {
        machine.refiil(count: 3)
        machine.insertQuarter()
        machine.insertQuarter()
        machine.insertQuarter()
        machine.insertQuarter()
        machine.insertQuarter()
        
        XCTAssertEqual(machine.toString(), createGumballMachineState(gumballCount: 3, quarterCount: 5, state: "quarters store is full. waiting for turn of crank"))
        machine.refillImpl(count: 6)
        XCTAssertEqual(machine.toString(), createGumballMachineState(gumballCount: 6, quarterCount: 5, state: "quarters store is full. waiting for turn of crank"))
    }
    
    func testRefillInNoQuartersState() {
        machine.refiil(count: 3)
        
        XCTAssertEqual(machine.toString(), createGumballMachineState(gumballCount: 3, quarterCount: 0, state: "waiting for quarter"))
        machine.refiil(count: 5)
        XCTAssertEqual(machine.toString(), createGumballMachineState(gumballCount: 5, quarterCount: 0, state: "waiting for quarter"))
    }
    
    func testSoldOutState() {
        XCTAssertEqual(machine.toString(), createGumballMachineState(gumballCount: 0, quarterCount: 0, state: "sold out"))
        machine.insertQuarter()
        XCTAssertEqual(machine.toString(), createGumballMachineState(gumballCount: 0, quarterCount: 1, state: "sold out"))
    }
    
    func testEjectQuarter() {
        machine.insertQuarter()
        machine.insertQuarter()
        XCTAssertEqual(machine.toString(), createGumballMachineState(gumballCount: 0, quarterCount: 2, state: "sold out"))
        machine.ejectQuarter()
        XCTAssertEqual(machine.toString(), createGumballMachineState(gumballCount: 0, quarterCount: 0, state: "sold out"))
    }
    
    func testHasQuarterState() {
        machine.refiil(count: 2)
        machine.insertQuarter()
        XCTAssertEqual(machine.toString(), createGumballMachineState(gumballCount: 2, quarterCount: 1, state: "waiting for turn of crank"))
        
        machine.insertQuarter()
        XCTAssertEqual(machine.toString(), createGumballMachineState(gumballCount: 2, quarterCount: 2, state: "waiting for turn of crank"))
    }    
}


fileprivate func createGumballMachineState(gumballCount: Int, quarterCount: Int, state: String) -> String {
    "Mighty Gumball, Inc. C++-enabled Standing Gumball Model #2016 (with state) Inventory: \(gumballCount) gumball\(gumballCount != 1 ? "s" : "") quarters count: \(quarterCount) quarter\(quarterCount != 1 ? "s" : ""). Machine is \(state)"
}
