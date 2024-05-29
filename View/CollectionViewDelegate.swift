//
//  CollectionViewDelegate.swift
//  JobTrackMacro5
//
//  Created by Giovanna Micher on 22/05/24.
//

import UIKit

class CollectionViewDelegate: NSObject, UICollectionViewDelegateFlowLayout {
    
    weak var dataSource: CollectionViewDataSource?
    weak var controller: JobListVC?
        
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedData = dataSource?.jobs?[indexPath.row]
        //pushView(jobs: selectedData!)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 140)
    }
    
    func pushView(jobs: Job) {
        let vc = JobInformationVC() //view de cada componente
        vc.jobs = jobs
        self.controller?.navigationController?.pushViewController(vc, animated: true)
    }
}
