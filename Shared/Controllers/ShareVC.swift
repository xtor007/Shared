//
//  ShareVC.swift
//  Shared
//
//  Created by Anatoliy Khramchenko on 04.05.2022.
//

import UIKit
import Social

class ShareVC: UIViewController {
    
    @IBOutlet var textViews: [UITextView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for textView in textViews {
            textView.layer.cornerRadius = 10
        }
    }
    
    @IBAction func share(_ sender: Any) {
        if let sender = sender as? UIButton {
            switch sender.tag {
            case 0:
                postToTwitter(textViews[sender.tag].text)
            case 1:
                postToFacebook(textViews[sender.tag].text)
            case 2:
                shareOthers(textViews[sender.tag].text)
            case 3:
                showMessage("This button don't do anything")
            default:
                showMessage("Something isn't good")
            }
        }
    }
    
    private func postToTwitter(_ message: String) {
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter) { //only iOS 10-
            if let twitterVC = SLComposeViewController(forServiceType: SLServiceTypeTwitter) {
                twitterVC.setInitialText(message)
                self.present(twitterVC, animated: true)
            } else {
                showMessage("You aren't log in Twitter or your iOS are 10-")
            }
        } else {
            showMessage("You aren't log in Twitter or your iOS are 10-")
        }
    }
    
    private func postToFacebook(_ message: String) {
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook) { //only iOS 10-
            if let facebookVC = SLComposeViewController(forServiceType: SLServiceTypeFacebook) {
                facebookVC.setInitialText(message)
                self.present(facebookVC, animated: true)
            } else {
                showMessage("You aren't log in Facebook or your iOS are 10-")
            }
        } else {
            showMessage("You aren't log in Facebook or your iOS are 10-")
        }
    }
    
    private func shareOthers(_ message: String) {
        let activityVC = UIActivityViewController(activityItems: [message], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
    }
    
    private func showMessage(_ message: String) {
        let alertVC = UIAlertController(
                    title: "Shared",
                    message: message,
                    preferredStyle: .alert
        )
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertVC.addAction(action)
        self.present(alertVC, animated: true, completion: nil)
    }
    
}
