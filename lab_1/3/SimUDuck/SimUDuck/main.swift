import Foundation


typealias DanceStrategy = (Int) -> Void
typealias FlyStrategy = () -> Void
typealias QuackStrategy = () -> Void

func makeFlyWithWings() -> FlyStrategy {
    var flightCounter = 0
    func incrementer() -> Void {
        flightCounter += 1
        print("I'm flying with wings \(flightCounter)\n")
    }
    return incrementer
    
}

func flyNoWay() {}

func quack() {
    print("Quack Quack!!!/n")
}

func squeakBehavior() {
    print("Squeek!!!/n")
}

func muteQuackBehavior() {
    print("...\n")
}

func danceWaltz(speed: Int) {
    print("Dance waltz, speed: \(speed)")
}

func danceMinuet(speed: Int) {
    print("Dance minuet, speed: \(speed)")
}

func dontDance(speed: Int) {
    print("Don't dance")
}

class Duck {
    init(danceBehavior: @escaping DanceStrategy, flyBehavior: @escaping FlyStrategy, quackBehavior: @escaping QuackStrategy) {
        self.danceBehavior = danceBehavior
        self.flyBehavior = flyBehavior
        self.quackBehavior = quackBehavior
    }
    
    private(set) var danceBehavior: DanceStrategy
    private(set) var flyBehavior: FlyStrategy
    private(set) var quackBehavior: QuackStrategy
    
    func swim() {
        print("I'm swimming")
    }

    func dance(speed: Int) {
        danceBehavior(speed)
    }

    func fly() {
        flyBehavior()
    }

    func makeNoise() {
        quackBehavior()
    }
    
    func display() {}
    
}

class MallardDuck : Duck {
    init() {
        super.init(danceBehavior: danceWaltz, flyBehavior: makeFlyWithWings(), quackBehavior: quack)
    }
    override func display() {
        print("I'm mallard duck\n")
    }
}

class RedheadDuck: Duck {
    init() {
        super.init(danceBehavior: danceMinuet, flyBehavior: makeFlyWithWings(), quackBehavior: quack)
    }
    override func display() {
        print("I'm redhead duck\n")
    }
}

class DecoyDuck: Duck {
    init() {
        super.init(danceBehavior: dontDance, flyBehavior: flyNoWay, quackBehavior: muteQuackBehavior)
    }
    override func display() {
        print("I'm decoy duck\n")
    }
}

class RubberDuck: Duck {
    init() {
        super.init(danceBehavior: dontDance, flyBehavior: flyNoWay, quackBehavior: squeakBehavior)
    }
    override func display() {
        print("I'm rubber duck\n")
    }
}

class ModelDuck: Duck {
    init() {
        super.init(danceBehavior: dontDance, flyBehavior: flyNoWay, quackBehavior: quack)
    }
    override func display() {
        print("I'm model duck\n")
    }
}

func displayDuck(duck: Duck) {
    duck.display()
}

func playWithDuck(_ duck: Duck) {
    duck.display()
    duck.makeNoise()
    duck.fly()
    duck.fly()
    duck.fly()
    duck.dance(speed: 10)
    print("\n")
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


