//
//  SecondViewController.swift
//  1-4-ViewControllerLifeCycleExample
//
//  Created by sungyeopTW on 2022/04/17.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Second ViewController의 view가 load 되었습니다.")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Second ViewController의 View가 출력될 것입니다.")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Second ViewController의 View가 출력 되었습니다.")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Second ViewController의 View가 사라질 것입니다.")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Second ViewController의 View가 사라졌습니다.")
    }

    @IBAction func tabBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
