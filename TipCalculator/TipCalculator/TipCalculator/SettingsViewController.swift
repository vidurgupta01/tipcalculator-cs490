//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Vidur Gupta on 1/21/20.
//  Copyright © 2020 Vidur Gupta. All rights reserved.
//

import UIKit

class SettingsViewController: ViewController {
    
    @IBOutlet weak var tipSegmentedCtrl: UISegmentedControl?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let defaultTip = UserDefaults.standard.value(forKey: Constants.DEFAULT_TIP) {
            self.tipSegmentedCtrl?.selectedSegmentIndex = defaultTip as! Int;
        }
    }
    
    @IBAction func tipValueChanged(_ sender: Any) {
        UserDefaults.standard.set(self.tipSegmentedCtrl?.selectedSegmentIndex as Int? ?? 0, forKey: Constants.DEFAULT_TIP);
        UserDefaults.standard.synchronize();
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
