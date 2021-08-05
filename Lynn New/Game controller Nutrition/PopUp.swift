//
//  PopUp.swift
//  shareNutritions2
//
//  Created by Sri Endah Ramurti on 04/08/21.
//

import SpriteKit
import GameplayKit

class brainPop: SKScene {
    
    
    
    public var call: String = ""
    let brain = SKSpriteNode (imageNamed: "Brain Happy 1")
    let kidney = SKSpriteNode (imageNamed: "Ginjal happy 1")
    let heart = SKSpriteNode (imageNamed: "Jantung happy 1")
    let muscle = SKSpriteNode (imageNamed: "Otot Happy 1")
    let lungs = SKSpriteNode (imageNamed: "Paru happy 1")
    let background = SKSpriteNode (imageNamed: "starting nutrition")
    let popUp = SKSpriteNode (imageNamed: "pop up brain")
    let close = SKSpriteNode (imageNamed: "Quit")
    

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
    }
   
    override init(size: CGSize) {
        super.init(size: size)
    
        background.size = CGSize(width: size.width, height: size.height)
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        addChild(background)
        
        popUp.size = CGSize(width: 510, height: 340)
        popUp.position = CGPoint(x: size.width/2, y: size.height/2)
        popUp.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        popUp.zPosition = 1
        addChild(popUp)
        
        close.size = CGSize(width: 60, height: 60)
        close.position = CGPoint(x: (size.width/2) - 230, y: (size.height/2) + 120)
        close.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        close.zPosition = 2
        addChild(close)
        
        brain.size = CGSize(width: 100, height: 100)
        brain.position = CGPoint(x: (size.width/2), y: (size.height/2) + 90)
        brain.zPosition = 2
                addChild(brain)
       
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else{return}
        let touchLocation = touch.location(in: self)
        print("touched point: \(touchLocation)")
        
        if touchLocation.x >= close.position.x && touchLocation.x < (close.position.x) + 60 && touchLocation.y >= close.position.y {
            
//            let scene = GameScene(size: CGSize(width: self.size.width, height: self.size.height))
//            scene.scaleMode = self.scaleMode
//               // Set the scale mode to scale to fit the window
//             let sKView = self.view as! SKView
//                // Load the SKScene from 'GameScene.sks'
//                    // Present the scene
//
//                sKView.presentScene(scene)
//                sKView.ignoresSiblingOrder = true
//                sKView.showsFPS = true
//                sKView.showsNodeCount = true
        }
    }
}

class kidneyPop: SKScene {
    
    
    
