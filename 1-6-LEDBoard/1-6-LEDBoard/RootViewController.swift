//
//  ViewController.swift
//  1-6-LEDBoard
//
//  Created by sungyeopTW on 2022/04/19.
//

import UIKit

class RootViewController: UIViewController, LEDBoardSettingsDelegate {
    @IBOutlet weak var contentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contentLabel.text = "" // 초기설정
        self.contentLabel.textColor = .yellow // 초기설정
    }
    
    // segue로 화면전환 했으므로
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsViewConroller = segue.destination as? SettingsViewController else { return }
        
        settingsViewConroller.delegate = self // 전달받기 위한 위임
        
        settingsViewConroller.ledText = self.contentLabel.text // 전달
        settingsViewConroller.textColor = self.contentLabel.textColor // 전달
        settingsViewConroller.backGroundColor = self.view.backgroundColor ?? .black // 전달
    }
    
    // Delegate에 정의한 함수
    func handleChangeSetting(text: String?, textColor: UIColor, backGroundColor: UIColor) {
        if let text = text {
            self.contentLabel.text = text
        } else { return }
        
        self.contentLabel.textColor = textColor
        self.view.backgroundColor = backGroundColor
    }
    
}

