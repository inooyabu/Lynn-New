// Function

import SpriteKit
import GameplayKit
import AudioToolbox

class PausePage: SKScene {

let background = SKSpriteNode (imageNamed: "starting nutrition")
let popUp = SKSpriteNode (imageNamed: "pop up game")
let help = SKSpriteNode (imageNamed: "Tanda tanya")
let out = SKSpriteNode (imageNamed: "Out")
let labelOut = SKLabelNode (fontNamed: "Chalkboard SE")
let labelHelp = SKLabelNode (fontNamed: "Chalkboard SE")
let close = SKSpriteNode (imageNamed: "Quit")
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
   
    override init(size: CGSize) {
        super.init(size: size)
        
        
        close.size = CGSize(width: 60, height: 60)
        close.position = CGPoint (x: size.width/3, y: size.height - 50)
        close.zPosition = 2
        addChild(close)
        
        labelOut.fontSize = 36
        labelOut.fontColor = .white
        labelOut.position = CGPoint (x: (size.width/2) + 40, y: (size.height/2) - 70)
        labelOut.text = "Keluar"
        labelOut.zPosition = 2
        addChild(labelOut)
        
        labelHelp.fontSize = 36
        labelHelp.fontColor = .white
        labelHelp.position = CGPoint (x: (size.width/2) + 50, y: (size.height/2) + 57)
        labelHelp.text = "Bantuan"
        labelHelp.zPosition = 2
        addChild(labelHelp)
        
        background.size = CGSize(width: size.width, height: size.height)
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        background.zPosition = 0
        addChild(background)
     
        popUp.size = CGSize(width: 375, height: 375)
        popUp.position = CGPoint(x: size.width/2, y: size.height/2)
        popUp.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        popUp.zPosition = 1
        addChild(popUp)
        
        help.size = CGSize(width: 70, height: 70)
        help.position = CGPoint(x: (size.width/2) - 50, y: (size.height/2) + 60)
        help.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        help.zPosition = 2
        addChild(help)
        
        out.size = CGSize(width: 70, height: 70)
        out.position = CGPoint(x: (size.width/2) - 50, y: (size.height/2) - 60)
        out.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        out.zPosition = 2
        addChild(out)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else{return}
        let touchLocation = touch.location(in: self)
        print("touched point: \(touchLocation)")
        
        if touchLocation.x >= close.position.x && touchLocation.x < (close.position.x) + 60 && touchLocation.y >= close.position.y {
            let scene = GameScene2(size: CGSize(width: self.size.width, height: self.size.height))
            scene.scaleMode = self.scaleMode
               // Set the scale mode to scale to fit the window
             let sKView = self.view as! SKView
                // Load the SKScene from 'GameScene.sks'
                    // Present the scene

                sKView.presentScene(scene)
                sKView.ignoresSiblingOrder = true
                sKView.showsFPS = true
                sKView.showsNodeCount = true
        } else if touchLocation.x >= help.position.x && touchLocation.x < (help.position.x) + 60 && touchLocation.y >= help.position.y {
            let scene = HelpPage1(size: CGSize(width: self.size.width, height: self.size.height))
            scene.scaleMode = self.scaleMode
               // Set the scale mode to scale to fit the window
             let sKView = self.view as! SKView
                // Load the SKScene from 'GameScene.sks'
                    // Present the scene

                sKView.presentScene(scene)
                sKView.ignoresSiblingOrder = true
                sKView.showsFPS = true
                sKView.showsNodeCount = true
            
    }else if touchLocation.x >= out.position.x && touchLocation.x < (help.position.x) + 60 && touchLocation.y >= out.position.y {
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
    
}

