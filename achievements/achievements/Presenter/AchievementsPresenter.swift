//
//  AchievementsPresenter.swift
//  achievements
//
//  Created by jhonathan on 3/31/18.
//  Copyright © 2018 home. All rights reserved.
//

import Foundation

class AchievementsPresenter: AchievementsPresentation {
    
    weak var view: AchievementsView!
    var interactor: AchievementsTasks!
    var list: [Achievements] = [] {
        didSet {
            if list.count > 0 {
                view.showAchievementsList(list)
            } else {
                view.showErrorScreen()
            }
        }
    }
    
    func viewDidLoad() {
        interactor.fetchAchievements()
    }
}

extension AchievementsPresenter: AchievementsInteractorResult {
    
    func achievementsFetched(_ achievements: [Achievements]) {
        self.list = achievements
    }
    
    func fetchedFailed() {
        view?.showErrorScreen()
    }
}
