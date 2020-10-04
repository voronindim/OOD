//
//  main.swift
//  SimUDack
//
//  Created by Dmitrii Voronin on 20.09.2020.
//  Copyright © 2020 Dmitrii Voronin. All rights reserved.
//

import Foundation

protocol FlyBehavior {
    func fly() -> Void
}

class FlyWithWings: FlyBehavior {
    private var flightCounter = 0
    
    func fly() {
        flightCounter += 1
        print("I'm flying with wings for the \(flightCounter) time(s)")
    }
    
}

class FlyNoWay: FlyBehavior {
    func fly() {}
}

protocol QuackBehavior {
    func quack() -> Void
}

class CQuackBehavior: QuackBehavior {
    func quack() {
        print("QUACK QUACK")
    }
}

class SqueakQuack: QuackBehavior {
    func quack() {
        print("SQUEEK")
    }
}

class QueackMute: QuackBehavior {
    func quack() {
        print("...")
    }
}

protocol DanceBehvior {
    func dance() -> Void
}

class DanceTheWalts: DanceBehvior {
    func dance() {
        print("I'm dancing walts")
    }
}

class DanceTheMinuet: DanceBehvior {
    func dance() {
        print("I'm dancing minuet")
    }
}

class DanceNoWay: DanceBehvior {
    func dance() {}
}

class Duck {
    private var flyBehavior: FlyBehavior
    private var quackBehavior: QuackBehavior
    private var danceBehavior: DanceBehvior
    
    init(flyBehavior: FlyBehavior, quackBehavior: QuackBehavior, danceBehavior: DanceBehvior) {
        self.flyBehavior = flyBehavior
        self.quackBehavior = quackBehavior
        self.danceBehavior = danceBehavior
    }
    
    func quack() -> Void {
        quackBehavior.quack()
    }
    
    func swim() -> Void {
        print("I'm swiming")
    }
    
    func fly() -> Void {
        flyBehavior.fly()
    }
    
    func dance() -> Void {
        danceBehavior.dance()
    }
    
    func setFlyBehavior(flyBehavior: FlyBehavior) {
        self.flyBehavior = flyBehavior
    }
    
    func display() -> Void {}
}

class MallarDuck: Duck {
    init() {
        super.init(flyBehavior: FlyWithWings(), quackBehavior: CQuackBehavior(), danceBehavior: DanceTheWalts())
    }
    
    override func display() {
        print("I'm mallar duck")
    }
}

class RedheadDuck: Duck {
    init() {
        super.init(flyBehavior: FlyWithWings(), quackBehavior: CQuackBehavior(), danceBehavior: DanceTheMinuet())
    }
    
    override func display() {
        print("I'm redhead duck")
    }
}

class DecoyDuck: Duck {
    init() {
        super.init(flyBehavior: FlyNoWay(), quackBehavior: QueackMute(), danceBehavior: DanceNoWay())
    }
    
    override func display() {
        print("I'm decoy duck")
    }
}

class RubberDuck: Duck {
    init() {
        super.init(flyBehavior: FlyNoWay(), quackBehavior:   SqueakQuack(), danceBehavior: DanceNoWay())
    }
    
    override func display() {
        print("I'm rubber duck")
    }
}

class ModelDuck: Duck {
    init() {
        super.init(flyBehavior: FlyNoWay(), quackBehavior: CQuackBehavior(), danceBehavior: DanceNoWay())
    }
    
    override func display() {
        print("I'm model duck")
    }
}

func drawDuck(duck: Duck) {
    duck.display()
}

func playWithDuck(duck: Duck) {
    drawDuck(duck: duck)
    duck.quack()
    duck.fly()
    duck.fly()
    duck.dance()
    print("")
}

var mallarDuck = MallarDuck()
playWithDuck(duck: mallarDuck)

var redheadDuck = RedheadDuck()
playWithDuck(duck: redheadDuck)

var rubberDuck = RubberDuck()
playWithDuck(duck: rubberDuck)

var decoyDuck = DecoyDuck()
playWithDuck(duck: decoyDuck)

var modelDuck = ModelDuck()
playWithDuck(duck: modelDuck)

modelDuck.setFlyBehavior(flyBehavior: FlyWithWings())
playWithDuck(duck: modelDuck)


