//
//  CodePushViewController.swift
//  1-3-ScreenTransitionExample
//
//  Created by sungyeopTW on 2022/04/15.
//

import UIKit

class CodePushViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tabBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
