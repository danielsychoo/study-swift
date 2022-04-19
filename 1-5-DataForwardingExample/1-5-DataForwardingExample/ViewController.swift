//
//  ViewController.swift
//  1-5-DataForwardingExample
//
//  Created by sungyeopTW on 2022/04/18.
//

import UIKit

// 5. SendDataDelegate protocol 채택
class ViewController: UIViewController, SendDataDelegate, SendDataFromSegueDelegate {
    @IBOutlet weak var nameLabel: UILabel!
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = name {
            self.nameLabel.text = name
            self.nameLabel.sizeToFit()
        } else { return }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let seguePushedViewcontroller = segue.destination as? SeguePushedViewController else { return }
        
        seguePushedViewcontroller.delegate = self
        
        seguePushedViewcontroller.name = "Yuna"
    }
    
    @IBAction func tabCodePushButton(_ sender: UIButton) {
        guard let codePushedViewController = self.storyboard?.instantiateViewController(withIdentifier: "CodePushedViewController") as? CodePushedViewController else { return }
        
        codePushedViewController.name = "Choo"
        
        // 4. delegate 위임
        codePushedViewController.delegate = self
        
        self.navigationController?.pushViewController(codePushedViewController, animated: true)
    }
        
    // 6. protocol 준수를 위해 sendData 정의
    func sendData(name: String) {
        // 7. 넘어온 data이용 로직
        self.nameLabel.text = name
        self.nameLabel.sizeToFit()
    }
}
