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

    let appID = "bdad341b-53a1-4cf6-ad8e-7acfcd769e0d"
    
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
        AppSellSDK.initApp(with: appID) { (error) in
            self.showMessage(for: error)
        }
    }
    
    @IBAction func sendEvent() {
        AppSellSDK.sendEvent("registration") { (error) in
            self.showMessage(for: error)
        }
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

