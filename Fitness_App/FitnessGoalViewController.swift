//
//  FitnessGoalViewController.swift
//  Fitness_App
//
//  Created by Chamodi Thisaruwani on 2023-05-20.
//
import UIKit

class FitnessGoalViewController: UIViewController {
    private var selectedGoal: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        let titleLabel = UILabel()
        titleLabel.text = "Select Your Fitness Goal"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
        
        let goalTitles = ["Weight Loss", "Muscle Gain", "Maintenance", "Cardiovascular Health", "Flexibility", "Endurance"]
        for title in goalTitles {
            let goalButton = createGoalButton(title: title)
            stackView.addArrangedSubview(goalButton)
        }
        
        let getMyPlanButton = UIButton(type: .system)
        getMyPlanButton.setTitle("Get My Plan", for: .normal)
        getMyPlanButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        getMyPlanButton.setTitleColor(.white, for: .normal)
        getMyPlanButton.backgroundColor = .systemBlue
        getMyPlanButton.layer.cornerRadius = 10
        getMyPlanButton.addTarget(self, action: #selector(getMyPlanButtonTapped), for: .touchUpInside)
        stackView.addArrangedSubview(getMyPlanButton)
        
        NSLayoutConstraint.activate([
            getMyPlanButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        updateGetMyPlanButton()
    }
    
    private func createGoalButton(title: String) -> UIButton {
        let goalButton = UIButton(type: .system)
        goalButton.setTitle(title, for: .normal)
        goalButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        goalButton.setTitleColor(.black, for: .normal)
        goalButton.layer.borderWidth = 2
        goalButton.layer.borderColor = UIColor.black.cgColor
        goalButton.layer.cornerRadius = 10
        goalButton.addTarget(self, action: #selector(goalButtonTapped(_:)), for: .touchUpInside)
        return goalButton
    }
    
    @objc private func goalButtonTapped(_ sender: UIButton) {
        selectedGoal = sender.title(for: .normal)
        updateGetMyPlanButton()
        
        for subview in sender.superview?.subviews ?? [] {
            if let goalButton = subview as? UIButton {
                if goalButton == sender {
                    goalButton.setTitleColor(.green, for: .normal)
                } else {
                    goalButton.setTitleColor(.black, for: .normal)
                }
            }
        }
    }
    
    @objc private func getMyPlanButtonTapped() {
        guard let selectedGoal = selectedGoal else {
            return
        }
        
        let goalViewController: UIViewController
        
        switch selectedGoal {
        case "Weight Loss":
            goalViewController = WeightLossViewController()
        case "Muscle Gain":
            goalViewController = MuscleGainViewController()
        case "Maintenance":
            goalViewController = MaintenanceViewController()
        case "Cardiovascular Health":
            goalViewController = CardioHealthViewController()
        case "Flexibility":
            goalViewController = FlexibilityViewController()
        case "Endurance":
            goalViewController = EnduranceViewController()
        default:
            return
        }
        
        navigationController?.pushViewController(goalViewController, animated: true)
    }
    
    private func updateGetMyPlanButton() {
        guard let getMyPlanButton = view.subviews.compactMap({ $0 as? UIButton }).first else {
            return
        }
        
        getMyPlanButton.backgroundColor = selectedGoal != nil ? .blue : .gray
        getMyPlanButton.isEnabled = selectedGoal != nil
    }
}
