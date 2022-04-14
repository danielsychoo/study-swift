//
//  SeguePresentViewController.swift
//  1-3-ScreenTransitionExample
//
//  Created by sungyeopTW on 2022/04/14.
//

import UIKit

class SeguePresentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tabBackButton(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
