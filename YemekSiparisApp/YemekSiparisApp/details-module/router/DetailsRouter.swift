//
//  DetailsRouter.swift
//  YemekSiparisApp
//
//  Created by Macbook on 31.03.2022.
//

import Foundation

class DetailsRouter:PresenterToRouterDetailsProtocol{
    static func createModule(ref: DetailsVC) {
        
        ref.detailsPresenterItem = DetailsPresenter()
        ref.detailsPresenterItem?.detailsInteractor = DetailsInteractor()
    }
    
    
}
