//
//  ViewController.swift
//  RTSupportCodeSampleApp
//
//  Created by Ryan Thomas on 10/14/16.
//  Copyright © 2016 ryanphillipthomas. All rights reserved.
//

import UIKit
import RTSupportCode

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        RTSupportCode.delegate = self

        if RTSupportCode.matches(code: "QAMODE") {
            view.backgroundColor = UIColor.red
        }
    }
    
    
    @IBAction func enterSupportCodeButtonSelected(_ sender: Any) {
        RTSupportCode.displaySupportCodeAlertView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController:RTSupportCodeDelegate {
    func supportCodeEnteredSuccessfully() {
        print("successfully entered support code")
        
        if RTSupportCode.matches(code: "QAMODE") {
            print("code matches qamode!")
        }
    }
}
