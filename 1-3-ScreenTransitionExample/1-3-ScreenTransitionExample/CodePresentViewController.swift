//
//  CodePresentViewController.swift
//  1-3-ScreenTransitionExample
//
//  Created by sungyeopTW on 2022/04/15.
//

import UIKit

class CodePresentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tabBackButton(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
