//
//  ViewController.swift
//  FlashCards
//
//  Created by C4Q on 2/13/18.
//  Copyright © 2018 QI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func createTestUser(_ sender: UIButton) {
        
        AuthenticationService.createUser(email: "newSmile@sunshine.com", password: "wegwowego", completion: { (user) in
            
        }) { (error) in
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

