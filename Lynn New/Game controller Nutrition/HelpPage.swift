//
//  HelpPage.swift
//  shareNutritions2
//
//  Created by Sri Endah Ramurti on 05/08/21.
//

import SpriteKit
import GameplayKit

class HelpPage1: SKScene {
    let help1 = SKSpriteNode (imageNamed: "help page 1")
    let background = SKSpriteNode (imageNamed: "starting nutrition")
   
    let nextPage = SKSpriteNode (imageNamed: "Sefron Kanan")
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
   
    override init(size: CGSize) {
        super.init(size: size)
        
        help1.size = CGSize(width: 530, height: 353)
        help1.position = CGPoint(x: size.width/2, y: size.height/2)
        help1.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        help1.zPosition = 1
        addChild(help1)
        
        background.size = CGSize(width: size.width, height: size.height)
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        background.zPosition = 0
        addChild(background)
        
        
        
        nextPage.size = CGSize(width: 60, height: 60)
        nextPage.position = CGPoint(x: (size.width/2) + 230, y: (size.height/2) - 120)
        nextPage.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        nextPage.zPosition = 2
        addChild(nextPage)
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else{return}
        let touchLocation = touch.location(in: self)
        print("touched point: \(touchLocation)")
        
        if touchLocation.x >= (size.width/2) - 235 && touchLocation.x < (size.width/2) - 175 && touchLocation.y >= (size.height/2) + 120{
            let scene = GameScene(size: CGSize(width: self.size.width, height: self.size.height))
            scene.scaleMode = self.scaleMode
               // Set the scale mode to scale to fit the window
             let sKView = self.view as! SKView
                // Load the SKScene from 'GameScene.sks'
                    // Present the scene

                sKView.presentScene(scene)
                sKView.ignoresSiblingOrder = true
                sKView.showsFPS = true
                sKView.showsNodeCount = true
    }else if touchLocation.x >= nextPage.position.x && touchLocation.x < (nextPage.position.x) + 60 && touchLocation.y >= nextPage.position.y {
        let scene = HelpPage2(size: CGSize(width: self.size.width, height: self.size.height))
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
}
class HelpPage2: SKScene{
    let help2 = SKSpriteNode (imageNamed: "help page 2")
    let background = SKSpriteNode (imageNamed: "starting nutrition")
   
    let nextPage = SKSpriteNode (imageNamed: "Sefron Kanan")
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
   
    override init(size: CGSize) {
        super.init(size: size)
        help2.size = CGSize(width: 530, height: 353)
        help2.position = CGPoint(x: size.width/2, y: size.height/2)
        help2.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        help2.zPosition = 1
        addChild(help2)
        
        background.size = CGSize(width: size.width, height: size.height)
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        background.zPosition = 0
        addChild(background)
        
        
        
        nextPage.size = CGSize(width: 60, height: 60)
        nextPage.position = CGPoint(x: (size.width/2) + 230, y: (size.height/2) - 120)
        nextPage.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        nextPage.zPosition = 2
        addChild(nextPage)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else{return}
        let touchLocation = touch.location(in: self)
        print("touched point: \(touchLocation)")
        
        if touchLocation.x >= (size.width/2) - 235 && touchLocation.x < (size.width/2) - 175 && touchLocation.y >= (size.height/2) + 120{
            let scene = GameScene(size: CGSize(width: self.size.width, height: self.size.height))
            scene.scaleMode = self.scaleMode
               // Set the scale mode to scale to fit the window
             let sKView = self.view as! SKView
                // Load the SKScene from 'GameScene.sks'
                    // Present the scene

                sKView.presentScene(scene)
                sKView.ignoresSiblingOrder = true
                sKView.showsFPS = true
                sKView.showsNodeCount = true
}else if touchLocation.x >= nextPage.position.x && touchLocation.x < (nextPage.position.x) + 60 && touchLocation.y >= nextPage.position.y {
    let scene = HelpPage3(size: CGSize(width: self.size.width, height: self.size.height))
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
    
}
class HelpPage3: SKScene {
    let help3 = SKSpriteNode (imageNamed: "help page 3")
    let background = SKSpriteNode (imageNamed: "starting nutrition")
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
   
    override init(size: CGSize) {
        super.init(size: size)
        help3.size = CGSize(width: 530, height: 353)
        help3.position = CGPoint(x: size.width/2, y: size.height/2)
        help3.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        help3.zPosition = 1
        addChild(help3)
        
        background.size = CGSize(width: size.width, height: size.height)
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        background.zPosition = 0
        addChild(background)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else{return}
        let touchLocation = touch.location(in: self)
        print("touched point: \(touchLocation)")
        
        if touchLocation.x >= (size.width/2) - 235 && touchLocation.x < (size.width/2) - 175 && touchLocation.y >= (size.height/2) + 120{
            let scene = GameScene(size: CGSize(width: self.size.width, height: self.size.height))
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
}

