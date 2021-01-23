//
//  ViewController.swift
//  SmartCase
//
//  Created by CINDY TANG on 1/21/21.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var SignUp: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    
    var radius = 15
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        userTextField.layer.cornerRadius = CGFloat(radius)
        passwordTextField.layer.cornerRadius = CGFloat(radius)
        signInButton.layer.cornerRadius = CGFloat(radius)
    }
    
    @IBAction func SigninAction(_ sender: Any) {
        Auth.auth().signIn(withEmail: userTextField.text!, password: passwordTextField.text!) { (user, error) in
           if error == nil{
             self.performSegue(withIdentifier: "loginToHome", sender: self)
                          }
            else{
             let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
             let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                            
              alertController.addAction(defaultAction)
              self.present(alertController, animated: true, completion: nil)
                 }
        }
    }
    

}

