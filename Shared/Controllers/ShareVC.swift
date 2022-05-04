//
//  ShareVC.swift
//  Shared
//
//  Created by Anatoliy Khramchenko on 04.05.2022.
//

import UIKit

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
            if sender.tag == 3 {
                showMessage("This button don't do anything")
            }
        }
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
