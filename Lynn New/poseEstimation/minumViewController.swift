//
//  minumViewController.swift
//  Lynn New
//
//  Created by Sri Endah Ramurti on 07/08/21.
//

import UIKit

class minumViewController: UIViewController {
   

    @IBOutlet weak var drink: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

     
        // Do any additional setup after loading the view.
        
        drink.image = UIImage.gif(name: "Minum")
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(7), execute: {
            self.moveToGame()
        })
    }
    
    func moveToGame(){
        let shareNutrition = storyboard?.instantiateViewController(identifier: "Share Nutrition") as! GameViewController
        shareNutrition.modalPresentationStyle = .fullScreen

        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromBottom
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        view.window!.layer.add(transition, forKey: kCATransition)
        present(shareNutrition, animated: false, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
