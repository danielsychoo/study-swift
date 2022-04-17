//
//  ViewController.swift
//  1-4-ViewControllerLifeCycleExample
//
//  Created by sungyeopTW on 2022/04/17.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Root ViewController의 view가 load 되었습니다.")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Root ViewController의 View가 출력될 것입니다.")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Root ViewController의 View가 출력 되었습니다.")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Root ViewController의 View가 사라질 것입니다.")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Root ViewController의 View가 사라졌습니다.")
    }

    @IBAction func tabPushButton(_ sender: UIButton) {
        guard let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") else { return }
        
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
}

