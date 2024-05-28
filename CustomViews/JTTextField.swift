//
//  JTTextField.swift
//  JobTrackMacro5
//
//  Created by Giovanna Micher on 20/05/24.
//

import UIKit

class JTTextField: UITextField {


    init(frame: CGRect, placeholder: String) {
        super.init(frame: frame)
        self.placeholder = placeholder
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 20))
        self.leftView = paddingView
        self.leftViewMode = .always
        
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.systemGray4.cgColor
        
        textColor = .systemGray //black on lightmode and white on darkmode
        tintColor = .label

        font = UIFont.systemFont(ofSize: 14)
        adjustsFontSizeToFitWidth = true
        minimumFontSize = 12
        backgroundColor = .tertiarySystemBackground
        returnKeyType = .go
        
    }
    
}
