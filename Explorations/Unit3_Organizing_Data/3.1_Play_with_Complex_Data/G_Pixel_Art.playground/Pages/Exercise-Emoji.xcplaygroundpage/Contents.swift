/*:
 ## Exercise: Emoji

 This page includes four functions that are building blocks for the basic smiley emoji. You can use them—and create others—to reproduce emoji of your own design. Start by experimenting with the built-in functions.
 
 - callout(Exercise): Try changing the arguments to each of the functions below to see how the smiley components work.
 */
//face(xPos: 13, yPos: 13, color: .green)
//leftEye(x: 22, y: 20, color: .red, blinking: false)
//rightEye(x: 16, y: 20, color: .blue, blinking: false)
//smile(x: 17, y: 16, color: .magenta)

/*:
- callout(Exercise): Once you're comfortable with the functions, comment out the lines above and complete the `Smiley` struct below. The properties have been provided for you; your task is to implement the `draw` method. When you're done, test it by creating an instance and drawing it on the display.
 */
struct Smiley {
    var x: Int
    var y: Int
    var faceColor: Color
    var eyeColor: Color
    var smileColor: Color
    var leftBlink: Bool
    var rightBlink: Bool

    func draw() {
        // Your code goes here
        face(xPos: x, yPos: y, color: faceColor)
        leftEye(x: x+9, y: y+7, color: eyeColor, blinking: leftBlink)
        rightEye(x: x+3, y: y+7, color: eyeColor, blinking: rightBlink)
        smile(x: x+4, y: y+3, color: smileColor)
    }
}

func frown(x: Int, y: Int, color: Color) {
    let pixels = [
        Pixel(x: x, y: y-1, color: color),
        Pixel(x: x+1, y: y, color: color),
        Pixel(x: x+2, y: y, color: color),
        Pixel(x: x+3, y: y, color: color),
        Pixel(x: x+4, y: y, color: color),
        Pixel(x: x+5, y: y-1, color: color)
    ]
    display.batchSetPixels(pixels)
}

struct Frowney {
    var x: Int
    var y: Int
    var faceColor: Color
    var eyeColor: Color
    var frownColor: Color
    var leftBlink: Bool
    var rightBlink: Bool

    func draw() {
        // Your code goes here
        face(xPos: x, yPos: y, color: faceColor)
        leftEye(x: x+9, y: y+7, color: eyeColor, blinking: leftBlink)
        rightEye(x: x+3, y: y+7, color: eyeColor, blinking: rightBlink)
        frown(x: x+4, y: y+4, color: frownColor)
    }
}

let emoji = Smiley(x: 13, y: 13, faceColor: .gray, eyeColor: .black, smileColor: .red, leftBlink: false, rightBlink: false)

emoji.draw()
/*:
 - callout(Challenge): Try building a new `frown` function that draws a frown at a given x and y position in a given color. Then create a `Frownie` struct that draws a new emoji with a frowning face. (To save time, you can copy the `Smiley` struct and replace the call to `smile` with a call to `frown`.)
 */
/*:
 ### Challenge: Keep Going!
 
 What other kinds of emoji can you make by playing with this same basic structure? Feel free to keep playing with faces on this page.

[Previous](@previous)  |  page 11 of 13  |  [Next: Exercise: Pixel Loops](@next)
 */

