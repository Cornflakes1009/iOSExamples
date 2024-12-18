//
//  ViewController.swift
//  AutoLayoutCalculator
//
//  Created by Harold on 4/23/18.
//  Copyright © 2018 harold. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var screenLabel: UILabel!
    var firstNum: Int = 0
    var secondNum: Int = 0
    var mathSymbol: String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clearPressed(_ sender: Any) {
        screenLabel.text = "0"
    }
    
    
    @IBAction func numButton(_ sender: UIButton) {
        if screenLabel.text == "0" {
            screenLabel.text = ""
            screenLabel.text = screenLabel.text! + String(sender.tag - 1)
        } else {
            screenLabel.text = screenLabel.text! + String(sender.tag - 1)
            
        }
        
        func updateNumbers () {
            if firstNum == 0 {
                
            }
        }
        
    }
    
    
    
}



























