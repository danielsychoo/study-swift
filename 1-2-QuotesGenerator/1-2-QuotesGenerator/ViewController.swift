//
//  ViewController.swift
//  1-2-QuotesGenerator
//
//  Created by sungyeopTW on 2022/04/11.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRandomQoutes(quoteLabel, nameLabel)
    }

    @IBAction func tabQuoteGeneratorButton(_ sender: Any) {
        getRandomQoutes(quoteLabel, nameLabel)
    }
}

