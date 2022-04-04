//
//  AuthenticationVC.swift
//  YemekSiparisApp
//
//  Created by Macbook on 1.04.2022.
//

import UIKit
import Firebase

class AuthenticationVC: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func signInButton(_ sender: Any) {//giriş
        if emailTextField.text != "" && passwordTextField.text != "" {
            
            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text! ) { (authdataresult, error ) in
                if error != nil {
                    self.errorMessage(titleInput: "Hata!", messageInput: error?.localizedDescription ?? "Hata Aldınız, Tekrar Deneyin!")
                }else{
                    self.performSegue(withIdentifier: "toTabBar", sender: nil)
                }
            }
        }else {
            errorMessage(titleInput: "Hata!", messageInput: "Email adı ve Parola Giriniz!")
        }
        
    }
    
    @IBAction func signUpButton(_ sender: Any) {//kayıt
        
        if emailTextField.text != "" && passwordTextField.text != "" {
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { authdataresult, error in
                if error != nil {
                    self.errorMessage(titleInput: "Hata", messageInput: error?.localizedDescription ?? "Hata Aldınız, Tekrar Deneyin")
                }else {
                    self.performSegue(withIdentifier: "toTabBar", sender: nil)
                }
            }
        }else {
            errorMessage(titleInput: "Hata!", messageInput: "Email adı ve Parola Giriniz!")
        }
    }
    func errorMessage(titleInput: String, messageInput: String){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
          self.present(alert, animated: true, completion: nil)
        
    }
    
}
