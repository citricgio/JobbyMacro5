//
//  SituationLabel.swift
//  JobTrackMacro5
//
//  Created by Giovanna Micher on 20/05/24.
//

import UIKit

enum SituationTypes: String {
    
    case applied = "Applied"
    case inProgress = "In Progress"
    case denied = "Denied"
}

class SituationLabel: UIView {
    
    var variant: SituationTypes?
    var situationText = JTLabel(label: .situationLabel)
    
    init() {
//        self.variant = variant
        super.init(frame: .zero)
        self.addSubview(situationText)
        configureContainerLabel()
//        setText()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    
    private func configureContainerLabel() {
        layer.cornerRadius = 15
        //backgroundColor = UIColor(named: variant == .applied ? "SituationGreen" : variant == .inProgress ? "SituationYellow" : "SituationRed")
        NSLayoutConstraint.activate([
            self.centerYAnchor.constraint(equalTo: centerYAnchor),
            self.heightAnchor.constraint(equalTo: situationText.heightAnchor, constant: 7),
            self.widthAnchor.constraint(equalTo: situationText.widthAnchor, constant: 30)
        ])
    }
    
    func setText() {
        situationText.translatesAutoresizingMaskIntoConstraints = false
        situationText.text = variant == .applied ? "Applied" : variant == .inProgress ? "In Progress" : "Denied"
        situationText.textColor = UIColor(named: variant == .applied ? "SituationLabelGreen" : variant == .inProgress ? "SituationLabelYellow" : "SituationLabelRed")
        
        NSLayoutConstraint.activate([
            situationText.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -1),
            situationText.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
}

//#Preview {
//    SituationLabel(variant: .applied)
//}
