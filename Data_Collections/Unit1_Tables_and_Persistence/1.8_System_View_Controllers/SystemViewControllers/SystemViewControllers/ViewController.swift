//
//  ViewController.swift
//  SystemViewControllers
//
//  Created by 곽다은 on 1/13/24.
//

import UIKit
import SafariServices
import MessageUI

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate {
    
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func shareButtonTapped(_ sender: UIButton) {
        guard let image = imageView.image else { return }
        let activityController = UIActivityViewController(activityItems: [image, ], applicationActivities: nil)
        
        // 어느 view에 popover할 것인지 정함
        activityController.popoverPresentationController?.sourceView = sender
        // activityViewController를 화면에 나타냄
        present(activityController, animated: true, completion: nil)
    }
    
    @IBAction func safariButtonTapped(_ sender: UIButton) {
        if let url = URL(string: "https://www.apple.com") {
            let safariViewController = SFSafariViewController(url: url)
            present(safariViewController, animated: true, completion: nil)
        }
    }
    
    @IBAction func cameraButtonTapped(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let alertController = UIAlertController(title: "Choose Image Source", message: nil, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: { action in
                imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true, completion: nil)
            })
            alertController.addAction(cameraAction)
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default, handler: { action in
                imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true, completion: nil)
            })
            alertController.addAction(photoLibraryAction)
        }
        
        alertController.popoverPresentationController?.sourceView = sender
        present(alertController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else { return }
        
        imageView.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func emailButtonTapped(_ sender: UIButton) {
        guard MFMailComposeViewController.canSendMail() else {
            print("Can not send email")
            return
        }
        
        let mailComposer = MFMailComposeViewController()
        mailComposer.mailComposeDelegate = self
        
        mailComposer.setToRecipients(["dlcksgur3434@gmail.com"])
        mailComposer.setSubject("안농")
        mailComposer.setMessageBody("케헤헤 바보야", isHTML: false)
        
        if let image = imageView.image,
           let jpegData = image.jpegData(compressionQuality: 0.9) {
            mailComposer.addAttachmentData(jpegData, mimeType: "image/jpeg", fileName: "cat.jpg")
        }
        
        present(mailComposer, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func messageButtonTapped(_ sender: UIButton) {
        guard MFMessageComposeViewController.canSendText() else { return }
        
        let messageComposer = MFMessageComposeViewController()
        messageComposer.messageComposeDelegate = self
        
        messageComposer.recipients = ["01054633912"]
        messageComposer.body = "방봉"
        
        if let image = imageView.image,
           let jpegData = image.jpegData(compressionQuality: 0.9) {
            messageComposer.addAttachmentData(jpegData, typeIdentifier: "image/jpeg", filename: "babo.jpg")
        }
        
        present(messageComposer, animated: true, completion: nil)
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        dismiss(animated: true, completion: nil)
    }
    
}

