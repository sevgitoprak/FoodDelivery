//
//  BasketTableViewCell.swift
//  YemekSiparisApp
//
//  Created by Macbook on 30.03.2022.
//

import UIKit

class BasketTableViewCell: UITableViewCell {

    @IBOutlet weak var basketView: UIView!
    @IBOutlet weak var basketImageView: UIImageView!
    @IBOutlet weak var basketFoodNameLabel: UILabel!
    @IBOutlet weak var basketFoodPriceLabel: UILabel!
    @IBOutlet weak var basketFoodCount: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setupViews() {
        basketView.layer.cornerRadius = 20
        basketView.layer.shadowColor = UIColor.gray.cgColor
        basketView.layer.shadowOpacity = 0.3
        basketView.layer.shadowOffset = CGSize.zero
        basketView.layer.shadowRadius = 6
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func basketStepper(_ sender: UIStepper) {
        
    }
}
