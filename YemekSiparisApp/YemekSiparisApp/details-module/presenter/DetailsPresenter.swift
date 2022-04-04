//
//  DetailsPresenter.swift
//  YemekSiparisApp
//
//  Created by Macbook on 31.03.2022.
//

import Foundation

class DetailsPresenter:ViewToPresenterDetailsProtocol {
    var detailsInteractor: PresenterToInteractorDetailsProtocol?
    
    func addFood(food: Yemekler, username: String, count: Int) {
        detailsInteractor?.addFoodToBasket(food: food, username: username, count: count)
    }
    
    
}
