//
//  AchievementsViewController.swift
//  achievements
//
//  Created by jhonathan on 3/31/18.
//  Copyright © 2018 home. All rights reserved.
//

import UIKit

class AchievementsViewController: UIViewController {

    @IBOutlet weak var achievementTable: UITableView!
    
    var presenter: AchievementsPresentation!
    var cellRouter: CellRouter!
    var list: [Achievements] = [] {
        didSet {
            achievementTable.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
}

extension AchievementsViewController: AchievementsView {
    func showErrorScreen() {
        let alert = UIAlertController(title: "Error", message: "Something went wrong, please try again later", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAchievementsList(_ achievements: [Achievements]) {
        self.list = achievements
    }
}

extension AchievementsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            as? AchievementsCell else { fatalError("Cell does not exist") }
        
        let achievement = list[indexPath.row]
        cellRouter.routerSetDictionaries(achievement.id)
        if let tableCellPresenter = cellRouter.presenterDict[achievement.id],
            let tableCellInteractor = cellRouter.interactorDict[achievement.id] {
            tableCellPresenter.cellInteractor = tableCellInteractor
            tableCellPresenter.cellView = cell
            tableCellInteractor.cellResult = tableCellPresenter
            cell.cellPresenter = tableCellPresenter
            cell.setup(achievement)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 262.0
    }
}
