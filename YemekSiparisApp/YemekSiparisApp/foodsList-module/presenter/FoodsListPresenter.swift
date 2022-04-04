//
//  FoodsListPresenter.swift
//  YemekSiparisApp
//
//  Created by Macbook on 30.03.2022.
//

import Foundation

class FoodsListPresenter : ViewToPresenterFoodsListProtocol {
    var foodsListInteractor: PresenterToInteractorFoodsListProtocol?
    var foodsListView: PresenterToViewFoodsListProtocol?
    
    func getList() {
        foodsListInteractor?.getFoodsList()
    }
    
    
}
extension FoodsListPresenter: InteractorToPresenterFoodsListProtocol{
    func sendDataToPresenter(foodsList: Array<Yemekler>) {
        foodsListView?.sendDataToView(foodsList: foodsList)
    }
    
}
