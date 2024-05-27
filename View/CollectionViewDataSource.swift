//
//  CollectionViewDataSource.swift
//  JobTrackMacro5
//
//  Created by Giovanna Micher on 23/05/24.
//

import UIKit

class CollectionViewDataSource: NSObject, UICollectionViewDataSource {
    let jobListVC = JobListVC()
    
    var jobs = [Job]() {
        didSet {
            //jobsCollectionView.reloadData()
            jobListVC.jobsCollectionView.reloadData()
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return jobs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? JobCollectionViewCell else { fatalError("Unable to dequeue cells") }

        cell.setJob(jobs[indexPath.item])
        //cell.indexPath = indexPath
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: JobCollectionViewCell.reuseID, for: indexPath) as? JobCollectionViewCell else {
//            return UICollectionViewCell()
//        }
//        
//        let job = jobs?[indexPath.row]
////        
////        let image: UIImage?
////        if let photo = job?.ph
//        
////        cell.configureTexts(jobName: job?.name ?? "erro",
////                            companyName: job?.companyName ?? "erro",
////                            situation: job?.status ?? "erro",
////                            position: job?.position ?? "erro")
//        
//        cell.configureTexts(jobName: job?.name ?? "erro",
//                            companyName: job?.companyName ?? "erro",
//                            situation: job?.status ?? "erro")
//        
//
//        return cell
//    }
    
}
