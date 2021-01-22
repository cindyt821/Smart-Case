//
//  ViewController.swift
//  SmartCase
//
//  Created by CINDY TANG on 1/21/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var SignInFacebook: UIButton!
    @IBOutlet weak var SignInGoogle: UIButton!
    @IBOutlet weak var SignInEmail: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func SignInEmail(_ sender: Any) {
        print("sign with email")
    }
    
}

