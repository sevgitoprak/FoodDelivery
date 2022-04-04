//
//  BasketPresenter.swift
//  YemekSiparisApp
//
//  Created by Macbook on 31.03.2022.
//

import Foundation

class BasketPresenter:ViewToPresenterBasketProtocol{
    
    var basketInteractor: PresenterToInteractorBasketProtocol?
    var basketView: PresenterToViewBasketProtocol?
    
    func getBasketList(username: String) {
        basketInteractor?.getMyBasketList(username: username)
    }
    func deleteFoodFromBasket(sepet_yemek_id: String, kullanici_adi: String) {
        basketInteractor?.deleteFromBasket(sepet_yemek_id: sepet_yemek_id, kullanici_adi: kullanici_adi)
    }
}

extension BasketPresenter:InteractorToPresenterBasketProtocol{
    func sendDataToPresenter(basketList: Array<SepetYemekler>?) {
        basketView?.sendDataToView(basketList: basketList)
    }
}


