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
    let coreDataController = CoreDataController.shared
    lazy var context = coreDataController.persistentContainer.viewContext
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
                newJob.name = textfield.element.text
            case 1:
                newJob.companyName = textfield.element.text
            case 2:
                newJob.status = textfield.element.text
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

        for i in 0...2 {
            let formText = JTLabel(label: .jobCompanyNameLabel)
            let textField = JTTextField()
            view.addSubview(formText)
            view.addSubview(textField)
            formText.translatesAutoresizingMaskIntoConstraints = false
            textField.translatesAutoresizingMaskIntoConstraints = false
            
            
            switch i {
            case 0:
                formText.text = "Job name"
                textField.placeholder = "Enter a job name"
            case 1:
                formText.text = "Company"
                textField.placeholder = "Enter a company name"
            case 2:
                formText.text = "Situation"
                textField.placeholder = "Enter a situation type"
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
