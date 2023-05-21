//
//  ExerciseView.swift
//  Fitness_App
//
//  Created by Chamodi Thisaruwani on 2023-05-21.
//

import UIKit

struct Exercise {
    let name: String
}

class ExerciseListViewController: UIViewController {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Exercise List"
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let exerciseListTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ExerciseCell")
        return tableView
    }()
    
    private var exerciseList: [Exercise]
    
    init(exerciseList: [Exercise]) {
        self.exerciseList = exerciseList
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(titleLabel)
        view.addSubview(exerciseListTableView)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        exerciseListTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            
            exerciseListTableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            exerciseListTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            exerciseListTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            exerciseListTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        exerciseListTableView.dataSource = self
    }
}

extension ExerciseListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exerciseList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExerciseCell", for: indexPath)
        let exercise = exerciseList[indexPath.row]
        cell.textLabel?.text = exercise.name
        return cell
    }
}
