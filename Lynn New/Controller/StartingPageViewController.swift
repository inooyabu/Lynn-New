//
//  StartingPageViewController.swift
//  Lynn New
//
//  Created by Tenti Atika Putri on 25/07/21.
//

import UIKit

class StartingPageViewController: UIViewController {

    @IBOutlet weak var quitButton: UIButton!
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var mulaiButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //corner radius Button Mulai
        mulaiButton.layer.cornerRadius = 15
        
    }
    
    @IBAction func quitImageButtonTapped(_ sender: Any) {
        print("Quit Button Tapped")
        UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
    }
    
    @IBAction func infoImageButtonTapped(_ sender: Any) {
        print("Info Button Tapped")

    }
    
    @IBAction func mulaiButtonTapped(_ sender: Any) {
        print("Mulai Button Tapped")
        
        let homeScreen = storyboard?.instantiateViewController(identifier: "Home Screen") as! HomeScreenViewController
        homeScreen.modalPresentationStyle = .fullScreen
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        present(homeScreen, animated: false, completion: nil)
    }
    
    
    
}
