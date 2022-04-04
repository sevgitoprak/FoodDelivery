//
//  FoodsListRouter.swift
//  YemekSiparisApp
//
//  Created by Macbook on 30.03.2022.
//

import Foundation

class FoodsListRouter: PresenterToRouterFoodsListProtocol{
    static func createModule(ref: FoodsVC) {
        
        let presenter = FoodsListPresenter()
        
        ref.foodListPresenterItem = presenter
        ref.foodListPresenterItem?.foodsListInteractor = FoodsListInteractor()
        ref.foodListPresenterItem?.foodsListView = ref
        ref.foodListPresenterItem?.foodsListInteractor?.foodsListPresenter = presenter
    }
    
}
