//
//  AchievementsRouter.swift
//  achievements
//
//  Created by jhonathan on 3/31/18.
//  Copyright © 2018 home. All rights reserved.
//

import UIKit

class AchievementsRouter {
    
    func installRootViewControllerIntoWindow(_ window: UIWindow) {
        
        let presenter = AchievementsPresenter()
        let interactor = AchievementInteractor()

        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "AchievementsVC") as! AchievementsViewController
        presenter.interactor = interactor
        presenter.view = viewController
        interactor.result = presenter
        viewController.presenter = presenter
        viewController.cellRouter = CellRouter()
        let navigationController = window.rootViewController as! UINavigationController
        navigationController.viewControllers = [viewController]
    }
}
