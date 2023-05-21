//
//  ProcessViewController.swift
//  Fitness_App
//
//  Created by Chamodi Thisaruwani on 2023-05-21.
//

import UIKit
import AVKit

class ProcessViewController: UIViewController {

    var currentStep = 1
     var progress: CGFloat = 0.0
     var isCompleted = false

     let workoutDetails: [(repCount: Int, time: String, videoURL: String, bodyPart: String)] = [
         (repCount: 10, time: "10 minutes", videoURL: "https://example.com/workout1", bodyPart: "Abs"),
         (repCount: 15, time: "15 minutes", videoURL: "https://example.com/workout2", bodyPart: "Legs"),
         (repCount: 20, time: "20 minutes", videoURL: "https://example.com/workout3", bodyPart: "Arms"),
         (repCount: 12, time: "12 minutes", videoURL: "https://example.com/workout4", bodyPart: "Back"),
         (repCount: 8, time: "8 minutes", videoURL: "https://example.com/workout5", bodyPart: "Chest")
     ]

     var currentWorkout: (repCount: Int, time: String, videoURL: String, bodyPart: String) {
         return workoutDetails[currentStep - 1]
     }

     let scrollView: UIScrollView = {
         let scrollView = UIScrollView()
         scrollView.translatesAutoresizingMaskIntoConstraints = false
         return scrollView
     }()

     let stackView: UIStackView = {
         let stackView = UIStackView()
         stackView.axis = .vertical
         stackView.spacing = 20
         stackView.translatesAutoresizingMaskIntoConstraints = false
         return stackView
     }()

     let titleLabel: UILabel = {
         let label = UILabel()
         label.font = UIFont.boldSystemFont(ofSize: 34)
         label.textAlignment = .center
         label.numberOfLines = 0
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
     }()

     let progressView: UIProgressView = {
         let progressView = UIProgressView(progressViewStyle: .default)
         progressView.tintColor = .blue
         progressView.translatesAutoresizingMaskIntoConstraints = false
         return progressView
     }()

     let statusLabel: UILabel = {
         let label = UILabel()
         label.font = UIFont.boldSystemFont(ofSize: 24)
         label.textAlignment = .center
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
     }()

     let repCountLabel: UILabel = {
         let label = UILabel()
         label.font = UIFont.systemFont(ofSize: 18)
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
     }()

     let timeLabel: UILabel = {
         let label = UILabel()
         label.font = UIFont.systemFont(ofSize: 18)
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
     }()

     let bodyPartLabel: UILabel = {
         let label = UILabel()
         label.font = UIFont.systemFont(ofSize: 18)
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
     }()

     let videoPlayerView: UIView = {
         let view = UIView()
         view.translatesAutoresizingMaskIntoConstraints = false
         return view
     }()

     let button: UIButton = {
         let button = UIButton(type: .system)
         button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
         button.setTitleColor(.white, for: .normal)
         button.layer.cornerRadius = 10
         button.translatesAutoresizingMaskIntoConstraints = false
         return button
     }()

     override func viewDidLoad() {
         super.viewDidLoad()
         setupViews()
         updateUI()
     }

     func setupViews() {
         view.addSubview(scrollView)
         scrollView.addSubview(stackView)
         stackView.addArrangedSubview(titleLabel)
         stackView.addArrangedSubview(progressView)
         stackView.addArrangedSubview(statusLabel)
         stackView.addArrangedSubview(repCountLabel)
         stackView.addArrangedSubview(timeLabel)
         stackView.addArrangedSubview(bodyPartLabel)
         stackView.addArrangedSubview(videoPlayerView)
         stackView.addArrangedSubview(button)

         NSLayoutConstraint.activate([
             scrollView.topAnchor.constraint(equalTo: view.topAnchor),
             scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
             scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

             stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
             stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
             stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
             stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20),
             stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -40),

             videoPlayerView.heightAnchor.constraint(equalToConstant: 200),
             button.heightAnchor.constraint(equalToConstant: 40)
         ])

         button.addTarget(self, action: #selector(nextStepButtonTapped), for: .touchUpInside)
     }

     @objc func nextStepButtonTapped() {
         if currentStep < workoutDetails.count {
             currentStep += 1
             progress = CGFloat(currentStep) / CGFloat(workoutDetails.count)
         } else {
             isCompleted = true
         }
         updateUI()
     }

     func updateUI() {
         titleLabel.text = "Step \(currentStep)"
         progressView.setProgress(Float(progress), animated: true)

         if isCompleted {
             statusLabel.text = "Process Completed"
             statusLabel.textColor = .green

             repCountLabel.isHidden = true
             timeLabel.isHidden = true
             bodyPartLabel.isHidden = true
             videoPlayerView.isHidden = true

             button.setTitle("Reset", for: .normal)
             button.backgroundColor = .red
         } else {
             statusLabel.text = "In Progress"
             statusLabel.textColor = .orange

             repCountLabel.isHidden = false
             timeLabel.isHidden = false
             bodyPartLabel.isHidden = false
             videoPlayerView.isHidden = false

             repCountLabel.text = "Rep Count: \(currentWorkout.repCount)"
             timeLabel.text = "Time: \(currentWorkout.time)"
             bodyPartLabel.text = "Body Part: \(currentWorkout.bodyPart)"

             button.setTitle("Next Step", for: .normal)
             button.backgroundColor = .blue

             // Create AVPlayer and AVPlayerLayer to display video
             guard let videoURL = URL(string: currentWorkout.videoURL) else { return }
             let player = AVPlayer(url: videoURL)
             let playerLayer = AVPlayerLayer(player: player)
             playerLayer.frame = videoPlayerView.bounds
             videoPlayerView.layer.addSublayer(playerLayer)
             player.play()
         }
     }
 }
