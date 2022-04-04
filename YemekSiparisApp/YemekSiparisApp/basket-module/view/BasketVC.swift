//
//  BasketVC.swift
//  YemekSiparisApp
//
//  Created by Macbook on 30.03.2022.
//

import UIKit
import Kingfisher



class BasketVC: UIViewController {

    @IBOutlet weak var basketTableView: UITableView!
    @IBOutlet weak var totalPriceLabel: UILabel!
    
    
    
   
    var basketList = [SepetYemekler]()
    var basketPresenterItem:ViewToPresenterBasketProtocol?
    var username : String?
    var sceneDelegate: SceneDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if var SceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
            sceneDelegate = SceneDelegate
            username = sceneDelegate!.getUserName()
        }
        basketTableView.delegate = self
        basketTableView.dataSource = self
        basketTableView.separatorColor = UIColor(white: 0, alpha: 0)

        BasketRouter.createModule(ref: self)
    }
    override func viewWillAppear(_ animated: Bool) {
        basketPresenterItem?.getBasketList(username: username!)
    }
    
}
extension BasketVC :PresenterToViewBasketProtocol{
    func sendDataToView(basketList: Array<SepetYemekler>?) {
        if let basketFoods = basketList {
            self.basketList = basketFoods
            DispatchQueue.main.async {
                self.basketTableView.reloadData()
                var totalPrice = 0
                self.sceneDelegate!.sepetTab?.badgeValue = basketFoods.count == 0 ? nil : "\(basketFoods.count)"
                for food in basketFoods {
                    totalPrice += Int(food.yemek_siparis_adet!)! * Int(food.yemek_fiyat!)!
                }
                self.totalPriceLabel.text = "₺\(totalPrice)"
            }
            if self.basketList.count == 0 {
                let alert = UIAlertController(title: "Uyarı", message: "Sepetin şu an boş görünüyor.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Yemekleri Listele", style: .default, handler: { (action: UIAlertAction!) in
                    self.tabBarController?.selectedIndex = 0
                }))
                self.present(alert, animated: true)
            }
            }else {
                let alert = UIAlertController(title: "Hata", message: "Yemek listesi yüklenemedi! İnternet bağlantınızı kontrol ediniz.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: { (action: UIAlertAction!) in
                    self.navigationController?.popViewController(animated: true)
                }))
                self.present(alert, animated: true)
            }
        }
    }


extension BasketVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return basketList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let basketFood = basketList[indexPath.row]
        let cell = basketTableView.dequeueReusableCell(withIdentifier: "basketCell") as! BasketTableViewCell
        cell.setupViews()
        cell.basketFoodNameLabel.text = basketFood.yemek_adi
        cell.basketFoodPriceLabel.text = "\(basketFood.yemek_siparis_adet!) adet ₺\(Int(basketFood.yemek_siparis_adet!)! * (Int(basketFood.yemek_fiyat!)!))"
        cell.basketImageView.kf.setImage(with: URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(basketFood.yemek_resim_adi!)"))
        return cell
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Sil"){ (contextualAction,view,bool) in
            let basketFood = self.basketList[indexPath.row]
            self.basketPresenterItem?.deleteFoodFromBasket(sepet_yemek_id: basketFood.sepet_yemek_id!, kullanici_adi: self.username!)
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}
