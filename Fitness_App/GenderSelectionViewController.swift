//
//  GenderSelectionViewController.swift
//  Fitness_App
//
//  Created by Chamodi Thisaruwani on 2023-05-20.
//

import UIKit

class GenderSelectionViewController: UIViewController {
    private let femaleImage = UIImage(named: "female_image")
    private let maleImage = UIImage(named: "male_image")
    private let gender: String
    
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
        
        let titleLabel = UILabel()
        titleLabel.text = "Select Your Gender"
        titleLabel.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        let femaleImageView = UIImageView(image: femaleImage)
        femaleImageView.contentMode = .scaleAspectFit
        femaleImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(femaleImageView)
        
        let maleImageView = UIImageView(image: maleImage)
        maleImageView.contentMode = .scaleAspectFit
        maleImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(maleImageView)
        
        let genderTextField = UITextField()
        genderTextField.placeholder = "Select your gender"
        genderTextField.textAlignment = .center
        genderTextField.font = UIFont.systemFont(ofSize: 20)
        genderTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(genderTextField)
        
        
        
        let femaleButton = UIButton(type: .system)
        femaleButton.setTitle("Female", for: .normal)
        femaleButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        femaleButton.setTitleColor(.white, for: .normal)
        femaleButton.backgroundColor = UIColor(red: 255/255, green: 105/255, blue: 180/255, alpha: 1.0)
        femaleButton.layer.cornerRadius = 10
        femaleButton.translatesAutoresizingMaskIntoConstraints = false
        femaleButton.addTarget(self, action: #selector(femaleButtonTapped), for: .touchUpInside)
        view.addSubview(femaleButton)
        
        let maleButton = UIButton(type: .system)
        maleButton.setTitle("Male", for: .normal)
        maleButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        maleButton.setTitleColor(.white, for: .normal)
        maleButton.backgroundColor = .blue
        maleButton.layer.cornerRadius = 10
        maleButton.translatesAutoresizingMaskIntoConstraints = false
        maleButton.addTarget(self, action: #selector(maleButtonTapped), for: .touchUpInside)
        view.addSubview(maleButton)
        
        NSLayoutConstraint.activate([
                    titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                    titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            femaleImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            femaleImageView.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: 40),
            femaleImageView.widthAnchor.constraint(equalToConstant: 300),
            femaleImageView.heightAnchor.constraint(equalToConstant: 600),
            
            maleImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            maleImageView.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: -50),
            maleImageView.widthAnchor.constraint(equalToConstant: 300),
            maleImageView.heightAnchor.constraint(equalToConstant: 600),
            
            femaleButton.topAnchor.constraint(equalTo: femaleImageView.bottomAnchor, constant: -80),
            femaleButton.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -75),
            femaleButton.widthAnchor.constraint(equalToConstant: 100),
            femaleButton.heightAnchor.constraint(equalToConstant: 40),
            
            maleButton.topAnchor.constraint(equalTo: femaleImageView.bottomAnchor, constant: -80),
            maleButton.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 30),
            maleButton.widthAnchor.constraint(equalToConstant: 100),
            maleButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @objc private func femaleButtonTapped() {
        navigateToUserDetails(gender: "Female")
    }
    
    @objc private func maleButtonTapped() {
        navigateToUserDetails(gender: "Male")
    }
    
    private func navigateToUserDetails(gender: String) {
        let userDetailsView = UserDetailsViewController(gender: gender)
        navigationController?.pushViewController(userDetailsView, animated: true)
    }
}

