//
//  BasketProtocols.swift
//  YemekSiparisApp
//
//  Created by Macbook on 31.03.2022.
//

import Foundation

protocol ViewToPresenterBasketProtocol {
    var basketInteractor:PresenterToInteractorBasketProtocol?{get set}
    var basketView:PresenterToViewBasketProtocol?{get set}
    
    func getBasketList(username:String)
    func deleteFoodFromBasket(sepet_yemek_id: String, kullanici_adi: String)
}
protocol PresenterToInteractorBasketProtocol {
    var basketPresenter:InteractorToPresenterBasketProtocol?{get set}
    
    func getMyBasketList(username:String)
    func deleteFromBasket(sepet_yemek_id: String, kullanici_adi: String)
}
protocol InteractorToPresenterBasketProtocol {
    func sendDataToPresenter(basketList:Array<SepetYemekler>?)
}
protocol PresenterToViewBasketProtocol {
    func sendDataToView(basketList:Array<SepetYemekler>?)
}

protocol PresenterToRouterBasketProtocol{
    static func createModule(ref:BasketVC)
}
