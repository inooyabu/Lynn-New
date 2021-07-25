//
//  HomeScreen2ViewController.swift
//  Lynn New
//
//  Created by Tenti Atika Putri on 25/07/21.
//

import UIKit

class HomeScreen2ViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var lanjutButton: UIButton!
    @IBOutlet weak var profilImageView: UIImageView!
    @IBOutlet weak var greetingTextField: UILabel!
    
    let profilGif = UIImage.gif(name: "Profil")
    let homeScreenVC = HomeScreenViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profilImageView.image = profilGif
        
        lanjutButton.layer.cornerRadius = 15
        
        getNama()
    }
    
    func getNama(){
        print(homeScreenVC.nama)
    }
    
    
    @IBAction func lanjutButtonTapped(_ sender: Any) {
        print("Button Lanjut Tapped")
        
        let storyTelling = storyboard?.instantiateViewController(identifier: "Story Telling") as! ViewController
        storyTelling.modalPresentationStyle = .fullScreen
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        present(storyTelling, animated: false, completion: nil)
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        print("Button Back Tapped")
        
        let homeScreen = storyboard?.instantiateViewController(identifier: "Home Screen") as! HomeScreenViewController
        homeScreen.modalPresentationStyle = .fullScreen
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        present(homeScreen, animated: false, completion: nil)
    }
    
}
