//
//  FormVC.swift
//  JobTrackMacro5
//
//  Created by Giovanna Micher on 20/05/24.
//

import UIKit

class FormVC: UIViewController {
    
    let jobButton = JTButton(backgroundColor: .systemGreen, title: "Ok")
    let jobListVC = JobListVC()
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var fieldsList: [JTTextField] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureJobButton()
        configureForms()
        createDismissKeyboardTapGesture()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        //self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    @objc func addJob() {
        navigationController?.popViewController(animated: true)
        
        let newJob = Job(context: context)
        for textfield in fieldsList.enumerated() {
            
            switch textfield.offset {
            case 0:
                newJob.name = textfield.element.text ?? "no name"
            case 1:
                newJob.companyName = textfield.element.text ?? "no name"
            case 2:
                newJob.status = textfield.element.text ?? "no name"
            case 3:
                newJob.position = textfield.element.text ?? "no name"
            default:
                break
            }
        }
        
        do {
            try context.save()
        } catch {
            print("Não salvou")
        }
    }
    
    func configureForms() {

        for i in 0...3 {
            let formText = JTLabel(label: .jobCompanyNameLabel)
            let textField = JTTextField()
            view.addSubview(formText)
            view.addSubview(textField)
            formText.translatesAutoresizingMaskIntoConstraints = false
            textField.translatesAutoresizingMaskIntoConstraints = false
            
            
            switch i {
            case 0:
                formText.text = "Job name"
            case 1:
                formText.text = "Company"
            case 2:
                formText.text = "Situation"
            case 3:
                formText.text = "Position"
            default:
                formText.text = "Salary"
            }
            
            fieldsList.append(textField)
            
            NSLayoutConstraint.activate([
                
                formText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                formText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: CGFloat(80 * i)),
                
                textField.topAnchor.constraint(equalTo: formText.bottomAnchor, constant: 10),
                textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                textField.heightAnchor.constraint(equalToConstant: 40)
                
            ])
        }
    }
    
    
    func configureJobButton() {
        view.addSubview(jobButton)
        jobButton.addTarget(self, action: #selector(pushJobListVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            jobButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            jobButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            jobButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            jobButton.heightAnchor.constraint(equalToConstant: 42) 
        
        ])
    }
    
    func createDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }



@objc func pushJobListVC() {
        addJob()
        navigationController?.popViewController(animated: true)
        fieldsList.removeAll()
    }

}
