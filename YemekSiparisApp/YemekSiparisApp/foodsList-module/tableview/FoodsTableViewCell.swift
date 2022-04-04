//
//  FoodsTableViewCell.swift
//  YemekSiparisApp
//
//  Created by Macbook on 30.03.2022.
//

import UIKit

class FoodsTableViewCell: UITableViewCell {

    @IBOutlet weak var foodsView: UIView!
    @IBOutlet weak var foodsImageView: UIImageView!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var foodPriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setupViews() {
        foodsView.layer.cornerRadius = 20
        foodsView.layer.shadowColor = UIColor.gray.cgColor
        foodsView.layer.shadowOpacity = 0.3
        foodsView.layer.shadowOffset = CGSize.zero
        foodsView.layer.shadowRadius = 6
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
