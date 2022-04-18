//
//  ViewController.swift
//  1-5-DataForwardingExample
//
//  Created by sungyeopTW on 2022/04/18.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tabCodePushButton(_ sender: UIButton) {
        guard let codePushedViewController = self.storyboard?.instantiateViewController(withIdentifier: "CodePushedViewController") else { return }
        
        self.navigationController?.pushViewController(codePushedViewController, animated: true)
    }
    
    @IBAction func tabCodePresentButton(_ sender: UIButton) {
        guard let codePresentedViewController = self.storyboard?.instantiateViewController(withIdentifier: "CodePresentedViewController") else { return }
        
        self.present(codePresentedViewController, animated: true, completion: nil)
    }
    
}

