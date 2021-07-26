//
//  TipsViewController.swift
//  Lynn New
//
//  Created by Tenti Atika Putri on 26/07/21.
//

import UIKit

class TipsViewController: UIViewController {

    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    //Belum ada gif nya
//    let tipsGif = UIImage.gif(name: "Beby")
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        imageView.image = tipsGif
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
        print("Buttom Back Tapped")
        
        let tentangLynn = storyboard?.instantiateViewController(identifier: "Tentang Lynn") as! TentangLynnViewController
        tentangLynn.modalPresentationStyle = .fullScreen
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        present(tentangLynn, animated: false, completion: nil)
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        print("Button Next Tapped")
        
        let berapa = storyboard?.instantiateViewController(identifier: "Berapa") as! BerapaViewController
        berapa.modalPresentationStyle = .fullScreen
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        present(berapa, animated: false, completion: nil)
    }
    
    

}
