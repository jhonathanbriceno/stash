//
//  AchievementsInteractor.swift
//  achievements
//
//  Created by jhonathan on 3/31/18.
//  Copyright © 2018 home. All rights reserved.
//

import Foundation

class AchievementInteractor: AchievementsTasks {
    
    weak var result: AchievementsInteractorResult!
    
    func fetchAchievements() {
        
        if let path = Bundle.main.path(forResource: "achievements", ofType: "json") {
            do {
                let decoder = JSONDecoder()
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let achmnt = try decoder.decode(Achievement.self, from: data)
                result.achievementsFetched(achmnt.achievements)
            } catch let error {
                print(error)
                result.fetchedFailed()
            }
        }
    }
}
