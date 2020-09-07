import Foundation

class FlyBehavior {
    func fly() {}
}

class FlyWithWings: FlyBehavior {
    var flightCounter: Int16 = 0
    
    override func fly() {
        flightCounter += 1
        print("I'm flying with wings for the \(flightCounter) time(s) /n")
    }
    
}

class FlyNoWay: FlyBehavior {
    override func fly() {}
}

class QuackBehavior {
    func quack() {}
}

class Quack: QuackBehavior {
    override func quack() {
        print("Quack Quack/n")
    }
}

class SqueakBehavior: QuackBehavior {
    override func quack() {
        print("Squeak")
    }
}

class MuteQuackBehavior: QuackBehavior {
    override func quack() {}
}

class DanceBehaior {
    func dance() {}
}

class DanceWaltz: DanceBehaior {
    override func dance() {
        print("I'm dancing waltz")
    }
}

class DanceTheMinuet: DanceBehaior {
    override func dance() {
        print("I'm dancing minuet")
    }
}

class DanceNoWay: DanceBehaior {
    override func dance() {}
}

class Duck {
    init() {
        
    }
    
    private(set) var flyBehavior: FlyBehavior
    private(set) var quackBehavior: QuackBehavior
    private(set) var danceBehavior: DanceBehaior
    
}
