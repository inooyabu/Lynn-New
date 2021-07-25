//
//  TentangLynnViewController.swift
//  Lynn New
//
//  Created by Tenti Atika Putri on 25/07/21.
//

import UIKit

class TentangLynnViewController: UIViewController {

    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var heroLynnImageView: UIImageView!
    
    let heroLynnGif = UIImage.gif(name: "Hero Lynn")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        heroLynnImageView.image = heroLynnGif
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
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        print("Button Next Tapped")
        
        let tips = storyboard?.instantiateViewController(identifier: "Tips") as! TipsViewController
        tips.modalPresentationStyle = .fullScreen
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        present(tips, animated: false, completion: nil)
     
    }
}
