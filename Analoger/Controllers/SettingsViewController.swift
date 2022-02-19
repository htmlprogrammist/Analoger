//
//  SettingsViewController.swift
//  Analoger
//
//  Created by Егор Бадмаев on 21.01.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var programmingLanguages = ["Python", "JavaScript", "C/C++", "Swift"]
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "Choose programming language"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let fromLabel = UILabel(text: "From:")
    let inLabel = UILabel(text: "In:")
    
    let fromPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    let inPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Settings"
        view.backgroundColor = .black
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(handleSave))
        
        setupView()
        setConstraints()
    }
    
    @objc func handleSave() {
        print("From: \(programmingLanguages[fromPicker.selectedRow(inComponent: 0)]); In: \(programmingLanguages[inPicker.selectedRow(inComponent: 0)])")
        
        navigationController?.dismiss(animated: true, completion: nil)
    }
}

extension SettingsViewController {
    
    func setupView() {
        view.addSubview(infoLabel)
        view.addSubview(fromLabel)
        view.addSubview(fromPicker)
        view.addSubview(inLabel)
        view.addSubview(inPicker)
         
        fromPicker.delegate = self
        fromPicker.dataSource = self
        inPicker.delegate = self
        inPicker.dataSource = self
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            infoLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            infoLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            infoLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            
            fromLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            fromLabel.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 16),
            fromPicker.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            fromPicker.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            fromPicker.topAnchor.constraint(equalTo: fromLabel.bottomAnchor),
            
            inLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            inLabel.topAnchor.constraint(equalTo: fromPicker.bottomAnchor, constant: 16),
            inPicker.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            inPicker.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            inPicker.topAnchor.constraint(equalTo: inLabel.bottomAnchor),
        ])
    }
}

// MARK: UIPickerViewDataSource
extension SettingsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        programmingLanguages.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        programmingLanguages[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        fromPicker.resignFirstResponder()
        inPicker.resignFirstResponder()
    }
}
