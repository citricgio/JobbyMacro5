//
//  JTLabel.swift
//  JobTrackMacro5
//
//  Created by Giovanna Micher on 20/05/24.
//

import UIKit

enum JTLabelTypes {
    case jobNameLabel
    case jobCompanyNameLabel
    case situationLabel
}

class JTLabel: UILabel {
    
    var label: JTLabelTypes
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(label: JTLabelTypes) {
        self.label = label
        super.init(frame: .zero)
        self.font = UIFont(name: label == .jobNameLabel ? "Cygre-Bold" : label == .jobCompanyNameLabel ? "Cygre-Bold" : "Cygre-Bold", size: label == .jobNameLabel ? 16 : label == .jobCompanyNameLabel ? 14 : label == .situationLabel ? 14 : 13)
        configure()
    }
    
    private func configure() {
        adjustsFontSizeToFitWidth = true
        translatesAutoresizingMaskIntoConstraints = false
    }

}
