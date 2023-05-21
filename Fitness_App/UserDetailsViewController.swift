//
//  UserDetailsViewController.swift
//  Fitness_App
//
//  Created by Chamodi Thisaruwani on 2023-05-20.
//

import UIKit

class UserDetailsViewController: UIViewController {
    private var gender: String
    private var name = ""
    private var age = ""
    private var height = ""
    private var weight = ""
    private var bmi = 0.0
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "User Details"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [createTextField(placeholder: "Name"),
                                                       createTextField(placeholder: "Age"),
                                                       createTextField(placeholder: "Height (cm)"),
                                                       createTextField(placeholder: "Weight (kg)")])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var calculateBMIButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Calculate BMI", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(calculateBMIButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var bmiLabel: UILabel = {
        let label = UILabel()
        label.text = "BMI: \(String(format: "%.1f", bmi))"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isEnabled = false
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()
    
    init(gender: String) {
        self.gender = gender
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configureUIComponents()
        setupConstraints()
    }
    
    private func configureUIComponents() {
        view.addSubview(titleLabel)
        view.addSubview(stackView)
        view.addSubview(calculateBMIButton)
        view.addSubview(bmiLabel)
        view.addSubview(nextButton)
        
        stackView.arrangedSubviews.forEach { textField in
            if let textField = textField as? UITextField {
                textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
                textField.borderStyle = .roundedRect
                textField.font = UIFont.systemFont(ofSize: 16)
                textField.backgroundColor = .systemGray6
                textField.layer.cornerRadius = 8
            }
        }
    }
    
    private func setupConstraints() {
        let margin: CGFloat = 20
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: margin),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin),
            
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin),
            
            calculateBMIButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 40),
            calculateBMIButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin),
            calculateBMIButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin),
            calculateBMIButton.heightAnchor.constraint(equalToConstant: 50),
            
            bmiLabel.topAnchor.constraint(equalTo: calculateBMIButton.bottomAnchor, constant: 20),
            bmiLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin),
            bmiLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin),
            
            nextButton.topAnchor.constraint(greaterThanOrEqualTo: bmiLabel.bottomAnchor, constant: 40),
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: margin),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -margin),
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -margin),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func createTextField(placeholder: String) -> UITextField {
        let textField = UITextField()
        textField.placeholder = placeholder
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        guard let nameText = stackView.arrangedSubviews[0] as? UITextField,
              let ageText = stackView.arrangedSubviews[1] as? UITextField,
              let heightText = stackView.arrangedSubviews[2] as? UITextField,
              let weightText = stackView.arrangedSubviews[3] as? UITextField else {
            return
        }
        
        name = nameText.text ?? ""
        age = ageText.text ?? ""
        height = heightText.text ?? ""
        weight = weightText.text ?? ""
        
        nextButton.isEnabled = !name.isEmpty && !age.isEmpty && !height.isEmpty && !weight.isEmpty
    }
    
    @objc private func calculateBMIButtonTapped() {
        guard let heightValue = Double(height), let weightValue = Double(weight) else {
            return
        }
        
        let heightInMeters = heightValue / 100
        bmi = weightValue / (heightInMeters * heightInMeters)
        
        bmiLabel.text = "BMI: \(String(format: "%.1f", bmi))"
    }
    

    @objc private func nextButtonTapped() {
        let fitnessGoalViewController = FitnessGoalViewController()
        navigationController?.pushViewController(fitnessGoalViewController, animated: true)
    }
}
