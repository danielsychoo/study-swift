//
//  CodePresentedViewController.swift
//  1-5-DataForwardingExample
//
//  Created by sungyeopTW on 2022/04/18.
//

import UIKit

class CodePresentedViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = name {
            self.nameLabel.text = name
            self.nameLabel.sizeToFit() // text사이즈에 맞추어 키움
        } else { return }
    }

    @IBAction func tabBackButton(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true)
    }
}
