//
//  JTTextField.swift
//  JobTrackMacro5
//
//  Created by Giovanna Micher on 20/05/24.
//

import UIKit

class JTTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray4.cgColor
        
        textColor = .label //black on lightmode and white on darkmode
        tintColor = .label
        textAlignment = .center
        
        font = UIFont(name: "Cygre-Light", size: 14)
        adjustsFontSizeToFitWidth = true //for a very long name, the font will shrink to fit in the text field
        minimumFontSize = 12
        backgroundColor = .tertiarySystemBackground
        //autocorrectionType = .no
        returnKeyType = .go
        
        //placeholder = "Enter a job name"
    }
    
}
