//
//  CustomViewController.swift
//  Fitness_App
//
//  Created by Chamodi Thisaruwani on 2023-05-21.
//
import UIKit

class CustomViewController: UIViewController {
    internal var exerciseList: [Exercise] = []
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to Your Custom Workout"
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Setup Your Own Unique Workout"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .gray
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Start", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let viewListButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("View List", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(viewListButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel, startButton, viewListButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .center
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            startButton.widthAnchor.constraint(equalToConstant: 200),
            startButton.heightAnchor.constraint(equalToConstant: 60),
            
            viewListButton.widthAnchor.constraint(equalToConstant: 200),
            viewListButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    @objc private func startButtonTapped() {
        let addExerciseVC = AddExerciseViewController()
        addExerciseVC.delegate = self
        let navigationController = UINavigationController(rootViewController: addExerciseVC)
        present(navigationController, animated: true, completion: nil)
    }
    
    @objc private func viewListButtonTapped() {
        let exerciseListVC = ExerciseListViewController(exerciseList: exerciseList)
        navigationController?.pushViewController(exerciseListVC, animated: true)
    }
}

extension CustomViewController: AddExerciseDelegate {
    func didAddExercise(_ exercise: Exercise) {
        exerciseList.append(exercise)
    }
}
