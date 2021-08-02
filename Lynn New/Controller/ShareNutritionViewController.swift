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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = GameScene(size: self.view.bounds.size)
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
    

//    override var shouldAutorotate: Bool {
//        return true
//    }
//
//    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
//        if UIDevice.current.userInterfaceIdiom == .phone {
//            return .allButUpsideDown
//        } else {
//            return .all
//        }
//    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
