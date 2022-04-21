//
//  SettingsViewController.swift
//  1-6-LEDBoard
//
//  Created by sungyeopTW on 2022/04/20.
//

import UIKit

protocol LEDBoardSettingsDelegate: AnyObject {
    func handleChangeSetting(text: String?, textColor: UIColor, backGroundColor: UIColor)
}

class SettingsViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var purpleButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var blackButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var orangeButton: UIButton!
    
    weak var delegate: LEDBoardSettingsDelegate?
    var textColor: UIColor = .yellow
    var backGroundColor: UIColor = .black
    var ledText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
    
    // 텍스트 색상 설정하는 세 색상버튼 연결
    @IBAction func tabTextColorButton(_ sender: UIButton) {
        let colorFromButton = getColorFromButton(sender)
        
        self.changeTextColor(color: colorFromButton)
        self.textColor = colorFromButton
    }
    
    // 배경 색상 설정하는 세 색상버튼 연결
    @IBAction func tabBackGroundColorButton(_ sender: UIButton) {
        let colorFromButton = getColorFromButton(sender)
        
        self.changeBackGroundColor(color: colorFromButton)
        self.backGroundColor = colorFromButton
    }
    
    // sender를 통해 색상 반환
    private func getColorFromButton(_ sender: UIButton) -> UIColor {
        switch sender {
        case self.blackButton:
            return .black
        case self.blueButton:
            return .blue
        case self.orangeButton:
            return .orange
        case self.yellowButton:
            return .yellow
        case self.purpleButton:
            return .purple
        default:
            return .green
        }
    }
    
    // Root ViewController에서 data전달받아 configure
    private func configureView() {
        if let ledText = self.ledText {
            self.textField.text = ledText
        } else { return }
        
        self.changeTextColor(color: self.textColor)
        self.changeBackGroundColor(color: self.backGroundColor)
    }
    
    // 선택에 따른 alpha값 변경
    private func changeTextColor(color: UIColor)
    {
        self.yellowButton.alpha = color == UIColor.yellow ? 1 : 0.2
        self.purpleButton.alpha = color == UIColor.purple ? 1 : 0.2
        self.greenButton.alpha = color == UIColor.green ? 1 : 0.2
    }
    
    // 선택에 따른 alpha값 변경
    private func changeBackGroundColor(color: UIColor) {
        self.blackButton.alpha = color == UIColor.black ? 1 : 0.2
        self.blueButton.alpha = color == UIColor.blue ? 1 : 0.2
        self.orangeButton.alpha = color == UIColor.orange ? 1 : 0.2
    }
    
    // 저장 버튼
    @IBAction func tabSaveButton(_ sender: UIBarButtonItem) {
        self.delegate?.handleChangeSetting(
            text: self.textField.text,
            textColor: self.textColor,
            backGroundColor: self.backGroundColor)
        
        self.navigationController?.popViewController(animated: true)
    }
}
