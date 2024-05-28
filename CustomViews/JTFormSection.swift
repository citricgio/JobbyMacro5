////
////  JTFormSection.swift
////  JobTrackMacro5
////
////  Created by Giovanna Micher on 22/05/24.
////
//
//import UIKit
//
//class JTFormSection: UIView {
//    var formText = UILabel()
//    
//   // JTLabel(textAlignment: .center, fontSize: 17)
//    var textField = JTTextField()
//    
//    init(formText: JTLabel, textField: JTTextField) {
//        super.init(frame: .zero)
//        self.formText = formText
//        self.textField = textField
//        configure()
//    }
//    
//    override init(frame: CGRect) {
//        super.init(frame: .zero)
//        configure()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    private func configure() {
//        addSubview(formText)
//        addSubview(textField)
//        formText.translatesAutoresizingMaskIntoConstraints = false
//        textField.translatesAutoresizingMaskIntoConstraints = false
//        
//        NSLayoutConstraint.activate([
//            formText.leadingAnchor.constraint(equalTo: leadingAnchor),
//            formText.topAnchor.constraint(equalTo: topAnchor),
//            
//            textField.topAnchor.constraint(equalTo: formText.bottomAnchor, constant: 10),
//            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
//            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
//            textField.heightAnchor.constraint(equalToConstant: 40)
//
//        ])
//    }
//}
