//
//  BerapaViewController.swift
//  Lynn New
//
//  Created by Tenti Atika Putri on 26/07/21.
//

import UIKit

class BerapaViewController: UIViewController {
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    //Belum ada gif nya
//    let berapaGif = UIImage.gif(name: "minum anak")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        imageView.image = berapaGif

        
    }
    
    @IBAction func homeBUttonTapped(_ sender: Any) {
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
    
    @IBAction func backButtontapped(_ sender: Any) {
        print("Button Back Tapped")
        
        let tips = storyboard?.instantiateViewController(identifier: "Tips") as! TipsViewController
        tips.modalPresentationStyle = .fullScreen
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        present(tips, animated: false, completion: nil)
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        print("Button Next Tapped")
        
        let monitor = storyboard?.instantiateViewController(identifier: "Monitor") as! MonitorViewController
        monitor.modalPresentationStyle = .fullScreen
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        present(monitor, animated: false, completion: nil)
    }
    
}
