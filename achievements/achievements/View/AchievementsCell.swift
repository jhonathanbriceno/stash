//
//  AchievementsCell.swift
//  achievements
//
//  Created by jhonathan on 3/31/18.
//  Copyright © 2018 home. All rights reserved.
//

import UIKit

class AchievementsCell: UITableViewCell {

    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var levelLbl: UILabel!
    @IBOutlet weak var progressView: UIView!
    @IBOutlet weak var levelView: UIView!
    @IBOutlet weak var accessibleView: UIView!
    @IBOutlet weak var currentPgrsLbl: UILabel!
    @IBOutlet weak var totalLbl: UILabel!
    var cellPresenter: CellAchievementPresentation!

    
    func setup(_ achievement: Achievements) {
        
        if achievement.accessible {
            accessibleView.isHidden = true
        } else {
            accessibleView.isHidden = false
        }
        
        levelView.layer.cornerRadius = levelView.frame.size.width/2
        levelView.clipsToBounds = true
        
        progressView.layer.cornerRadius = 10
        progressView.clipsToBounds = true
        
        levelLbl.text = achievement.level
        currentPgrsLbl.text = String(achievement.progress)+"pts"
        totalLbl.text = String(achievement.total)+"pts"
        
        cellPresenter.imageRequest(achievement)
        cellPresenter.progressViewDisplay(achievement, view: progressView)
    }
}

extension AchievementsCell: CellView {
    
    func showUpdateedImage(_ image: UIImage) {
        DispatchQueue.main.async {
            self.backgroundImage.image = image
        }
    }
    
    func showUpdatedProgressView(_ view: UIView) {
        DispatchQueue.main.async {
            self.progressView.addSubview(view)
        }
    }
}
