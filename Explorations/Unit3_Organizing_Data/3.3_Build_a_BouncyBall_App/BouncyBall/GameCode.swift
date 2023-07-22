import Foundation

let ball = OvalShape(width: 40, height: 40)

var barriers: [Shape] = []

let funnelPoints = [
    Point(x: 0, y: 50),
    Point(x: 80, y: 50),
    Point(x: 60, y: 0),
    Point(x: 20, y: 0)
]
let funnel = PolygonShape(points: funnelPoints)

var targets: [Shape] = []

func dropBall() {
    ball.position = funnel.position
    ball.stopAllMotion()
    
    for target in targets {
        target.fillColor = .magenta
    }
    
    for barrier in barriers {
        barrier.isDraggable = false
    }
}

func ballCollided(with otherShape: Shape) {
    if otherShape.name != "target" { return }
    otherShape.fillColor = .green
}

func ballExitedScene() {
    var hitTargets = 0
    for target in targets {
        if target.fillColor == .green {
            hitTargets += 1
        }
    }
    if hitTargets == targets.count {
        scene.presentAlert(text: "I love you 🥰", completion: alertDismissed)
    }
    
    for barrier in barriers {
        barrier.isDraggable = true
    }
}

func alertDismissed() {
}

func resetGame() {
    ball.position = Point(x: 0, y: -80)
}

func printPosition(of shape: Shape) {
    print(shape.position)
}

/*
The setup() function is called once when the app launches. Without it, your app won't compile.
Use it to set up and start your app.

You can create as many other functions as you want, and declare variables and constants,
at the top level of the file (outside any function). You can't write any other kind of code,
for example if statements and for loops, at the top level; they have to be written inside
of a function.
*/

fileprivate func setupBall() {
    ball.fillColor = .orange
    ball.lineColor = .black
    ball.lineThickness = 2
    ball.position = Point(x: 250, y: 400)
    
    ball.hasPhysics = true
    ball.bounciness = 0.6
    
    ball.isDraggable = false
    
    ball.onCollision = ballCollided(with:)
    ball.onTapped = resetGame
    ball.onExitedScene = ballExitedScene
    
    scene.add(ball)
    scene.trackShape(ball)
}

fileprivate func addBarrier(at position: Point, width: Double, height: Double, angle: Double) {
    let barrierPoints = [
        Point(x: 0, y: 0),
        Point(x: 0, y: height),
        Point(x: width, y: height),
        Point(x: width, y: 0)
    ]
    let barrier = PolygonShape(points: barrierPoints)
    
    barrier.position = position
    barrier.angle = angle
    
    barrier.fillColor = .brown
    barrier.lineColor = .black
    barrier.lineThickness = 2
    
    barrier.hasPhysics = true
    barrier.isImmobile = true
    
    barriers.append(barrier)
    scene.add(barrier)
}

fileprivate func setupFunnel() {
    funnel.fillColor = .gray
    funnel.lineColor = .black
    funnel.lineThickness = 2
    funnel.position = Point(x: 200, y: scene.height - 24)

    scene.add(funnel)
    
    funnel.isDraggable = false
    funnel.onTapped = dropBall
}

func addTarget(at position: Point) {
    let targetPoints = [
        Point(x: 10, y: 0),
        Point(x: 0, y: 10),
        Point(x: 10, y: 20),
        Point(x: 20, y: 10)
    ]
    let target = PolygonShape(points: targetPoints)
    target.position = position
    target.name = "target"
    target.fillColor = .magenta
    target.lineColor = .black
    target.lineThickness = 2
    
    target.hasPhysics = true
    target.isImmobile = true
    target.isImpermeable = false
    target.isDraggable = false
    
    targets.append(target)
    scene.add(target)
}

func setup() {
    setupBall()
    
    addBarrier(at: Point(x: 175, y: 100), width: 80, height: 25, angle: 0.1)
    addBarrier(at: Point(x: 100, y: 150), width: 30, height: 15, angle: -0.2)
    addBarrier(at: Point(x: 325, y: 150), width: 100, height: 25, angle: 0.03)
    
    setupFunnel()
    
    addTarget(at: Point(x: 184, y: 563))
    addTarget(at: Point(x: 238, y: 624))
    addTarget(at: Point(x: 269, y: 453))
    addTarget(at: Point(x: 213, y: 348))
    addTarget(at: Point(x: 113, y: 267))
    
    resetGame()
    
    scene.onShapeMoved = printPosition(of:)
}
