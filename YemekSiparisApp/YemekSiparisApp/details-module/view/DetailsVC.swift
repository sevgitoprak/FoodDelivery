//
//  DetailsVC.swift
//  YemekSiparisApp
//
//  Created by Macbook on 30.03.2022.
//

import UIKit
import Kingfisher

class DetailsVC: UIViewController {
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailFoodNameLabel: UILabel!
    @IBOutlet weak var detailFoodPriceLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    var food:Yemekler?
    var username :String?
    var foodCount:Int?
    var foodPrice:Double?
    
    var detailsPresenterItem:ViewToPresenterDetailsProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
            username = sceneDelegate.getUserName()
        }
        
        if let f = food {
            detailFoodNameLabel.text = f.yemek_adi
            foodPrice = Double(f.yemek_fiyat!)
            detailFoodPriceLabel.text = "\(foodPrice!) ₺"
            detailImageView.kf.setImage(with: URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(f.yemek_resim_adi!)"))
        }
        
        DetailsRouter.createModule(ref: self)
    }
    
    
    @IBAction func addBasketButton(_ sender: Any) {
        
        detailsPresenterItem?.addFood(food: food!, username: username!, count: foodCount!)
        performSegue(withIdentifier: "toBasketVC", sender: nil)
    }
    
    @IBAction func stepper(_ sender: UIStepper) {
        foodCount = Int(sender.value)
        countLabel.text = "\(foodCount!) adet"
        detailFoodPriceLabel.text = "\(String(Double(foodCount!) * foodPrice!)) ₺"
    }
    
    
}
