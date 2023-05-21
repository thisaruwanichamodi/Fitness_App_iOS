//
//  MaintenanceViewController.swift
//  Fitness_App
//
//  Created by Chamodi Thisaruwani on 2023-05-20.
//

import UIKit
import AVKit

class MaintenanceViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        let titleLabel = UILabel()
        titleLabel.text = "Maintenance Loss Plan"
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
        
        let planItems: [(title: String, description: String, videoURL: URL)] = [
            ("Cardio Workout", "Engage in a 30-minute cardio workout to burn calories and improve cardiovascular health.", URL(string: "https://example.com/cardio_workout_video")!),
            ("Strength Training", "Incorporate strength training exercises to build lean muscle mass and boost metabolism.", URL(string: "https://example.com/strength_training_video")!),
            ("HIIT Workout", "Perform high-intensity interval training (HIIT) workouts to maximize calorie burn in a short amount of time.", URL(string: "https://example.com/hiit_workout_video")!),
            // Add more plan items as needed
        ]
        
        for (index, item) in planItems.enumerated() {
            let videoView = MaintenanceVideoView(title: item.title, description: item.description, videoURL: item.videoURL)
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

class MaintenanceVideoView: UIView {
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .darkGray
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let playButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Play Video", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    init(title: String, description: String, videoURL: URL) {
        super.init(frame: .zero)
        
        backgroundColor = .clear
        
        titleLabel.text = title
        descriptionLabel.text = description
        
        containerView.addSubview(titleLabel)
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(playButton)
        addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            
            playButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            playButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 40),
            playButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -40),
            playButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
            playButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func playButtonTapped() {
        // Handle video playback here
        // You can use AVPlayerViewController to play the video
    }
    
    
}
