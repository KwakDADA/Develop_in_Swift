import Foundation

let ball = OvalShape(width: 40, height: 40)

let barrierWidth = 300.0
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
    ball.onCollision
    
    scene.add(ball)
}

fileprivate func setupBarrier() {
    barrier.fillColor = .brown
    barrier.lineColor = .black
    barrier.lineThickness = 2
    barrier.position = Point(x: 200, y: 150)
    barrier.hasPhysics = true
    barrier.isImmobile = true
    scene.add(barrier)
}

fileprivate func setupFunnel() {
    funnel.fillColor = .gray
    funnel.lineColor = .black
    funnel.lineThickness = 2
    funnel.position = Point(x: 200, y: scene.height - 24)
    funnel.onTapped = dropBall
    scene.add(funnel)
}

func setupTarget() {
    target.fillColor = .magenta
    target.lineColor = .black
    target.lineThickness = 2
    target.position = Point(x: 200, y: 400)
    target.hasPhysics = true
    target.isImmobile = true
    target.isImpermeable = false
    scene.add(target)
}

func setup() {
    setupBall()
    
    setupBarrier()
    
    setupFunnel()
    
    setupTarget()
}