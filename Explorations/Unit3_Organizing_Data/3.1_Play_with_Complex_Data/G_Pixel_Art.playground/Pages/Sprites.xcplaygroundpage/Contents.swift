/*:
## Sprites

A *sprite* is a graphic element that maintains its identity but can be placed anywhere on the screen. On this page, you'll make the person into a sprite. To do this, you'll need more flexible functions—ones that take parameters to determine their positions.
 
 To give you a head start, the `legs` function already has the required parameters. You can use the parameters to set the position of the block of pixels drawn by the function.

- callout(Exercise): Finish updating `legs`, and convert the remaining functions—including the `person` function—to be position-independent. Try placing several people on the screen using the new function.
*/
func block(x: Int, y: Int, width: Int, height: Int, color: Color) -> [Pixel] {
    var pixels = [Pixel]()
    for x in x ... x + width - 1 {
        for y in y ... y + height - 1 {
            pixels.append(Pixel(x: x, y: y, color: color))
        }
    }
    return pixels
}

func legs(_ x: Int, _ y: Int) {
    // This line needs to be modified.
    display.batchSetPixels(block(x: x, y: y, width: 2, height: 4, color: .blue))
}

func torso(_ x: Int, _ y: Int) {
    display.batchSetPixels(block(x: x-1, y: y+4, width: 4, height: 3, color: .white))
}

func head(_ x: Int, _ y: Int) {
    display.batchSetPixels(block(x: x, y: y+7, width: 2, height: 2, color: .yellow))
}

func person(_ x: Int, _ y: Int) {
    legs(x, y)
    torso(x, y)
    head(x, y)
}

person(22, 20)

//: [Previous](@previous)  |  page 7 of 13  |  [Next: But `wait()`... There's More!](@next)
