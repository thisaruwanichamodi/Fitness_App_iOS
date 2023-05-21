//
//  MeViewController.swift
//  Fitness_App
//
//  Created by Chamodi Thisaruwani on 2023-05-21.
//

import UIKit

class MeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        let titleLabel = UILabel()
        titleLabel.text = "Synchronize your data"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        let settingsTitleLabel = UILabel()
        settingsTitleLabel.text = "Settings"
        settingsTitleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        settingsTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(settingsTitleLabel)
        
        let myProfileButton = createButton(title: "My Profile", image: UIImage(systemName: "person.circle"))
        let generalSettingsButton = createButton(title: "General Settings", image: UIImage(systemName: "gearshape"))
        let languageButton = createButton(title: "Language", image: UIImage(systemName: "globe"))
        
        let feedbackTitleLabel = UILabel()
        feedbackTitleLabel.text = "Feedback"
        feedbackTitleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        feedbackTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(feedbackTitleLabel)
        
        let rateUsButton = createButton(title: "Rate Us", image: UIImage(systemName: "star.fill"))
        let feedbackButton = createButton(title: "Feedback", image: UIImage(systemName: "message.fill"))
        let logoutButton = createLogoutButton()
        
        let views = [settingsTitleLabel, myProfileButton, generalSettingsButton, languageButton, feedbackTitleLabel, rateUsButton, feedbackButton, logoutButton]
        
        for view in views {
            view.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(view)
        }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            settingsTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32),
            settingsTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            myProfileButton.topAnchor.constraint(equalTo: settingsTitleLabel.bottomAnchor, constant: 16),
            myProfileButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            generalSettingsButton.topAnchor.constraint(equalTo: myProfileButton.bottomAnchor, constant: 16),
            generalSettingsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            languageButton.topAnchor.constraint(equalTo: generalSettingsButton.bottomAnchor, constant: 16),
            languageButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            feedbackTitleLabel.topAnchor.constraint(equalTo: languageButton.bottomAnchor, constant: 32),
            feedbackTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            rateUsButton.topAnchor.constraint(equalTo: feedbackTitleLabel.bottomAnchor, constant: 16),
            rateUsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            feedbackButton.topAnchor.constraint(equalTo: rateUsButton.bottomAnchor, constant: 16),
            feedbackButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            logoutButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            logoutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            logoutButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            logoutButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func createButton(title: String, image: UIImage?) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setImage(image, for: .normal)
        return button
    }
    
    private func createLogoutButton() -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle("Logout", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.backgroundColor = UIColor.red.withAlphaComponent(0.8)
        button.layer.cornerRadius = 10
        button.layer.shadowColor = UIColor.gray.cgColor
        button.layer.shadowRadius = 2
        button.layer.shadowOffset = CGSize(width: 0, height: 2)
        return button
    }
}
