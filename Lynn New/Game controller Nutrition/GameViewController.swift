//
//  GameViewController.swift
//  shareNutritions2
//
//  Created by Sri Endah Ramurti on 01/08/21.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    
        
    @IBAction func home(_ sender: Any) {
        let main = MainMenuScene()
        
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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = MainMenuScene(size: self.view.bounds.size)
        scene.scaleMode = .fill
           // Set the scale mode to scale to fit the window
         let sKView = self.view as! SKView
            // Load the SKScene from 'GameScene.sks'
            
                
                // Present the scene
    
            sKView.presentScene(scene)
            sKView.ignoresSiblingOrder = true
            sKView.showsFPS = true
            sKView.showsNodeCount = true
        
        
        }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
