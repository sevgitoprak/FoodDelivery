//
//  DetailsProtocols.swift
//  YemekSiparisApp
//
//  Created by Macbook on 31.03.2022.
//

import Foundation

protocol ViewToPresenterDetailsProtocol {
    var detailsInteractor:PresenterToInteractorDetailsProtocol? {get set}
    func addFood(food: Yemekler, username:String, count:Int)
}
protocol PresenterToInteractorDetailsProtocol {
    func addFoodToBasket(food: Yemekler, username:String, count:Int)
}
protocol PresenterToRouterDetailsProtocol {
    static func createModule(ref:DetailsVC)
}
