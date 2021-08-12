//
//  win.swift
//  JoystickLynn
//
//  Created by Sri Endah Ramurti on 11/08/21.
//

import Foundation
import SpriteKit
import GameplayKit

class WinScene: SKScene {
    
    let win = SKSpriteNode (imageNamed: "racun menang")
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
    }
   
    override init(size: CGSize) {
        super.init(size: size)
        
        win.size = CGSize(width: size.width, height: size.height)
        win.position = CGPoint (x: size.width/2, y: size.height/2)
        win.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        addChild(win)
        startBackgroundMusic()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else{return}
        let touchLocation = touch.location(in: self)
        print("touched point: \(touchLocation)")
        
        
        if touchLocation.x <= 350 && touchLocation.y <= 220 {
            print ("touched")
            
            let scene = MainMenuScene(size: CGSize(width: self.size.width, height: self.size.height))
                        scene.scaleMode = self.scaleMode
                           // Set the scale mode to scale to fit the window
                         let sKView = self.view as! SKView
                            // Load the SKScene from 'GameScene.sks'
                                // Present the scene

                            sKView.presentScene(scene)
                            sKView.ignoresSiblingOrder = true
                            sKView.showsFPS = true
                            sKView.showsNodeCount = true
        }
    }
    func startBackgroundMusic(){
        let backgroundMusic = SKAudioNode(fileNamed: "Hooray Child.wav")
        backgroundMusic.autoplayLooped = true
        addChild(backgroundMusic)
    }

}
