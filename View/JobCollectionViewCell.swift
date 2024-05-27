//
//  JobCell.swift
//  JobTrackMacro5
//
//  Created by Giovanna Micher on 20/05/24.
//

import UIKit

class JobCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = "JobCell"
    
    let container = UIView()
    
    var jobNameLabel = JTLabel(textAlignment: .center, fontSize: 16)
    var companyNameLabel = JTLabel(textAlignment: .center, fontSize: 14)
    let statusLabel = SituationLabel(variant: .active)
    var positionLabel = JTLabel(textAlignment: .center, fontSize: 14)
    var salaryLabel = JTLabel(textAlignment: .center, fontSize: 14)
    var statusLabelText = JTLabel(textAlignment: .center, fontSize: 14)
    
    
    let jobImage = JTImageView(frame: .zero)
    let divider = UIView()
    let locationLabel = JTSecondaryLabel(textAlignment: .center, fontSize: 14)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setElements()
    }
    
    func setElements() {
        configureContainer()
        configureStatusLabel()
        configureJobImage()
        configureJobNameLabel()
        configureCompanyNameLabel()
        configureDivider()
        configureLocationLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureContainer() {
        addSubview(container)
        container.layer.cornerRadius = 12
        container.layer.masksToBounds = false
        container.clipsToBounds = true
        container.backgroundColor = .systemGray5
        container.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            container.centerYAnchor.constraint(equalTo: centerYAnchor),
            container.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            container.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            container.heightAnchor.constraint(equalToConstant: 160)
        ])
    }
        
    func configureStatusLabel() {
        container.addSubview(statusLabel)
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            statusLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            statusLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 15)
        ])
    }
    
    func configureJobImage() {
        container.addSubview(jobImage)
        jobImage.translatesAutoresizingMaskIntoConstraints = false
        jobImage.layer.borderWidth = 2
        jobImage.contentMode = .scaleToFill
        jobImage.backgroundColor = .situationGreen
        
        NSLayoutConstraint.activate([
            jobImage.leadingAnchor.constraint(equalTo: statusLabel.leadingAnchor),
            jobImage.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 12),
            jobImage.heightAnchor.constraint(equalToConstant: 55),
            jobImage.widthAnchor.constraint(equalToConstant: 55)

        ])
        
    }
    
    func configureJobNameLabel() {
        container.addSubview(jobNameLabel)
        //jobNameLabel.text = "iOS Developer"
        jobNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            jobNameLabel.leadingAnchor.constraint(equalTo: jobImage.trailingAnchor, constant: 15),
            jobNameLabel.topAnchor.constraint(equalTo: jobImage.topAnchor, constant: 7)
        
        ])
        
    }
    
    func configureCompanyNameLabel() {
        //companyNameLabel.text = "Google"
        companyNameLabel.textColor = .systemGray
        companyNameLabel.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(companyNameLabel)
        
        NSLayoutConstraint.activate([
            companyNameLabel.leadingAnchor.constraint(equalTo: jobNameLabel.leadingAnchor),
            companyNameLabel.topAnchor.constraint(equalTo: jobNameLabel.bottomAnchor, constant: 10)
        ])
    }
    
    func configureDivider() {
        container.addSubview(divider)
        divider.backgroundColor = .systemGray
        divider.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            divider.topAnchor.constraint(equalTo: jobImage.bottomAnchor, constant: 15),
            divider.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            divider.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            divider.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    func configureLocationLabel() {
        container.addSubview(locationLabel)
        //locationLabel.text = "Sao jose dos campos"
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            locationLabel.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: 5),
            locationLabel.leadingAnchor.constraint(equalTo: jobImage.leadingAnchor, constant: 2)
        ])
    }
    
    func configureTexts(jobName: String, companyName: String, situation: String, position: String) {
        jobNameLabel.text = jobName
        companyNameLabel.text = companyName
        statusLabelText.text = situation
        positionLabel.text = position

    }
    
}

//#Preview {
//    JobCell()
//}
