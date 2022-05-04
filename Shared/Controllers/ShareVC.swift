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
            print(sender.tag)
        }
    }
    

}
