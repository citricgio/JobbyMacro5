//
//  FormVC.swift
//  JobTrackMacro5
//
//  Created by Giovanna Micher on 20/05/24.
//

import UIKit

class FormVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    let jobButton = JTButton(backgroundColor: .systemGreen, title: "Ok")
    let jobListVC = JobListVC()
    let coreDataController = CoreDataController.shared
    lazy var context = coreDataController.persistentContainer.viewContext
    
    let createJobName = JTLabel(label: .jobCompanyNameLabel)
    let createCompanyName = JTLabel(label: .jobCompanyNameLabel)
    let createStatusName = JTLabel(label: .jobCompanyNameLabel)
    let applicationStatusPicker = UIPickerView()
    let clearbitLink = UIButton(type: .system)

    
//    var allJobs = [Job]() {
//        didSet {
//            jobListVC.jobs = allJobs
//        }
//    }
        
    let jobNameField = JTTextField(frame: .zero, placeholder: "Enter a job name")
    let companyNameField = JTTextField(frame: .zero, placeholder: "Enter a company name")
    let pickerField = JTTextField(frame: .zero, placeholder: "Enter a status")
    
    let downArrow = UIImage(systemName: "chevron.down")?.withTintColor(.appliedBackground, renderingMode: .automatic)
    let downArrowView = UIImageView()
    
    let applicationStatusPickerData = [
        SituationTypes.applied.rawValue,
        SituationTypes.inProgress.rawValue,
        SituationTypes.denied.rawValue
    ]
    
    let applicationStatusFieldColors: [UIColor] = [
        .appliedBackground,
        .inProgressBackground,
        .deniedBackground
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setElements()
        
    }
    
    func setElements() {
        configureJobButton()
        configureFormsJobName()
        configureFormsCompanyName()
        configureFormsStatus()
        configureClearBitButton()
        //configureClearBitButton()
        
        createDismissKeyboardTapGesture()
    }
    
    func configureClearBitButton() {
        view.addSubview(clearbitLink)
        clearbitLink.translatesAutoresizingMaskIntoConstraints = false
        clearbitLink.setTitle("Logos provided by Clearbit", for: .normal)
        clearbitLink.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        clearbitLink.addTarget(self, action: #selector(clearbitTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            clearbitLink.topAnchor.constraint(equalTo: pickerField.bottomAnchor, constant: 25),
            clearbitLink.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func clearbitTapped() {
        if let url = URL(string: "https://clearbit.com"), !url.absoluteString.isEmpty {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }

    
    override func viewWillAppear(_ animated: Bool) {
        //self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    func configureFormsJobName() {
        view.addSubview(createJobName)
        view.addSubview(jobNameField)
        createJobName.translatesAutoresizingMaskIntoConstraints = false
        createJobName.text = "Job name"
        jobNameField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            createJobName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            createJobName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            jobNameField.topAnchor.constraint(equalTo: createJobName.bottomAnchor, constant: 10),
            jobNameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            jobNameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            jobNameField.heightAnchor.constraint(equalToConstant: 40)
            
        ])
    }

    func configureFormsCompanyName() {
        view.addSubview(createCompanyName)
        view.addSubview(companyNameField)
        createCompanyName.translatesAutoresizingMaskIntoConstraints = false
        createCompanyName.text = "Company"

        companyNameField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            createCompanyName.topAnchor.constraint(equalTo: jobNameField.bottomAnchor, constant: 10),
            createCompanyName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        
            companyNameField.topAnchor.constraint(equalTo: createCompanyName.bottomAnchor, constant: 10),
            companyNameField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            companyNameField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            companyNameField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func doneTapped() {
        self.pickerField.resignFirstResponder()
    }
    
    func configureFormsStatus() {
        view.addSubview(createStatusName)
        view.addSubview(pickerField)
        view.addSubview(downArrowView)
        createStatusName.translatesAutoresizingMaskIntoConstraints = false
        createStatusName.text = "Status"
        applicationStatusPicker.delegate = self
        applicationStatusPicker.dataSource = self
        
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 35))
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.sizeToFit()

        let doneButton = UIBarButtonItem(
            title: "Done", style: UIBarButtonItem.Style.done,
            target: self, action: #selector(doneTapped)
        )

        doneButton.tintColor = .systemRed

        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)

        toolBar.setItems([space, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true

        pickerField.inputView = applicationStatusPicker
        pickerField.inputAccessoryView = toolBar
        pickerField.text = SituationTypes.applied.rawValue
        pickerField.textColor = UIColor(named: "SituationLabelGreen")
        pickerField.layer.borderColor = applicationStatusFieldColors[0].cgColor
        
        downArrowView.translatesAutoresizingMaskIntoConstraints = false
        downArrowView.image = downArrow
        downArrowView.tintColor = .appliedBackground
        
        NSLayoutConstraint.activate([
            downArrowView.centerYAnchor.constraint(equalTo: pickerField.centerYAnchor),
            downArrowView.trailingAnchor.constraint(equalTo: pickerField.trailingAnchor, constant: -15)
        ])

         
        NSLayoutConstraint.activate([
            createStatusName.topAnchor.constraint(equalTo: companyNameField.bottomAnchor, constant: 10),
            createStatusName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),

            pickerField.topAnchor.constraint(equalTo: createStatusName.bottomAnchor, constant: 10),
            pickerField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            pickerField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            pickerField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func addJob() {
        navigationController?.popViewController(animated: true)
        let newJob = Job(context: context)
        newJob.name = jobNameField.text
        newJob.companyName = companyNameField.text
        newJob.status = pickerField.text
        
        do {
            try context.save()
        } catch {
            print("Não salvou")
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
        //fieldsList.removeAll()
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return applicationStatusPickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return applicationStatusPickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerField.text = applicationStatusPickerData[row]
        pickerField.layer.borderColor = applicationStatusFieldColors[row].cgColor
        pickerField.textColor = applicationStatusFieldColors[row]
        downArrowView.tintColor = applicationStatusFieldColors[row]
    }
}
