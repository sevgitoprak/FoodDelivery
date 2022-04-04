//
//  BasketRouter.swift
//  YemekSiparisApp
//
//  Created by Macbook on 31.03.2022.
//

import Foundation

class BasketRouter:PresenterToRouterBasketProtocol{
    static func createModule(ref: BasketVC) {
        
        let presenter = BasketPresenter()
        
        ref.basketPresenterItem = presenter
        
        ref.basketPresenterItem?.basketInteractor = BasketInteractor()
        ref.basketPresenterItem?.basketView = ref
        
        ref.basketPresenterItem?.basketInteractor?.basketPresenter = presenter
    }
    
}
