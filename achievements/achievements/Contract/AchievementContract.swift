
//
//  AchievementContract.swift
//  achievements
//
//  Created by jhonathan on 3/31/18.
//  Copyright © 2018 home. All rights reserved.
//

import Foundation
import UIKit

protocol AchievementsInteractorResult: class {
    func achievementsFetched(_ achievements: [Achievements])
    func fetchedFailed()
}

protocol AchievementsView: class {
    var presenter: AchievementsPresentation! { get set }
    func showErrorScreen()
    func showAchievementsList(_ achievements: [Achievements])
}

protocol AchievementsPresentation: class {
    func viewDidLoad()
}

protocol AchievementsTasks {
    var result: AchievementsInteractorResult! { get set }
    func fetchAchievements()
}

protocol CellInteractorResult: class {
    func imagesFetched(_ image: UIImage)
    func pregressViewUpdated(_ view: UIView)
}

protocol CellView: class {
    var cellPresenter: CellAchievementPresentation! { get set }
    func showUpdateedImage(_ image: UIImage)
    func showUpdatedProgressView(_ view: UIView)
}

protocol CellAchievementPresentation: class {
    func imageRequest(_ achievement: Achievements)
    func progressViewDisplay(_ achievement: Achievements, view: UIView)
}

protocol CellTasks {
    var cellResult: CellInteractorResult! { get set }
    func updateImage(_ achievement: Achievements)
    func updateProgressView(_ achievement: Achievements, progressView: UIView)
}
