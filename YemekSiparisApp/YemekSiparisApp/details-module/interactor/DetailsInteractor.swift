//
//  DetailsInteractor.swift
//  YemekSiparisApp
//
//  Created by Macbook on 31.03.2022.
//

import Foundation
import Alamofire

class DetailsInteractor :PresenterToInteractorDetailsProtocol {
    
    func addFoodToBasket(food: Yemekler, username:String, count:Int) {
        let parameters:Parameters=["yemek_adi":food.yemek_adi!,"yemek_resim_adi":food.yemek_resim_adi!,"yemek_fiyat":food.yemek_fiyat!,"yemek_siparis_adet":count,"kullanici_adi":username]
        AF.request("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php", method: .post,parameters:parameters).response{
            response in
            if let data = response.data {
                do{
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]{
                        print(json)
                    }
                }catch{
                    
                }
            }
        }
    }
}
