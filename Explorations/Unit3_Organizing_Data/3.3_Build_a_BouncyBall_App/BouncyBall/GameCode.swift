import Foundation

let ball = OvalShape(width: 40, height: 40)

let barrierWidth = 100.0
let barrierHeight = 25.0
let barrierPoints = [
    Point(x: 0, y: 0),
    Point(x: 0, y: barrierHeight),
    Point(x: barrierWidth, y: barrierHeight),
    Point(x: barrierWidth, y: 0)
]
let barrier = PolygonShape(points: barrierPoints)

let funnelPoints = [
    Point(x: 0, y: 50),
    Point(x: 80, y: 50),
    Point(x: 60, y: 0),
    Point(x: 20, y: 0)
]
let funnel = PolygonShape(points: funnelPoints)

let targetPoints = [
    Point(x: 10, y: 0),
    Point(x: 0, y: 10),
    Point(x: 10, y: 20),
    Point(x: 20, y: 10)
]
let target = PolygonShape(points: targetPoints)

func dropBall() {
    ball.position = funnel.position
    
    ball.stopAllMotion()
    
    barrier.isDraggable = false
}

func ballCollided(with otherShape: Shape) {
    if otherShape.name != "target" { return }
    otherShape.fillColor = .green
}

func ballExitedScene() {
    barrier.isDraggable = true
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
    scene.trackShape(ball) // onExitedScene을 사용하기 위한 line
}

fileprivate func setupBarrier() {
    barrier.fillColor = .brown
    barrier.lineColor = .black
    barrier.lineThickness = 2
    barrier.position = Point(x: 200, y: 200)
    barrier.angle = 0.2
    
    scene.add(barrier)
    
    barrier.hasPhysics = true
    barrier.isImmobile = true
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

func setupTarget() {
    target.name = "target"
    target.fillColor = .magenta
    target.lineColor = .black
    target.lineThickness = 2
    target.position = Point(x: 82, y: 402)
    
    scene.add(target)
    
    target.hasPhysics = true
    target.isImmobile = true
    target.isImpermeable = false
    target.isDraggable = false
}

func setup() {
    setupBall()
    
    setupBarrier()
    
    setupFunnel()
    
    setupTarget()
    
    resetGame()
    
    scene.onShapeMoved = printPosition(of:)
}
