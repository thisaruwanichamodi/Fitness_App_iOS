//
//  ExerciseListingViewController.swift
//  Fitness_App
//
//  Created by Chamodi Thisaruwani on 2023-05-21.
//
import UIKit

protocol AddExerciseDelegate: AnyObject {
    var exerciseList: [Exercise] { get }

    func didAddExercise(_ exercise: Exercise)
}
class AddExerciseViewController: UIViewController {
    weak var delegate: AddExerciseDelegate?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Add Your Exercises"
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let exerciseNameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Exercise Name"
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add Exercise", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let exerciseListTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ExerciseCell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(titleLabel)
        view.addSubview(exerciseNameTextField)
        view.addSubview(addButton)
        view.addSubview(exerciseListTableView)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        exerciseNameTextField.translatesAutoresizingMaskIntoConstraints = false
        addButton.translatesAutoresizingMaskIntoConstraints = false
        exerciseListTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            
            exerciseNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            exerciseNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            exerciseNameTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            
            addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            addButton.topAnchor.constraint(equalTo: exerciseNameTextField.bottomAnchor, constant: 16),
            addButton.heightAnchor.constraint(equalToConstant: 60),
            
            exerciseListTableView.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 16),
            exerciseListTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            exerciseListTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            exerciseListTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        exerciseListTableView.dataSource = self
    }
    
    @objc private func addButtonTapped() {
        guard let exerciseName = exerciseNameTextField.text else { return }
        let exercise = Exercise(name: exerciseName)
        delegate?.didAddExercise(exercise)
        exerciseListTableView.reloadData()
        exerciseNameTextField.text = ""
    }
}

extension AddExerciseViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return delegate?.exerciseList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseCell", for: indexPath)
        if let exercise = delegate?.exerciseList[indexPath.row] {
            cell.textLabel?.text = exercise.name
        }
        return cell
    }
}
