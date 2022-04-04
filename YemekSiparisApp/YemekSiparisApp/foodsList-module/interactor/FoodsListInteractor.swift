//
//  FoodsListInteractor.swift
//  YemekSiparisApp
//
//  Created by Macbook on 30.03.2022.
//

import Foundation
import Alamofire

class FoodsListInteractor : PresenterToInteractorFoodsListProtocol {
    
    var foodsListPresenter: InteractorToPresenterFoodsListProtocol?
    
    func getFoodsList() {
        AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php", method: .get).response{
        response in
        if let data = response.data {
            do {
                let cevap = try JSONDecoder().decode(YemeklerCevap.self, from: data)
                if let gelenListe = cevap.yemekler {
                    self.foodsListPresenter?.sendDataToPresenter(foodsList: gelenListe)
                }
            }catch {
                print(error.localizedDescription)
            }
        }
    }
    }
    
    
}
