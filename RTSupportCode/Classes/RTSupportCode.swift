//
//  RTSupportCode.swift
//  RTSupportCode
//
//  Created by Ryan Thomas on 10/14/16.
//  Copyright © 2016 ryanphillipthomas. All rights reserved.
//

public protocol RTSupportCodeDelegate: class {
    func supportCodeEnteredSuccessfully()
}

import Foundation

public final class RTSupportCode {
    
    weak public static var delegate:RTSupportCodeDelegate?
    
    private class func savedCode() -> String {
        let prefs = UserDefaults.standard
        guard let savedCode = prefs.string(forKey:"SupportCode")
            else {
                return ""
        }
        
        return savedCode
    }
    
    public class func process(url:URL) {
        if url.host?.caseInsensitiveCompare("SupportCode") == .orderedSame {
            displaySupportCodeAlertView(url: url)
        }
    }
    
    private class func setCode(enteredCode:String) {
        let prefs = UserDefaults.standard
        prefs.setValue(enteredCode, forKey: "SupportCode")
    }
    
    public class func matches(code:String) -> Bool {
        let savedCode = self.savedCode()
        return code.caseInsensitiveCompare(savedCode) == .orderedSame
    }
    
   public class func displaySupportCodeAlertView(url:URL? = nil) {

    let alertController = UIAlertController(title: "Support Code", message: "", preferredStyle: .alert)
    
    alertController.addAction(UIAlertAction(title: "Apply", style: .default, handler: {
        alert -> Void in
        for code in RTSupportCodeConfiguration.sharedConfiguration.currentCodes
            {
                if let textField = alertController.textFields![0] as UITextField!
                {
                    if textField.text == code {
                        setCode(enteredCode: code)
                        self.delegate?.supportCodeEnteredSuccessfully()
                        displayRestartView()
                    }
                }
            }
    }))
    
    alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
    
    alertController.addTextField(configurationHandler: {(textField : UITextField!) -> Void in
        let textField = alertController.textFields![0] as UITextField
        
        
        var preEnteredCode = ""
        
        if let url = url {
            preEnteredCode = url.lastPathComponent
        }
        
        if preEnteredCode.count > 0 {
            textField.text = preEnteredCode
        } else {
            let savedCode = self.savedCode()
            if savedCode.count > 0 {
                textField.text = savedCode
            } else {
                textField.placeholder = "Enter your support code"
            }
        }
        
    })
    let rootViewController = UIApplication.shared.keyWindow?.rootViewController
    rootViewController?.present(alertController, animated: true, completion: nil)
    }
    
    private class func displayRestartView() {
        let vc = RTSupportCodeRestartViewController()
        vc.enteredCode = savedCode()
        
        let rootViewController = UIApplication.shared.keyWindow?.rootViewController
        rootViewController?.present(vc, animated: true, completion: nil)
    }
}
