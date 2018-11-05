//
//  ViewController.swift
//  DeepLinksTest
//
//  Created by Mikhail Igonin on 08.07.2018.
//  Copyright © 2018 Mikhail Igonin. All rights reserved.
//

import UIKit
import AppSellSDK

class ViewController: UIViewController {

    let appID = "e7e600ed-54f5-45a6-95b4-726959e8e368"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func initSDK() {
        AppSellSDK.initApp(with: appID) { (error: Error?) in
            //Check for error
            self.showMessage(for: error)
        }
    }
    
    @IBAction func sendEvent() {
        AppSellSDK.sendEvent("registration") { (error) in
            self.showMessage(for: error)
        }
    }
    
    @IBAction func getReferrerID() {
        let referrerID = AppSellSDK.referrerID
        let message = "ReferrerID = \(referrerID != nil ? referrerID! : "nil")"
        
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        present(alert, animated: true, completion: nil)

    }

    func showMessage(for error: Error?) {
        let message: String

        
        if error == nil {
            message = "Success"
        } else {
            message = "Error: " + error!.localizedDescription
        }
        
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        present(alert, animated: true, completion: nil)
    }
}

