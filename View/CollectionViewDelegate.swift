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
    
//    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemsAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
//        
//        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ in
//
//            let edit = UIAction(title: "Edit", image: UIImage(systemName: "square.and.pencil")) { [weak self] _ in guard let self = self else { return }
//                let vc = JobListVC()
//                vc.enableEditing(for: self.jobs[indexPath.item])
//                vc.isEditingEnabled = true
//                vc.jobDelegate = self
//                self.present(vc, animated: true)
//            }
//
//            let delete = UIAction(
//                title: "Delete",
//                image: UIImage(systemName: "trash"),
//                attributes: .destructive
//            ) { [weak self] _ in
//                guard let self = self else { return }
//                let ac = UIAlertController(
//                    title: "Are you sure you want to delete this job?",
//                    message: nil,
//                    preferredStyle: .alert
//                )
//
//                ac.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (_) in
//                    return
//                }))
//
//                ac.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: {  _ in
//                    self.deleteDelegate.deleteTapped(at: self.companies[indexPath.item])
//                }))
//
//                self.present(ac, animated: true)
//            }
//
//            return UIMenu(title: "", children: [edit, delete])
//        }
//    }
    
    func pushView(jobs: Job) {
        let vc = JobInformationVC() //view de cada componente
        vc.jobs = jobs
        self.controller?.navigationController?.pushViewController(vc, animated: true)
    }
}
