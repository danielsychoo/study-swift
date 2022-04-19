//
//  CodePushedViewController.swift
//  1-5-DataForwardingExample
//
//  Created by sungyeopTW on 2022/04/18.
//

import UIKit

// 1. delegate를 위한 protocol 작성
protocol SendDataDelegate: AnyObject {
    func sendData(name: String)
}

class CodePushedViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    var name: String?
    
    // 2. delegate는 앞에 weak키워드를 사용해야함
    // 사용하지 않으면 강한참조로 메모리 누수 발생
    weak var delegate: SendDataDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = name {
            self.nameLabel.text = name
            self.nameLabel.sizeToFit() // text사이즈에 맞추어 키움
        } else { return }
    }

    @IBAction func tabBackButton(_ sender: UIButton) {
        // 3. 데이터 전달
        // 데이터를 전달받을 ViewController에서 SendDataDelegate protocol을 채택하고
        // delegate를 위임받게되면, protocol을 채택한 ViewController에서
        // delagate.sendData가 실행되게 된다.
        self.delegate?.sendData(name: "Choo")
        
        self.navigationController?.popViewController(animated: true)
    }
}
