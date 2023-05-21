//
//  WorkoutExercisesViewController.swift
//  Fitness_App
//
//  Created by Chamodi Thisaruwani on 2023-05-21.
//

import UIKit
import AVKit

class WorkoutExercisesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .white
        
        let titleLabel = UILabel()
        titleLabel.text = "Exercises"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        let planStackView = UIStackView()
        planStackView.axis = .vertical
        planStackView.spacing = 10
        planStackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(planStackView)
        
        let planItems: [(title: String, videoURL: URL)] = [
            ("Cardio Workout", URL(string: "https://example.com/cardio_workout_video")!),
            ("Strength Training", URL(string: "https://example.com/strength_training_video")!),
            ("HIIT Workout", URL(string: "https://example.com/hiit_workout_video")!),
            // Add more plan items as needed
        ]
        
        for (index, item) in planItems.enumerated() {
            let videoView = WLVideoView(title: item.title, description: "Video Description", videoURL: item.videoURL)
            videoView.translatesAutoresizingMaskIntoConstraints = false
            planStackView.addArrangedSubview(videoView)
            
            // Add separator view between video items, except for the last item
            if index < planItems.count - 1 {
                let separatorView = UIView()
                separatorView.backgroundColor = .lightGray
                separatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
                planStackView.addArrangedSubview(separatorView)
            }
        }

        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            
            scrollView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            planStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            planStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            planStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            planStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            planStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        

    }
}
