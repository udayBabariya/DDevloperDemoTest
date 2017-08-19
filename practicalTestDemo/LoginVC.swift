//
//  LoginVC.swift
//  practicalTestDemo
//
//  Created by uday on 8/18/17.
//  Copyright © 2017 uday. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var tfUsername: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiDesign()
        tfUsername.delegate = self
        tfPassword.delegate = self
                
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        self.navigationController?.setNavigationBarHidden(true, animated: false)
//    }

    func uiDesign() {
        btnLogin.layer.cornerRadius = 3
        imgLogo.layer.cornerRadius = 3
        imgLogo.layer.masksToBounds = true
    }
    
    @IBAction func onLogin(_ sender: Any) {
        if tfUsername.text == "" {
            showAlert(title: "Oops!", message: "Please Enter Username....")
            return
        }
        if tfPassword.text == "" {
            showAlert(title: "Oops!", message: "Please Enter Password....")
            return
        }
        pushHomeVC()
    
    }
    
    func pushHomeVC(){
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let homeVC = storyBoard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        self.navigationController?.pushViewController(homeVC, animated: true)
        
    }
    
    func showAlert(title: String,message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actionOK = UIAlertAction(title:"OK", style: .default, handler: nil)
        alert.addAction(actionOK)
        self.present(alert, animated: true, completion: nil)
    }
    
    func checkCredintials() {
        
    }
    

}


extension LoginVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}







