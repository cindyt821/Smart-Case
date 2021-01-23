//
//  NewUserViewController.swift
//  SmartCase
//
//  Created by CINDY TANG on 1/22/21.
//

import UIKit
import FirebaseAuth

class NewUserViewController: UIViewController {

    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var retypeTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    var radius = 15
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        emailTextField.layer.cornerRadius = CGFloat(radius)
        passwordTextField.layer.cornerRadius = CGFloat(radius)
        retypeTextField.layer.cornerRadius = CGFloat(radius)
        
    }
    
    @IBAction func back() {
        dismiss(animated: true, completion: nil)
    }
   
    @IBAction func signUpAction(_ sender: Any) {
        if passwordTextField.text != retypeTextField.text {
            let alertController = UIAlertController(title: "Password does not match", message: "Please re-type password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        else{
            Auth.auth().createUser(withEmail: emailTextField.text!,
                                   password: passwordTextField.text!) {
                (user, error) in
                if error == nil {
                    self.performSegue(withIdentifier: "signuptoHome", sender: self)
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
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
