//
//  ViewController.swift
//  1-3-ScreenTransitionExample
//
//  Created by sungyeopTW on 2022/04/14.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func tabCodePushButton(_ sender: UIButton) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "CodePushViewController") else { return }
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    
    @IBAction func tabCodePresentButton(_ sender: UIButton) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "CodePresentViewController") else { return }
        
        //  viewController.modalPresentationStyle = .fullScreen // modal 전체화면
        self.present(viewController, animated: true, completion: nil)
    }
}

