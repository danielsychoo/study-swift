//
//  SeguePushedViewController.swift
//  1-5-DataForwardingExample
//
//  Created by sungyeopTW on 2022/04/19.
//

import UIKit

protocol SendDataFromSegueDelegate: AnyObject {
    func sendData(name: String)
}

class SeguePushedViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    var name: String?
    
    weak var delegate: SendDataFromSegueDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = name {
            self.nameLabel.text = name
            self.nameLabel.sizeToFit()
        } else { return }
    }
    
    @IBAction func tabBackButton(_ sender: UIButton) {
        self.delegate?.sendData(name: "Yuna")
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
