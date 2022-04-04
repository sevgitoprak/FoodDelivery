//
//  FoodVC.swift
//  YemekSiparisApp
//
//  Created by Macbook on 30.03.2022.
//

import UIKit
import Kingfisher
import Firebase

class FoodsVC: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var foodsTableView: UITableView!
    
    var foodsList = [Yemekler]()
    var filteredFoods = [Yemekler]()
    var foodListPresenterItem:ViewToPresenterFoodsListProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        foodsTableView.delegate = self
        foodsTableView.dataSource = self
        foodsTableView.separatorColor = UIColor(white: 0, alpha: 0)
        FoodsListRouter.createModule(ref: self)
        
    }
    
    @IBAction func SignOutButton(_ sender: Any) {
        do{
            try Auth.auth().signOut()
            performSegue(withIdentifier: "toLoginVC", sender: nil)
        } catch {
            print("hata")
        }
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        foodListPresenterItem?.getList()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC"{
            let food = sender as? Yemekler
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.food = food
        }
    }
}

extension FoodsVC :PresenterToViewFoodsListProtocol{
    func sendDataToView(foodsList: Array<Yemekler>) {
        self.foodsList = foodsList
        DispatchQueue.main.async {
            self.foodsTableView.reloadData()
        }
    }
}
extension FoodsVC:UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.filteredFoods = self.foodsList.filter { food in
            if food.yemek_adi!.lowercased().contains(searchText.lowercased()) {
                return true
            }
            if searchText.isEmpty {
                return true
            }
            return false
        }
        self.foodsTableView.reloadData()
    }
}
extension FoodsVC:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodsList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let food = foodsList[indexPath.row]
        let cell = foodsTableView.dequeueReusableCell(withIdentifier: "foodCell") as! FoodsTableViewCell
        cell.setupViews()
        cell.foodNameLabel.text = food.yemek_adi
        cell.foodPriceLabel.text = "\(food.yemek_fiyat!) ₺"
        cell.foodsImageView.kf.setImage(with: URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(food.yemek_resim_adi!)"))
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let food = foodsList[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: food)
        foodsTableView.deselectRow(at: indexPath, animated: true)
    }
}
