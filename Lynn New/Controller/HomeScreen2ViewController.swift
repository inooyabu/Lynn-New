//
//  HomeScreen2ViewController.swift
//  Lynn New
//
//  Created by Tenti Atika Putri on 25/07/21.
//

import UIKit

class HomeScreen2ViewController: UIViewController {

//    @IBOutlet weak var textGreeting: UILabel!
    @IBOutlet weak var lanjutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func lanjutButtonTapped(_ sender: Any) {
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
    
}