    public var call: String = ""
    let brain = SKSpriteNode (imageNamed: "Brain Happy 1")
    let kidney = SKSpriteNode (imageNamed: "Ginjal happy 1")
    let heart = SKSpriteNode (imageNamed: "Jantung happy 1")
    let muscle = SKSpriteNode (imageNamed: "Otot Happy 1")
    let lungs = SKSpriteNode (imageNamed: "Paru happy 1")
    let background = SKSpriteNode (imageNamed: "starting nutrition")
    let popUp = SKSpriteNode (imageNamed: "pop up kidney")
    let close = SKSpriteNode (imageNamed: "Quit")
    

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
    }
   
    override init(size: CGSize) {
        super.init(size: size)
    
        background.size = CGSize(width: size.width, height: size.height)
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        addChild(background)
        
        popUp.size = CGSize(width: 510, height: 340)
        popUp.position = CGPoint(x: size.width/2, y: size.height/2)
        popUp.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        popUp.zPosition = 1
        addChild(popUp)
        
        close.size = CGSize(width: 60, height: 60)
        close.position = CGPoint(x: (size.width/2) - 230, y: (size.height/2) + 120)
        close.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        close.zPosition = 2
        addChild(close)
        
        kidney.size = CGSize(width: 100, height: 100)
        kidney.position = CGPoint(x: (size.width/2), y: (size.height/2) + 90 )
        kidney.zPosition = 2
                addChild(kidney)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else{return}
        let touchLocation = touch.location(in: self)
        print("touched point: \(touchLocation)")
        
        if touchLocation.x >= close.position.x && touchLocation.x < (close.position.x) + 60 && touchLocation.y >= close.position.y {
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
class musclePop: SKScene {
    
    
    
    public var call: String = ""
    let brain = SKSpriteNode (imageNamed: "Brain Happy 1")
    let kidney = SKSpriteNode (imageNamed: "Ginjal happy 1")
    let heart = SKSpriteNode (imageNamed: "Jantung happy 1")
    let muscle = SKSpriteNode (imageNamed: "Otot Happy 1")
    let lungs = SKSpriteNode (imageNamed: "Paru happy 1")
    let background = SKSpriteNode (imageNamed: "starting nutrition")
    let popUp = SKSpriteNode (imageNamed: "pop up muscle")
    let close = SKSpriteNode (imageNamed: "Quit")
    
    

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
    }
   
    override init(size: CGSize) {
        super.init(size: size)
    
        background.size = CGSize(width: size.width, height: size.height)
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        addChild(background)
        
        popUp.size = CGSize(width: 510, height: 340)
        popUp.position = CGPoint(x: size.width/2, y: size.height/2)
        popUp.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        popUp.zPosition = 1
        addChild(popUp)
        
        close.size = CGSize(width: 60, height: 60)
        close.position = CGPoint(x: (size.width/2) - 230, y: (size.height/2) + 120)
        close.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        close.zPosition = 2
        addChild(close)
        
        muscle.size = CGSize(width: 100, height: 100)
        muscle.position = CGPoint(x: (size.width/2), y: (size.height/2) + 90 )
        muscle.zPosition = 2
                addChild(muscle)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else{return}
        let touchLocation = touch.location(in: self)
        print("touched point: \(touchLocation)")
        
        if touchLocation.x >= close.position.x && touchLocation.x < (close.position.x) + 60 && touchLocation.y >= close.position.y {
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
class lungsPop: SKScene {
    
    
    
    public var call: String = ""
    let brain = SKSpriteNode (imageNamed: "Brain Happy 1")
    let kidney = SKSpriteNode (imageNamed: "Ginjal happy 1")
    let heart = SKSpriteNode (imageNamed: "Jantung happy 1")
    let muscle = SKSpriteNode (imageNamed: "Otot Happy 1")
    let lungs = SKSpriteNode (imageNamed: "Paru happy 1")
    let background = SKSpriteNode (imageNamed: "starting nutrition")
    let popUp = SKSpriteNode (imageNamed: "pop up lungs")
    let close = SKSpriteNode (imageNamed: "Quit")
    

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
    }
   
    override init(size: CGSize) {
        super.init(size: size)
    
        background.size = CGSize(width: size.width, height: size.height)
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        addChild(background)
        
        popUp.size = CGSize(width: 510, height: 340)
        popUp.position = CGPoint(x: size.width/2, y: size.height/2)
        popUp.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        popUp.zPosition = 1
        addChild(popUp)
        
        close.size = CGSize(width: 60, height: 60)
        close.position = CGPoint(x: (size.width/2) - 230, y: (size.height/2) + 120)
        close.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        close.zPosition = 2
        addChild(close)
        
        lungs.size = CGSize(width: 100, height: 100)
        lungs.position = CGPoint(x: (size.width/2), y: (size.height/2) + 90 )
        lungs.zPosition = 2
                addChild(lungs)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else{return}
        let touchLocation = touch.location(in: self)
        print("touched point: \(touchLocation)")
        
        if touchLocation.x >= close.position.x && touchLocation.x < (close.position.x) + 60 && touchLocation.y >= close.position.y {
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
class heartPop: SKScene {
    
    
    
    public var call: String = ""
    let brain = SKSpriteNode (imageNamed: "Brain Happy 1")
    let kidney = SKSpriteNode (imageNamed: "Ginjal happy 1")
    let heart = SKSpriteNode (imageNamed: "Jantung happy 1")
    let muscle = SKSpriteNode (imageNamed: "Otot Happy 1")
    let lungs = SKSpriteNode (imageNamed: "Paru happy 1")
    let background = SKSpriteNode (imageNamed: "starting nutrition")
    let popUp = SKSpriteNode (imageNamed: "pop up heart")
    let close = SKSpriteNode (imageNamed: "Quit")
    

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
    }
   
    override init(size: CGSize) {
        super.init(size: size)
    
        background.size = CGSize(width: size.width, height: size.height)
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        addChild(background)
        
        popUp.size = CGSize(width: 510, height: 340)
        popUp.position = CGPoint(x: size.width/2, y: size.height/2)
        popUp.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        popUp.zPosition = 1
        addChild(popUp)
        
        close.size = CGSize(width: 60, height: 60)
        close.position = CGPoint(x: (size.width/2) - 230, y: (size.height/2) + 120)
        close.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        close.zPosition = 2
        addChild(close)
        
        heart.size = CGSize(width: 100, height: 100)
        heart.position = CGPoint(x: (size.width/2), y: (size.height/2) + 90 )
        heart.zPosition = 2
                addChild(heart)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else{return}
        let touchLocation = touch.location(in: self)
        print("touched point: \(touchLocation)")
        
        if touchLocation.x >= close.position.x && touchLocation.x < (close.position.x) + 60 && touchLocation.y >= close.position.y {
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
