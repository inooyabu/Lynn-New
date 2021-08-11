//MainMenuScene

import Foundation
import SpriteKit
import UIKit

class MainMenuScene: SKScene {
    let background = SKSpriteNode(imageNamed: "starting nutrition")
    let bubble = SKSpriteNode(imageNamed: "Bubble")
    let lynn1 = SKSpriteNode(imageNamed: "Lynn move depan 1")
    var label = SKLabelNode (fontNamed: "Chalkboard SE")
    let button = SKLabelNode (fontNamed: "Chalkboard SE")
    let home = SKSpriteNode (imageNamed: "Home")
    
    override func didMove(to view: SKView) {
        
       
        home.size = CGSize (width: 50, height: 50)
        home.position = CGPoint(x: (size.width/2) * 0.1, y: size.height - 70 )
        home.anchorPoint = CGPoint (x: 0.0, y: 0.0)
        addChild(home)
        
        
        background.size = CGSize(width: frame.maxX, height: frame.maxY)
        background.position = CGPoint(x: size.width/2,
                                          y: size.height/2)
        background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        background.name = "starting nutrition"
        background.zPosition = -1
        addChild(background)
        bubble.position = CGPoint(x: (size.width/2) + 70, y: size.height - 150)
        bubble.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        bubble.size = CGSize(width: 600, height: 274)
        addChild(bubble)
        
        lynn1.position = CGPoint(x: bubble.position.x - 325, y: bubble.position.y - 80)
        lynn1.zPosition = 1
        lynn1.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        lynn1.size = CGSize(width: 250, height: 250)
        addChild(lynn1)
        
        label.position = CGPoint(x: (bubble.position.x) + 20 , y: bubble.position.y + 20)
        label.fontSize = 17
        label.zPosition = 2
        label.color = SKColor.white
        label.horizontalAlignmentMode = .center
        label.verticalAlignmentMode = .center
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.preferredMaxLayoutWidth = 470
        label.numberOfLines = 0
        
        label.text = "Setiap hari, manusia membutuhkan makanan yang bergizi untuk memenuhi nutrisi yang diperlukan oleh organ di dalam tubuh. Agar nutrisi dapat terserap dengan baik, aku bisa membantumu untuk mengantarkannya. Ayo berpetualang bersamaku!"
        
        addChild(label)
        
        button.position = CGPoint (x: (size.width/2) + 20, y: size.height - 350)
        button.fontSize = 15
        button.fontColor = .white
        button.text = "Sentuh layar untuk memulai"
        addChild(button)
        
        startBackgroundMusic()
        
    }
    
    #if os(iOS)
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for touch in touches {
//                  let location = touch.location(in: self)
//                  let touchedNode = atPoint(location)
//                  if touchedNode.name == "HelloButton" {
//                       // Call the function here.
                    sceneTapped()
               //   } override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else{return}
        let touchLocation = touch.location(in: self)
        print("touched point: \(touchLocation)")
        
    }
    #else
    override func mouseDown(with theEvent: NSEvent) {
        sceneTapped()
    }

    #endif
    
    func sceneTapped() {
        let gameScene = GameScene(size: size)
        gameScene.scaleMode = scaleMode
        
        let transition = SKTransition.fade(withDuration: 3.0)
        view?.presentScene(gameScene, transition: transition)
    }
    func startBackgroundMusic(){
        let backgroundMusic = SKAudioNode(fileNamed: "game nutrisi.mp3")
        backgroundMusic.autoplayLooped = true
        addChild(backgroundMusic)
    }
    

}
