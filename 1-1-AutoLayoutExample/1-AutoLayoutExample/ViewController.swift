//
//  ViewController.swift
//  1-AutoLayoutExample
//
//  Created by sungyeopTW on 2022/04/08.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var colorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func tabChangeColorButton(_ sender: UIButton) {
        self.colorView.backgroundColor = UIColor.blue
        print("버튼이 클릭 됨")
    }
}

