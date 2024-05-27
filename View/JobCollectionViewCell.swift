//
//  JobCell.swift
//  JobTrackMacro5
//
//  Created by Giovanna Micher on 20/05/24.
//

import UIKit

class JobCell: UICollectionViewCell {
    
    static let reuseID = "JobCell"
    
    let container = UIView()
    
    var jobNameLabel = JTLabel(label: .jobNameLabel)

    var companyNameLabel = JTLabel(label: .jobCompanyNameLabel)
    let statusLabel = SituationLabel(variant: .active)
    
    var statusLabelText = JTLabel(label: .jobNameLabel)
    
    
    let logoImageView = UIImageView()
    let divider = UIView()
    
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureContainer() {
        addSubview(container)
        container.backgroundColor = .systemBackground
        container.layer.cornerRadius = 12
        container.layer.masksToBounds = false
        container.clipsToBounds = true
        container.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            container.centerYAnchor.constraint(equalTo: centerYAnchor),
            container.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            container.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            //container.heightAnchor.constraint(equalToConstant: 160)
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
        container.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.layer.borderWidth = 2
        logoImageView.contentMode = .scaleToFill
        logoImageView.backgroundColor = .situationGreen
        
        NSLayoutConstraint.activate([
            logoImageView.leadingAnchor.constraint(equalTo: statusLabel.leadingAnchor),
            logoImageView.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 12),
            logoImageView.heightAnchor.constraint(equalToConstant: 55),
            logoImageView.widthAnchor.constraint(equalToConstant: 55)

        ])
        
    }
    
    func configureJobNameLabel() {
        container.addSubview(jobNameLabel)
        jobNameLabel.text = "iOS Developer"
        jobNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            jobNameLabel.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 15),
            jobNameLabel.topAnchor.constraint(equalTo: logoImageView.topAnchor, constant: 3)

        ])
        
    }
    
    func configureCompanyNameLabel() {
        companyNameLabel.text = "Google"
        companyNameLabel.textColor = .systemGray
        companyNameLabel.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(companyNameLabel)
        
        NSLayoutConstraint.activate([
            companyNameLabel.leadingAnchor.constraint(equalTo: jobNameLabel.leadingAnchor),
            companyNameLabel.topAnchor.constraint(equalTo: jobNameLabel.bottomAnchor)
        ])
    }
    
    func configureTexts(jobName: String, companyName: String, situation: String) {
        jobNameLabel.text = jobName
        companyNameLabel.text = companyName
        statusLabelText.text = situation

    }
    
}

#Preview {
    JobCell()
}
