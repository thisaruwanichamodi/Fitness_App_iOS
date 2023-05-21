//
//  TabBarViewController.swift
//  Fitness_App
//
//  Created by Chamodi Thisaruwani on 2023-05-21.
//

import UIKit

class TabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myTrainingPlanViewController = MyTrainingPlanViewController()
        myTrainingPlanViewController.tabBarItem = UITabBarItem(title: "My Training Plan", image: UIImage(systemName: "list.bullet"), tag: 1)
        
        let customViewController = CustomViewController()
        customViewController.tabBarItem = UITabBarItem(title: "Custom", image: UIImage(systemName: "square.grid.2x2"), tag: 2)
        
        let workoutExercisesViewController = WorkoutExercisesViewController()
        workoutExercisesViewController.tabBarItem = UITabBarItem(title: "Workout Exercises", image: UIImage(systemName: "figure.walk"), tag: 3)
        
        let processViewController = ProcessViewController()
        processViewController.tabBarItem = UITabBarItem(title: "Process", image: UIImage(systemName: "chart.bar.xaxis"), tag: 4)
        
        let meViewController = MeViewController()
        meViewController.tabBarItem = UITabBarItem(title: "Me", image: UIImage(systemName: "person"), tag: 5)
        
        viewControllers = [myTrainingPlanViewController, customViewController, workoutExercisesViewController, processViewController, meViewController,
        ]
    }
}

class MyTrainingPlanViewController: UIViewController {
    // Your implementation for the "My Training Plan" view controller
}




