//
//  CellRouter.swift
//  achievements
//
//  Created by jhonathan on 4/1/18.
//  Copyright © 2018 home. All rights reserved.
//

import UIKit

class CellRouter {
    
    var presenterDict = [Int: CellPresenter]()
    var interactorDict = [Int: CellInteractor]()
    
    func routerSetDictionaries(_ id: Int) {
        
        if presenterDict[id] == nil {
            presenterDict[id] = CellPresenter()
            interactorDict[id] = CellInteractor()
        }
    }
}
