import UIKit
import PlaygroundSupport

let liveViewFrame = CGRect(x: 0, y:0, width: 500, height: 500)
let liveView = UIView(frame: liveViewFrame)
liveView.backgroundColor = .white
let liveViewCenter = liveView.center

let smallFrame = CGRect(x: 0, y: 0, width: 100, height: 100)
let square = UIView(frame: smallFrame)
square.backgroundColor = .purple

PlaygroundPage.current.liveView = liveView

liveView.addSubview(square)

//UIView.animate(withDuration: 3.0, animations: {
//    square.backgroundColor = .orange
//    square.frame = CGRect(x: liveViewFrame.width / 2 - 100, y: liveViewFrame.height / 2 - 100, width: 200, height: 200)
//}) { _ in
//    UIView.animate(withDuration: 3.0) {
//        square.backgroundColor = .purple
//        square.frame = smallFrame
//    }
//}

//UIView.animate(withDuration: 3.0, delay: 2.0, options: [.repeat], animations: {
//    square.backgroundColor = .orange
//    square.frame = CGRect(x: 400, y: 400, width: 100, height: 100)
//}, completion: nil)

//UIView.animate(withDuration: 1.3, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.3, options: [], animations: {
//    square.frame = CGRect(x: 150, y: 150, width: 200, height: 200)
//}, completion: nil)

UIView.animate(withDuration: 2.0, animations: {
    square.backgroundColor = .orange
    
    let scaleTransform = CGAffineTransform(scaleX: 2.0, y: 2.0)
    let rotateTransform = CGAffineTransform(rotationAngle: .pi)
    let translateTransform = CGAffineTransform(translationX: 200, y: 200)
    let comboTransform = scaleTransform.concatenating(rotateTransform).concatenating(translateTransform)
    
    square.transform = comboTransform
}) { (_) in
    UIView.animate(withDuration: 2.0, animations: {
        square.transform = CGAffineTransform.identity
    })
}
