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
    var statusLabel = SituationLabel()
    
    var statusLabelText = JTLabel(label: .jobNameLabel)
    let logoActivityIndicator = UIActivityIndicatorView()

    let logoImageView = UIImageView()
    let divider = UIView()
    
    let applicationStatusFieldColors: [UIColor] = [
        .appliedBackground,
        .inProgressBackground,
        .deniedBackground
    ]
    
    func configureActivityIndicator() {
        logoActivityIndicator.translatesAutoresizingMaskIntoConstraints = false
        logoActivityIndicator.color = .black
        logoActivityIndicator.startAnimating()
        logoImageView.addSubview(logoActivityIndicator)
        
        NSLayoutConstraint.activate([
            logoActivityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor),
            logoActivityIndicator.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 38.5)
        ])
    }
    
    func setJobImage(_ job: Job) {
        ImageCache.shared.loadImage(companyName: job.companyName ?? "Google") { (image, fromCache) in
            guard let image = image else { return }
            if fromCache {
                self.logoImageView.image = image
            } else {
                UIView.transition(
                    with: self,
                    duration: 0.15,
                    options: .transitionCrossDissolve,
                    animations: { self.logoImageView.image = image }
                )
            }
        }
        self.logoActivityIndicator.stopAnimating()
    }
    
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
        container.layer.borderWidth = 2
        container.layer.borderColor = applicationStatusFieldColors[0].cgColor
        
        container.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: topAnchor, constant: 10),
           // container.centerYAnchor.constraint(equalTo: centerYAnchor),
            container.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            container.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            container.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2)
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
        //logoImageView.layer.borderWidth = 2
        logoImageView.contentMode = .scaleToFill
        //logoImageView.backgroundColor = .situationGreen
        
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
        if situation == "Applied" {
            statusLabel.variant = .applied
        } else if situation == "In Progress" {
            statusLabel.variant = .inProgress
        } else {
            statusLabel.variant = .denied
        }
        container.layer.borderColor = statusLabel.variant == .applied ? applicationStatusFieldColors[0].cgColor : statusLabel.variant == .inProgress ? applicationStatusFieldColors[1].cgColor : statusLabel.variant == .denied ? applicationStatusFieldColors[2].cgColor : applicationStatusFieldColors[0].cgColor

        statusLabel.backgroundColor = UIColor(named: statusLabel.variant == .applied ? "SituationGreen": statusLabel.variant == .inProgress ? "SituationYellow": "SituationRed")
        statusLabel.setText()

    }
    
}

//#Preview {
//    JobCell()
//}
