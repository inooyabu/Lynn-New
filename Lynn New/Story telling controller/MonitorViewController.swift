//
//  MonitorViewController.swift
//  Lynn New
//
//  Created by Tenti Atika Putri on 26/07/21.
//

import UIKit

class MonitorViewController: UIViewController {

    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundImage.transform = CGAffineTransform(scaleX: -1, y: 1)
    }
    
    @IBAction func homeButtonTapped(_ sender: Any) {
        print("Home Button Tapped")
        let startingPage = storyboard?.instantiateViewController(identifier: "Starting Page") as! StartingPageViewController
        startingPage.modalPresentationStyle = .fullScreen
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromBottom
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        present(startingPage, animated: false, completion: nil)
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        print("Button Back Tapped")
        
        let berapa = storyboard?.instantiateViewController(identifier: "Berapa") as! BerapaViewController
        berapa.modalPresentationStyle = .fullScreen
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        present(berapa, animated: false, completion: nil)
        
    }
}
