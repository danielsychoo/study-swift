//
//  CodePresentedViewController.swift
//  1-5-DataForwardingExample
//
//  Created by sungyeopTW on 2022/04/18.
//

import UIKit

class CodePresentedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tabBackButton(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true)
    }
}
