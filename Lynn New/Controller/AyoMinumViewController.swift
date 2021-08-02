//
//  AyoMinumViewController.swift
//  Lynn New
//
//  Created by Tenti Atika Putri on 26/07/21.
//

import UIKit

class AyoMinumViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var lihatButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lihatButton.layer.cornerRadius = 15

    }
   
    @IBAction func backButtonTapped(_ sender: Any) {
        print("Button Back Tapped")
        let storyTelling = storyboard?.instantiateViewController(identifier: "Detect Drink") as! ViewController
        storyTelling.modalPresentationStyle = .fullScreen
        
        //untuk langsung back ke page terakhir di collectionview, tapi error
        //storyTelling.pageController.currentPage = 10
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        present(storyTelling, animated: false, completion: nil)

    }
    
    @IBAction func lihatButtonTapped(_ sender: Any) {
        print("Button Lihat Tapped")
    }
    
}
