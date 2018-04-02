//
//  CellInteractor.swift
//  achievements
//
//  Created by jhonathan on 4/1/18.
//  Copyright © 2018 home. All rights reserved.
//

import UIKit

class CellInteractor: CellTasks {
    
    weak var cellResult: CellInteractorResult!
    var fetchImages: [Int: UIImage] = [Int: UIImage]()

    func updateImage(_ achievement: Achievements) {
        if let savedImage = fetchImages[achievement.id] {
            cellResult.imagesFetched(savedImage)
        } else {
            guard let urlStr = URL(string: achievement.imageUrl) else { return }
            var urlRequest = URLRequest(url: urlStr)
            urlRequest.httpMethod = "GET"
            
            let session = URLSession.shared
            let task = session.dataTask(with: urlRequest, completionHandler: { [weak self] (data, response, error) in
                if let imageData = data, let image = UIImage(data: imageData) {
                    self?.fetchImages[achievement.id] = image
                    self?.cellResult.imagesFetched(image)
                }
            })
            task.resume()
        }
    }
    
    func updateProgressView(_ achievement: Achievements, progressView: UIView) {
        let height = progressView.frame.size.height
        let superViewWidth = Int(progressView.frame.size.width)
        let score = (achievement.progress * 100) / achievement.total
        let width = (score * superViewWidth) / 100
        let prgsView: UIView = {
            let view = UIView()
            view.frame = CGRect(x: 0, y: 0, width: width, height: Int(height))
            view.backgroundColor = UIColor(red: 114.0/255.0, green: 202.0/255.0, blue: 92.0/255.0, alpha: 1.0)
            return view
        }()
        cellResult.pregressViewUpdated(prgsView)
    }
}
