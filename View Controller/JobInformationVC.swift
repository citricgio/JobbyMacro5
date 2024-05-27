//
//  JobInformationVC.swift
//  JobTrackMacro5
//
//  Created by Giovanna Micher on 24/05/24.
//

import UIKit

class JobInformationVC: UIViewController {
    
    var jobs: Job?
    
    let coreDataController = CoreDataController.shared
    lazy var context = coreDataController.persistentContainer.viewContext
    let companyName = UILabel()
    let location = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = jobs?.name
        configureCompanyName()
        //configureJobLocation()
    }
    
    func configureCompanyName() {
        companyName.text = jobs?.companyName
        view.addSubview(companyName)
        
        NSLayoutConstraint.activate([
            companyName.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            companyName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
    }
    
//    func configureJobLocation() {
//        location.text = jobs?.address
//        view.addSubview(location)
//        
//        NSLayoutConstraint.activate([
//            location.topAnchor.constraint(equalTo: companyName.topAnchor, constant: 10),
//            location.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
//        ])
//    }


}
