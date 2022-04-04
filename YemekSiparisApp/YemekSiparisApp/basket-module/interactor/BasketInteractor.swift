//
//  BasketInteractor.swift
//  YemekSiparisApp
//
//  Created by Macbook on 31.03.2022.
//

import Foundation
import Alamofire

class BasketInteractor:PresenterToInteractorBasketProtocol{
    
    func deleteFromBasket(sepet_yemek_id: String, kullanici_adi: String) {
        let params: Parameters = ["sepet_yemek_id": sepet_yemek_id, "kullanici_adi": kullanici_adi]
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php", method: .post, parameters: params).responseJSON { response in
            if let data = response.data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                        print(json)
                        if let success = json["success"] as? Int {
                            if success == 1 {
                                self.getMyBasketList(username: kullanici_adi)
                            }
                        }
                    }
                } catch {
                    print(String(describing: error))
                }
            }
        }
    }
    
    var basketPresenter: InteractorToPresenterBasketProtocol?
    
    func getMyBasketList(username: String) {
            let parameters:Parameters=["kullanici_adi":username]
            AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php", method: .post,parameters:parameters).responseJSON{
                response in
                if let data = response.data {
                    do {
                        let cevap = try JSONDecoder().decode(SepetYemekCevaplar.self, from: data)
                        if let gelenListe = cevap.sepet_yemekler{
                            self.basketPresenter?.sendDataToPresenter(basketList: gelenListe)
                        }
                    }catch {
                        print(error.localizedDescription)
                    }
                }
            }
    }
}
