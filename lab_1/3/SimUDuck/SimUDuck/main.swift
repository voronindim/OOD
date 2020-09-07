import Foundation


typealias Strategy = () -> Void

func flyWithWings() {
    print("I'm flying with wings!!/n")
}

func flyNoWay() {}

func quack() {
    print("Quack Quack!!!/n")
}

func squeakBehavior() {
    print("Squeek!!!/n")
}

func muteQuackBehavior() {
    print(".../n")
}

func danceWaltz() {
    print("Dance waltz")
}

func danceMinuet() {
    print("Dance minuet")
}

func dontDance() {
    print("Don't dance")
}

class Duck {
    init(danceBehavior: @escaping Strategy, flyBehavior: @escaping Strategy, quackBehavior: @escaping Strategy) {
        self.danceBehavior = danceBehavior
        self.flyBehavior = flyBehavior
        self.quackBehavior = quackBehavior
    }
    
    private(set) var danceBehavior: Strategy
    private(set) var flyBehavior: Strategy
    private(set) var quackBehavior: Strategy
    
    func swim() {
        print("I'm swimming")
    }
//
//    func dance() {
//        danceBehavior()
//    }
//
//    func fly() {
//        flyBehavior()
//    }
//
//    func makeNoise() {
//        quackBehavior()
//    }
    
    func display() {}
    
}

class MallardDuck : Duck {
    init() {
        super.init(danceBehavior: danceWaltz, flyBehavior: flyWithWings, quackBehavior: quack)
    }
    override func display() {
        print("I'm mallard duck/n")
    }
}

class RedheadDuck: Duck {
    init() {
        super.init(danceBehavior: danceMinuet, flyBehavior: flyWithWings, quackBehavior: quack)
    }
    override func display() {
        print("I'm redhead duck/n")
    }
}

class DecoyDuck: Duck {
    init() {
        super.init(danceBehavior: dontDance, flyBehavior: flyNoWay, quackBehavior: muteQuackBehavior)
    }
    override func display() {
        print("I'm decoy duck/n")
    }
}

class RubberDuck: Duck {
    init() {
        super.init(danceBehavior: dontDance, flyBehavior: flyNoWay, quackBehavior: squeakBehavior)
    }
    override func display() {
        print("I'm rubber duck/n")
    }
}

class ModelDuck: Duck {
    init() {
        super.init(danceBehavior: dontDance, flyBehavior: flyNoWay, quackBehavior: quack)
    }
    override func display() {
        print("I'm model duck/n")
    }
}

func displayDuck(duck: Duck) {
    duck.display()
}

func playWithDuck(_ duck: Duck) {
    duck.display()
    duck.quackBehavior()
    duck.flyBehavior()
    duck.danceBehavior()
    print("/n")
}

let mallarDuck = MallardDuck()
playWithDuck(mallarDuck)

let redHeadDuck = RedheadDuck()
playWithDuck(redHeadDuck)

let rubberDuck = RubberDuck()
playWithDuck(rubberDuck)

let decoyDuck = DecoyDuck()
playWithDuck(decoyDuck)

let modelDuck = ModelDuck()
playWithDuck(modelDuck)


