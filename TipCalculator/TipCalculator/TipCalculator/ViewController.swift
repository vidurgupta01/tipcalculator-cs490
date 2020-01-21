//
//  ViewController.swift
//  TipCalculator
//
//  Created by Vidur Gupta on 1/15/20.
//  Copyright © 2020 Vidur Gupta. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var tipLbl: UILabel!
    @IBOutlet weak var totalLbl: UILabel!
    @IBOutlet weak var tipsSegmentedCntrl: UISegmentedControl?
    @IBOutlet weak var billAmtTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let defaultTip = UserDefaults.standard.value(forKey: Constants.DEFAULT_TIP) {
            self.tipsSegmentedCntrl?.selectedSegmentIndex = defaultTip as! Int;
        }

    }
    
    @IBAction func amtChanged(_ sender: Any) {
        
        let currencySign = NSLocale.current.currencySymbol ?? "$";
        
        let tipAmts = [0.15, 0.18, 0.20]
        
        let bill = (Double(self.billAmtTxtField.text!) ?? 0)
        
        let tipPercent = tipAmts[self.tipsSegmentedCntrl?.selectedSegmentIndex ?? 0]
        let tip = tipPercent * bill
        
        self.tipLbl.text = String(format: "%@%.2f", currencySign, tip)
        self.totalLbl.text = String(format: "%@%.2f", currencySign, tip+bill)
        
    }
    
}

