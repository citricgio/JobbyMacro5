//
//  CollectionViewDataSource.swift
//  JobTrackMacro5
//
//  Created by Giovanna Micher on 23/05/24.
//

import UIKit

class CollectionViewDataSource: NSObject, UICollectionViewDataSource {
    var jobs: [Job]?

    init(jobs: [Job]? = nil) {
        self.jobs = jobs
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return jobs?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: JobCell.reuseID, for: indexPath) as? JobCell else {
            return UICollectionViewCell()
        }
        
        let job = jobs?[indexPath.row]
//        
//        let image: UIImage?
//        if let photo = job?.ph
        
        cell.configureTexts(jobName: job?.name ?? "erro",
                            companyName: job?.companyName ?? "erro",
                            situation: job?.status ?? "erro")

        return cell
    }
}
