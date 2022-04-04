//
//  FoodsListProtocols.swift
//  YemekSiparisApp
//
//  Created by Macbook on 30.03.2022.
//

import Foundation

protocol ViewToPresenterFoodsListProtocol {
    var foodsListInteractor:PresenterToInteractorFoodsListProtocol? {get set}
    var foodsListView:PresenterToViewFoodsListProtocol? {get set}
    
    func getList()
   
}
protocol PresenterToInteractorFoodsListProtocol {
    var foodsListPresenter:InteractorToPresenterFoodsListProtocol? {get set}
    
    func getFoodsList()
    
}

protocol InteractorToPresenterFoodsListProtocol {
    func sendDataToPresenter(foodsList:Array<Yemekler>)
}
protocol PresenterToViewFoodsListProtocol {
    func sendDataToView(foodsList:Array<Yemekler>)
}
protocol PresenterToRouterFoodsListProtocol {
    static func createModule(ref:FoodsVC)
}
