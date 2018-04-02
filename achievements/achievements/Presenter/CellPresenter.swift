//
//  CellPresenter.swift
//  achievements
//
//  Created by jhonathan on 4/1/18.
//  Copyright © 2018 home. All rights reserved.
//

import UIKit

class CellPresenter: CellAchievementPresentation {
    
    weak var cellView: CellView!
    var cellInteractor: CellTasks!
    
    func imageRequest(_ achievement: Achievements) {
        cellInteractor.updateImage(achievement)
    }
    
    func progressViewDisplay(_ achievement: Achievements, view: UIView) {
        cellInteractor.updateProgressView(achievement, progressView: view)
    }
}

extension CellPresenter: CellInteractorResult {
    func imagesFetched(_ image: UIImage) {
        cellView?.showUpdateedImage(image)
    }
    
    func pregressViewUpdated(_ view: UIView) {
        cellView?.showUpdatedProgressView(view)
    }

}
