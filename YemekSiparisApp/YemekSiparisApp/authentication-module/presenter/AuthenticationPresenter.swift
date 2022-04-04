//
//  AuthenticationPresenter.swift
//  YemekSiparisApp
//
//  Created by Macbook on 1.04.2022.
//

import Foundation

class AuthenticationPresenter : ViewToPresenterAuthenticationProtocol{
    var AuthenticationInteractor: PresenterToInteractorAuthenticationProtocol?
    
    func SignInWith(email: String, password: String) {
        AuthenticationInteractor?.SignIn(email: email, password: password)
    }
    
    func SignUpWith(email: String, password: String) {
        AuthenticationInteractor?.SignUp(email: email, password: password)
    }
    
    
}
