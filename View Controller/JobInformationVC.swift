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
    let companyName = JTLabel(label: .jobNameLabel)
    var statusLabel = SituationLabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = jobs?.name
        configureViewController()
        configureCompanyName()
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
    }
    
    func configureCompanyName() {
        companyName.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(companyName)
        companyName.text = jobs?.companyName
        
        NSLayoutConstraint.activate([
            companyName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            companyName.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
        ])
        
    }

}
