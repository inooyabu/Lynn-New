
import SpriteKit
import GameplayKit
import AudioToolbox

class GameScene: SKScene, SKPhysicsContactDelegate {
 
    //Logic game will be written in GameScene
   let background = SKSpriteNode (imageNamed: "background nutrition")
    let lynn = SKSpriteNode(imageNamed: "Lynn move depan 1")
    let kidney = SKSpriteNode(imageNamed: "Ginjal sedih 2")
    let heart = SKSpriteNode (imageNamed: "Jantung sedih 2")
    let brain = SKSpriteNode (imageNamed: "Otak sedih 2")
    let lungs = SKSpriteNode (imageNamed: "Paru sedih 2")
    let muscle = SKSpriteNode (imageNamed: "Otot sedih 2")
    let pauseButton = SKSpriteNode (imageNamed: "Pause")
    var call1 = String()
    let requestBrain = SKSpriteNode (imageNamed: "request")
    let requestKidney = SKSpriteNode (imageNamed: "pop up flip")
    let requestHeart = SKSpriteNode (imageNamed: "request")
    let requestLungs = SKSpriteNode (imageNamed: "request")
    let requestMuscle = SKSpriteNode (imageNamed: "pop up flip")
    var renderTime : TimeInterval = 0.0
    var changeTime : TimeInterval = 1
    var second = 0
    var minute = 0
    var counterTimer = Timer()
    var timer : SKLabelNode = SKLabelNode()
    let brainPop = SKSpriteNode (imageNamed: "brainPop")
    let kidneyPop = SKSpriteNode (imageNamed: "kidneyPop")
    let lungsPop = SKSpriteNode (imageNamed: "lungsPop")
    let heartPop = SKSpriteNode (imageNamed: "heartPop")
    let musclePop = SKSpriteNode (imageNamed: "musclePop")
    let button = SKSpriteNode (imageNamed: "startgame")
    let level2 = SKSpriteNode (imageNamed: "level2")
    let endGame = SKSpriteNode (imageNamed: "endGame")
    
let playerContact : UInt32 = 0x1 << -2

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
   
    override init(size: CGSize) {
        super.init(size: size)
        
        level2.size = CGSize(width: 510, height: 340)
        level2.position = CGPoint (x: size.width/2, y: size.height/2)
        level2.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        level2.zPosition = 4
        level2.isHidden = true
        addChild(level2)
        
        endGame.size = CGSize(width: 510, height: 340)
        endGame.position = CGPoint (x: size.width/2, y: size.height/2)
        endGame.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        endGame.zPosition = 4
        endGame.isHidden = true
        addChild(endGame)
        
        button.size = CGSize (width: size.width, height: size.height)
        button.position = CGPoint (x: size.width/2, y: size.height/2)
        button.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        button.zPosition = 3
        addChild(button)
        
    
        //self.view?.bounds.size = background.size
        physicsWorld.contactDelegate = self
        physicsWorld.gravity = .zero
        physicsBody?.velocity = (CGVector(dx: 1.0, dy: 0.5))
        isUserInteractionEnabled = true
        
   
        pauseButton.size = CGSize(width: 50, height: 50)
        pauseButton.position = CGPoint(x: size.width - 75, y: size.height - 75)
        pauseButton.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        addChild(pauseButton)
        
        background.subdivisionLevels = .min
        background.size = CGSize(width: frame.size.width, height: frame.size.height)
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.zPosition = -1
        //background.anchorPoint = CGPoint(x: 0.0, y: 0.0)
    
        addChild(background)
        
    
    
  //      add pLynn
        lynn.zPosition = 1
        lynn.size = CGSize(width: 65, height: 65)
        lynn.position = CGPoint(x: size.width/2, y: 30)
        lynn.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        lynn.physicsBody = SKPhysicsBody(circleOfRadius: lynn.size.width/4)
        lynn.physicsBody?.isDynamic = true
        lynn.physicsBody?.linearDamping = 1.0
        lynn.physicsBody?.contactTestBitMask = playerContact
        lynn.name = "Lynn"
        addChild(lynn)
        
        //add Kidney
        kidney.zPosition = 1
        kidney.size = CGSize (width: 90, height: 90)
        kidney.position = CGPoint(x: ((size.width)/4) * 3.2, y: (size.height) - 135)
        //anchor point utk menunjukkan kordinat si nodenya
        kidney.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        //player2.physicsBody = SKPhysicsBody(circleOfRadius: player2.size.width/3)
        kidney.physicsBody?.isDynamic = true
        kidney.physicsBody?.linearDamping = 1.0
        kidney.physicsBody?.contactTestBitMask = playerContact
        kidney.name = "Kidney "
        player2moved()
        addChild(kidney)
        
        
        //add heart
        lungs.zPosition = 1
        lungs.size = CGSize(width: 90, height: 90)
        lungs.position = CGPoint(x: ((size.width) / 8) * 0.78, y: (size.height) - 165)
        lungs.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        //heart.physicsBody = SKPhysicsBody(circleOfRadius: heart.size.height/3)
        lungs.physicsBody?.isDynamic = true
        lungs.physicsBody?.linearDamping = 1.0
        lungs.physicsBody?.contactTestBitMask = playerContact
        lungs.name = "Lungs"
        lungsSad()
        addChild(lungs)
    
        //add brain
        heart.zPosition = 1
        heart.size = CGSize (width: 90, height: 90)
        heart.position = CGPoint(x: ((size.width) / 13) * 0.87, y: (size.height) - 315)
       //anchor point utk menunjukkan kordinat si nodenya
        heart.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        //brain.physicsBody = SKPhysicsBody(circleOfRadius: player2.size.width/3)
        heart.physicsBody?.isDynamic = true
        heart.physicsBody?.linearDamping = 1.0
        heart.physicsBody?.contactTestBitMask = playerContact
        heart.name = "Heart"
        heartmoved()
        addChild(heart)
    
    //add lungs
        brain.zPosition = 1
        brain.size = CGSize (width: 90, height: 90)
        brain.position = CGPoint(x: (size.width / 2) * 0.89, y: size.height - 110)
        //anchor point utk menunjukkan kordinat si nodenya
        brain.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        //lungs.physicsBody = SKPhysicsBody(circleOfRadius: player2.size.width/3)
        brain.physicsBody?.isDynamic = true
        brain.physicsBody?.linearDamping = 1.0
        // lungs.physicsBody?.contactTestBitMask = playerContact
        brain.name = "Brain"
        brainSad()
        addChild(brain)
        
    
       //add muscle
        muscle.zPosition = 1
        muscle.size = CGSize (width: 100, height: 100)
        muscle.position = CGPoint(x: ((size.width)/5) * 4 , y: (size.height) - 360)
        //anchor point utk menunjukkan kordinat si nodenya
        muscle.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        //muscle.physicsBody = SKPhysicsBody(circleOfRadius: player2.size.width/3)//
        muscle.physicsBody?.isDynamic = true
        muscle.physicsBody?.linearDamping = 1.0
        // muscle.physicsBody?.contactTestBitMask = playerContact
        muscle.name = "Muscle"
        muscleSad()
        addChild(muscle)
    
        requestBrain.size = CGSize(width: 123, height: 53)
        requestBrain.zPosition = 3
        requestBrain.position = CGPoint(x: brain.position.x + 100, y: brain.position.y + 80)
        requestBrain.isHidden = true
        addChild(requestBrain)
   
        requestKidney.size = CGSize(width: 123, height: 53)
        requestKidney.zPosition = 3
        requestKidney.position = CGPoint(x: kidney.position.x - 40, y: kidney.position.y + 80)
        requestKidney.isHidden = true
        addChild(requestKidney)
        
        requestHeart.size = CGSize(width: 123, height: 53)
        requestHeart.zPosition = 3
        requestHeart.position = CGPoint(x: heart.position.x + 100, y: heart.position.y + 80)
        requestHeart.isHidden = true
        addChild(requestHeart)
        
        requestLungs.size = CGSize(width: 123, height: 53)
        requestLungs.zPosition = 3
        requestLungs.position = CGPoint(x: lungs.position.x + 100, y: lungs.position.y + 80)
        requestLungs.isHidden = true
        addChild(requestLungs)
        
        requestMuscle.size = CGSize(width: 123, height: 53)
        requestMuscle.zPosition = 3
        requestMuscle.position = CGPoint(x: muscle.position.x - 40, y: muscle.position.y + 80)
        requestMuscle.isHidden = true
        addChild(requestMuscle)
        
        
        timer.fontName = "Chalkboard SE"
        timer.fontSize = 12
        timer.position = CGPoint (x: 40, y: (size.height - 40))
        timer.text = "0.0"
       // addChild(timer)
        
        brainPop.size = CGSize(width: 510, height: 340)
        brainPop.position = CGPoint(x: size.width/2, y: size.height/2)
        brainPop.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        brainPop.zPosition = 4
        brainPop.isHidden = true
        addChild(brainPop)
        
        heartPop.size = CGSize(width: 510, height: 340)
        heartPop.position = CGPoint(x: size.width/2, y: size.height/2)
        heartPop.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        heartPop.zPosition = 4
        heartPop.isHidden = true
        addChild(heartPop)
        
        musclePop.size = CGSize(width: 510, height: 340)
        musclePop.position = CGPoint(x: size.width/2, y: size.height/2)
        musclePop.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        musclePop.zPosition = 4
        musclePop.isHidden = true
        addChild(musclePop)
        
        lungsPop.size = CGSize(width: 510, height: 340)
        lungsPop.position = CGPoint(x: size.width/2, y: size.height/2)
        lungsPop.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        lungsPop.zPosition = 4
        lungsPop.isHidden = true
        addChild(lungsPop)
        
        kidneyPop.size = CGSize(width: 510, height: 340)
        kidneyPop.position = CGPoint(x: size.width/2, y: size.height/2)
        kidneyPop.anchorPoint = CGPoint (x: 0.5, y: 0.5)
        kidneyPop.zPosition = 4
        kidneyPop.isHidden = true
        addChild(kidneyPop)
    
       // startCounter()
        
        startBackgroundMusic()
        
        
        
}
    func startBackgroundMusic(){
        let backgroundMusic = SKAudioNode(fileNamed: "backgroundSound.mp3")
        backgroundMusic.autoplayLooped = true
        addChild(backgroundMusic)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else{return}
        let touchLocation = touch.location(in: self)
        print("touched point: \(touchLocation)")
        
      
   
        if touchLocation.x >= (kidney.position.x) && touchLocation.x < (kidney.position.x) + 70 && touchLocation.y >= (kidney.position.y) {
            lynn.physicsBody?.velocity = (CGVector(dx: 0, dy: ((kidney.position.y) - 20) - (lynn.position.y)))
            pinkForward()
            
        
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3), execute: {
            self.lynn.physicsBody?.velocity = CGVector(dx: ((self.kidney.position.x)-(self.lynn.position.x)) + 20 , dy: 0)
            self.pinkRight()
            })
            
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(7), execute: {
            self.player2moved2()
                self.lynn.isHidden = true
                self.lynn.position = CGPoint(x: self.size.width/2, y: 30)
                self.pinkForward()
                self.requestKidney.isHidden = true
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(8), execute: {
                self.lynn.isHidden = false
               
                self.kidneyPop.isHidden = false
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(18), execute: {
                self.kidneyPop.isHidden = true
                self.requestMuscle.isHidden = false
            })
                   
        }else if touchLocation.x > (lungs.position.x) && touchLocation.x <= (lungs.position.x) + 75 &&  touchLocation.y >= (lungs.position.y) && touchLocation.y < (lungs.position.y) + 75 {
            
            lynn.physicsBody?.velocity = (CGVector(dx: 0, dy: ((heart.position.y) - (lynn.position.y)) + 77))
             pinkForward()
               
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
                self.lynn.physicsBody?.velocity = (CGVector(dx: ((self.lungs.position.x) - (self.lynn.position.x)) + 200, dy:0))
                self.pinkLeft()
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3), execute: {
                self.lynn.physicsBody?.velocity = (CGVector(dx: 0, dy:((self.lungs.position.y) - (self.lynn.position.y)) + 67 ))
                self.pinkForward()
            
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5), execute: {
                self.lynn.physicsBody?.velocity = (CGVector(dx: ((self.lungs.position.x) + 80) - (self.lynn.position.x), dy:0))
                self.pinkLeft()
                self.requestLungs.isHidden = true
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(6), execute: {
            self.lungsHappy()
                self.lynn.isHidden = true
                self.lynn.position = CGPoint(x: (self.size.width/2), y: 30)
                
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(9), execute: {
                self.lynn.isHidden = false
                self.pinkForward()
                
                self.lungsPop.isHidden = false
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(19), execute: {
                self.lungsPop.isHidden = true
                self.endGame.isHidden = false
            })
        }else if  touchLocation.x >= (brain.position.x) && touchLocation.x < (brain.position.x) + 95 && touchLocation.y >= (brain.position.y) && touchLocation.y < (brain.position.y) + 95 {
            
           
            lynn.physicsBody?.velocity = (CGVector(dx: 0, dy: (brain.position.y) - (lynn.position.y)))
                   pinkForward()
                    
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4), execute: {
                    self.lynn.isHidden = true
                    self.lynn.position = CGPoint(x: (self.size.width/2) + 10, y: 30)
                    self.brainHappy()
                   self.requestBrain.isHidden = true
                })
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(4), execute: {
                self.lynn.isHidden = false
                self.brainPop.isHidden = false
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(14), execute: {
                self.brainPop.isHidden = true
                self.requestHeart.isHidden = false
            })
            
        } else if  touchLocation.x >= (heart.position.x) && touchLocation.x < (heart.position.x) + 95 && touchLocation.y >= (heart.position.y) && touchLocation.y < (heart.position.y) + 95{
            
            
                lynn.physicsBody?.velocity = (CGVector(dx: 0, dy: ((heart.position.y)-(lynn.position.y)) + 60))
                   pinkForward()
              
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
                
                    self.lynn.physicsBody?.velocity = (CGVector(dx:((self.heart.position.x) - (self.lynn.position.x)) + 58, dy:0 ))
                    self.pinkLeft()
                    
                })
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5), execute: {
            
                self.lynn.isHidden = true
                self.heartmoved2()
                self.lynn.position = CGPoint(x: (self.size.width/2) + 10, y: 30)
                self.requestHeart.isHidden = true
                
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(6), execute: {
            
                self.lynn.isHidden = false
                self.pinkForward()
                
               
                self.heartPop.isHidden = false
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(16), execute: {
                self.heartPop.isHidden = true
                self.requestKidney.isHidden = false
            })
        }else if   touchLocation.x >= (muscle.position.x) && touchLocation.x < (muscle.position.x) + 100 && touchLocation.y >= (muscle.position.y) && touchLocation.y < (muscle.position.y) + 100 {
            
            lynn.physicsBody?.velocity = (CGVector(dx: 0, dy: ((muscle.position.y) - (muscle.position.y)) + 60 ))

        //            DispatchQueue.main.async {
        //                AudioServicesPlayAlertSound(SystemSoundID(1324) )
        //                self.pinkForward()
        //            }
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: {
                    self.lynn.physicsBody?.velocity = (CGVector(dx: (self.muscle.position.x) - (self.lynn.position.x), dy: 0 ))
                    self.pinkRight()
                })
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5), execute: {
                self.muscleHappy()
                self.lynn.isHidden = true
                self.lynn.position = CGPoint(x: (self.size.width/2) + 10, y: 30)
                self.requestMuscle.isHidden = true
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(6),  execute: {
                self.pinkForward()
                self.lynn.isHidden = false
              
                self.musclePop.isHidden = false
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(16), execute: {
                self.musclePop.isHidden = true
                self.requestLungs.isHidden = false
            })
        }else if touchLocation.x >= pauseButton.position.x && touchLocation.x < (pauseButton.position.x) + 60 && touchLocation.y >= pauseButton.position.y && touchLocation.y < (pauseButton.position.y) + 60{
           brainHappy()
            let scene = PausePage(size: CGSize(width: self.size.width, height: self.size.height))
            scene.scaleMode = self.scaleMode
               // Set the scale mode to scale to fit the window
             let sKView = self.view as! SKView
                // Load the SKScene from 'GameScene.sks'
                    // Present the scene

                sKView.presentScene(scene)
                sKView.ignoresSiblingOrder = true
                sKView.showsFPS = true
                sKView.showsNodeCount = true

            
        } else if touchLocation.x >= (button.position.x) - 100 && touchLocation.x < (button.position.x) + 100 && touchLocation.y >= (button.position.y) - 50 && touchLocation.y < (button.position.y) + 50 {
            requestBrain.isHidden = false
            button.isHidden = true
        } else if touchLocation.x >= (endGame.position.x) - 260 && touchLocation.x < (endGame.position.x) + 260 && touchLocation.y <= (endGame.position.y) - 100 {
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

        }else if touchLocation.x >= (endGame.position.x) - 260 && touchLocation.x < (endGame.position.x) + 260 && touchLocation.y >= (endGame.position.y) + 100 {
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
//    func brainUp() {
//
//    let scene = brainPop(size: CGSize(width: self.size.width, height: self.size.height))
//    scene.scaleMode = self.scaleMode
//       // Set the scale mode to scale to fit the window
//     let sKView = self.view as! SKView
//        // Load the SKScene from 'GameScene.sks'
//            // Present the scene
//
//        sKView.presentScene(scene)
//        sKView.ignoresSiblingOrder = true
//        sKView.showsFPS = true
//        sKView.showsNodeCount = true
//
// }
//    func kidneyUp() {
//
//    let scene = kidneyPop(size: CGSize(width: self.size.width, height: self.size.height))
//    scene.scaleMode = self.scaleMode
//       // Set the scale mode to scale to fit the window
//     let sKView = self.view as! SKView
//        // Load the SKScene from 'GameScene.sks'
//            // Present the scene
//
//        sKView.presentScene(scene)
//        sKView.ignoresSiblingOrder = true
//        sKView.showsFPS = true
//        sKView.showsNodeCount = true
//
// }
//    func heartUp() {
//
//    let scene = heartPop(size: CGSize(width: self.size.width, height: self.size.height))
//    scene.scaleMode = self.scaleMode
//       // Set the scale mode to scale to fit the window
//     let sKView = self.view as! SKView
//        // Load the SKScene from 'GameScene.sks'
//            // Present the scene
//
//        sKView.presentScene(scene)
//        sKView.ignoresSiblingOrder = true
//        sKView.showsFPS = true
//        sKView.showsNodeCount = true
//            self.removeAllActions()
//
//
// }
//    func lungsUp() {
//
//    let scene = lungsPop(size: CGSize(width: self.size.width, height: self.size.height))
//    scene.scaleMode = self.scaleMode
//       // Set the scale mode to scale to fit the window
//     let sKView = self.view as! SKView
//        // Load the SKScene from 'GameScene.sks'
//            // Present the scene
//
//        sKView.presentScene(scene)
//        sKView.ignoresSiblingOrder = true
//        sKView.showsFPS = true
//        sKView.showsNodeCount = true
//
// }
//    func muscleUp() {
//
//    let scene = musclePop(size: CGSize(width: self.size.width, height: self.size.height))
//    scene.scaleMode = self.scaleMode
//       // Set the scale mode to scale to fit the window
//        let sKView = self.view as! SKView
//        // Load the SKScene from 'GameScene.sks'
//            // Present the scene
//
//        sKView.presentScene(scene)
//        sKView.ignoresSiblingOrder = true
//        sKView.showsFPS = true
//        sKView.showsNodeCount = true
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
//            self.removeFromParent()
//        })
// }
    
func pinkLeft(){
let textureAtlas = SKTextureAtlas(named: "Lynn")
let pinky = [textureAtlas.textureNamed("Lynn move kiri 1"), textureAtlas.textureNamed("Lynn move kiri 1"), textureAtlas.textureNamed("Lynn move kiri 2"), textureAtlas.textureNamed("Lynn move kiri 1"), textureAtlas.textureNamed("Lynn move kiri 2"), textureAtlas.textureNamed("Lynn move kiri 1"), textureAtlas.textureNamed("Lynn move kiri 2"), textureAtlas.textureNamed("Lynn move kiri 1")]

let pinkLeftTexture = pinky
let animateAction = SKAction.animate(with:pinkLeftTexture, timePerFrame: 0.5)
lynn.run(animateAction)
}
func pinkRight(){
let textureAtlas = SKTextureAtlas(named: "Lynn")
let pinky = [textureAtlas.textureNamed("Lynn move kanan 1"), textureAtlas.textureNamed("Lynn move kanan 1"), textureAtlas.textureNamed("Lynn move kanan 2"), textureAtlas.textureNamed("Lynn move kanan 1"), textureAtlas.textureNamed("Lynn move kanan 2"), textureAtlas.textureNamed("Lynn move kanan 1"), textureAtlas.textureNamed("Lynn move kanan 2"), textureAtlas.textureNamed("Lynn move kanan 1")]
let pinkRightTexture = pinky
let animateAction = SKAction.animate(with:pinkRightTexture, timePerFrame: 0.5)
lynn.run(animateAction)
}
func pinkForward(){
let textureAtlas = SKTextureAtlas(named: "Lynn")
let pinky = [textureAtlas.textureNamed("Lynn move depan 1"), textureAtlas.textureNamed("Lynn move depan 1"), textureAtlas.textureNamed("Lynn move depan 2"), textureAtlas.textureNamed("Lynn move depan 1"), textureAtlas.textureNamed("Lynn move depan 2"), textureAtlas.textureNamed("Lynn move depan 1"), textureAtlas.textureNamed("Lynn move depan 2"), textureAtlas.textureNamed("Lynn move depan 1")]
let pinkForwardTexture = pinky
let animateAction = SKAction.animate(with:pinkForwardTexture, timePerFrame: 0.5)
lynn.run(animateAction)
}



    func lynnIdle(){
        let textureAtlas =  SKTextureAtlas(named: "Lynny")
        let Lynn = [textureAtlas.textureNamed("Lynn Idle 1"), textureAtlas.textureNamed("Lynn Idle 2"), textureAtlas.textureNamed("Lynn Idle 1"), textureAtlas.textureNamed("Lynn Idle 2"), textureAtlas.textureNamed("Lynn Idle 1"), textureAtlas.textureNamed("Lynn Idle 2"), textureAtlas.textureNamed("Lynn Idle 1")]
        
        let lynnIdleTexture = Lynn
        let animateAction = SKAction.animate(with:lynnIdleTexture, timePerFrame: 0.5)
        lynn.run(animateAction)
        }
    func lynnLeft(){
        let textureAtlas =  SKTextureAtlas(named: "Lynny")
        let Lynn = [textureAtlas.textureNamed("Lynn move kiri 1"), textureAtlas.textureNamed("Lynn move kiri 2"), textureAtlas.textureNamed("Lynn move kiri 1"), textureAtlas.textureNamed("Lynn move kiri 2"), textureAtlas.textureNamed("Lynn move kiri 1"), textureAtlas.textureNamed("Lynn move kiri 2"), textureAtlas.textureNamed("Lynn move kiri 1")]
        
        let lynnLeftTexture = Lynn
        let animateAction = SKAction.animate(with:lynnLeftTexture, timePerFrame: 0.5)
        lynn.run(animateAction)
        }
    
    func lynnRight(){
        let textureAtlas =  SKTextureAtlas(named: "Lynny")
        let Lynn = [textureAtlas.textureNamed("Lynn move kanan 1"), textureAtlas.textureNamed("Lynn move kanan 2"), textureAtlas.textureNamed("Lynn move kanan 1"), textureAtlas.textureNamed("Lynn move kanan 2"), textureAtlas.textureNamed("Lynn move kanan 1"), textureAtlas.textureNamed("Lynn move kanan 2"), textureAtlas.textureNamed("Lynn move kanan 1")]
        
        let lynnRightTexture = Lynn
        let animateAction = SKAction.animate(with:lynnRightTexture, timePerFrame: 0.5)
        lynn.run(animateAction)
        }
    
    func lynnForward(){
        let textureAtlas =  SKTextureAtlas(named: "Lynny")
        let Lynn = [textureAtlas.textureNamed("Lynn move depan 1"), textureAtlas.textureNamed("Lynn move depan 2"), textureAtlas.textureNamed("Lynn move depan 1"), textureAtlas.textureNamed("Lynn move depan 2"), textureAtlas.textureNamed("Lynn move depan 1"), textureAtlas.textureNamed("Lynn move depan 2"), textureAtlas.textureNamed("Lynn move depan 1")]
        
        let lynnForwardTexture = Lynn
        let animateAction = SKAction.animate(with:lynnForwardTexture, timePerFrame: 0.5)
        lynn.run(animateAction)
        }
    func player2moved(){
        let textureAtlas = SKTextureAtlas(named: "Kidney")
        let frame0 = textureAtlas.textureNamed("Ginjal sedih 1")
        let frame1 = textureAtlas.textureNamed("Ginjal sedih 2")
    
        let player2Texture = [frame0,frame1,frame0,frame1,frame0,frame1]
        
        let animateAction = SKAction.animate(with:player2Texture, timePerFrame: 0.5)
        kidney.run(animateAction)
        
    }
    func player2moved2(){
        let textureAtlas = SKTextureAtlas(named: "Kidney")
        let frame0 = textureAtlas.textureNamed("Ginjal happy 1")
        let frame1 = textureAtlas.textureNamed("Ginjal happy 2")
    
        let player2Texture = [frame0,frame1]
        
        let animateAction = SKAction.animate(with:player2Texture, timePerFrame: 0.2)
        kidney.run(animateAction)
        
    }
    func heartmoved(){
        let textureAtlas = SKTextureAtlas(named: "Heart")
        let frame0 = textureAtlas.textureNamed("Jantung sedih 1")
        let frame1 = textureAtlas.textureNamed("Jantung sedih 2")
        let frame2 = textureAtlas.textureNamed("Jantung sedih 1")
        let frame3 = textureAtlas.textureNamed("Jantung sedih 2")
    
        let player2Texture = [frame0,frame1,frame2,frame3]
        
        let animateAction = SKAction.animate(with:player2Texture, timePerFrame: 0.5)
        heart.run(animateAction)
    }
    func heartmoved2(){
        let textureAtlas = SKTextureAtlas(named: "Heart")
        let frame0 = textureAtlas.textureNamed("Jantung happy 1")
        let frame1 = textureAtlas.textureNamed("Jantung happy 2")
        let frame2 = textureAtlas.textureNamed("Jantung happy 1")
        let frame3 = textureAtlas.textureNamed("Jantung happy 2")
    
        let player2Texture = [frame0,frame1,frame2,frame3]
        
        let animateAction = SKAction.animate(with:player2Texture, timePerFrame: 0.5)
        heart.run(animateAction)
    }
    
    func brainHappy(){
        let textureAtlas =  SKTextureAtlas(named: "Brain")
        let Brain = [textureAtlas.textureNamed("Brain Happy 1"), textureAtlas.textureNamed("Brain Happy 2"), textureAtlas.textureNamed("Brain Happy 1"), textureAtlas.textureNamed("Brain Happy 2"), textureAtlas.textureNamed("Brain Happy 1"), textureAtlas.textureNamed("Brain Happy 2"), textureAtlas.textureNamed("Brain Happy 1")]
        
        let brainHappyTexture = Brain
        let animateAction = SKAction.animate(with:brainHappyTexture, timePerFrame: 0.5)
        brain.run(animateAction)
        }
    
    func brainSad(){
        let textureAtlas =  SKTextureAtlas(named: "Brain")
        let Brain = [textureAtlas.textureNamed("Otak sedih 1"), textureAtlas.textureNamed("Otak sedih 2"), textureAtlas.textureNamed("Otak sedih 1"), textureAtlas.textureNamed("Otak sedih 2"), textureAtlas.textureNamed("Otak sedih 1"), textureAtlas.textureNamed("Otak sedih 2"), textureAtlas.textureNamed("Otak sedih 1")]
        
        let brainSedihTexture = Brain
        let animateAction = SKAction.animate(with:brainSedihTexture, timePerFrame: 0.5)
        brain.run(animateAction)
        }
    
    func muscleHappy(){
        let textureAtlas =  SKTextureAtlas(named: "Muscle")
        let Muscle = [textureAtlas.textureNamed("Otot Happy 1"), textureAtlas.textureNamed("Otot Happy 2"), textureAtlas.textureNamed("Otot Happy 1"), textureAtlas.textureNamed("Otot Happy 2"), textureAtlas.textureNamed("Otot Happy 1"), textureAtlas.textureNamed("Otot Happy 2"), textureAtlas.textureNamed("Otot Happy 1")]
        
        let muscleHappyTexture = Muscle
        let animateAction = SKAction.animate(with:muscleHappyTexture, timePerFrame: 0.5)
        muscle.run(animateAction)
        }
    
    func muscleSad(){
        let textureAtlas =  SKTextureAtlas(named: "Muscle")
        let Muscle = [textureAtlas.textureNamed("Otot sedih 1"), textureAtlas.textureNamed("Otot sedih 2"), textureAtlas.textureNamed("Otot sedih 1"), textureAtlas.textureNamed("Otot sedih 2"), textureAtlas.textureNamed("Otot sedih 1"), textureAtlas.textureNamed("Otot sedih 2"), textureAtlas.textureNamed("Otot sedih 1")]
        
        let muscleSadTexture = Muscle
        let animateAction = SKAction.animate(with:muscleSadTexture, timePerFrame: 0.5)
        muscle.run(animateAction)
        }
    
    func lungsHappy(){
        let textureAtlas =  SKTextureAtlas(named: "Lungs")
        let Lungs = [textureAtlas.textureNamed("Paru happy 1"), textureAtlas.textureNamed("Paru happy 2"), textureAtlas.textureNamed("Paru happy 1"), textureAtlas.textureNamed("Paru happy 2"), textureAtlas.textureNamed("Paru happy 1"), textureAtlas.textureNamed("Paru happy 2"), textureAtlas.textureNamed("Paru happy 1")]
        
        let lungsHappyTexture = Lungs
        let animateAction = SKAction.animate(with:lungsHappyTexture, timePerFrame: 0.5)
        lungs.run(animateAction)
        }
    
    func lungsSad(){
        let textureAtlas =  SKTextureAtlas(named: "Lungs")
        let Lungs = [textureAtlas.textureNamed("Paru sedih 1"), textureAtlas.textureNamed("Paru sedih 2"), textureAtlas.textureNamed("Paru sedih 1"), textureAtlas.textureNamed("Paru sedih 2"), textureAtlas.textureNamed("Paru sedih 1"), textureAtlas.textureNamed("Paru sedih 2"), textureAtlas.textureNamed("Paru sedih 1")]
        
        let lungsSadTexture = Lungs
        let animateAction = SKAction.animate(with:lungsSadTexture, timePerFrame: 0.5)
        lungs.run(animateAction)
//        }
//    override func update(_ currentTime: TimeInterval) {
//       // let reveal = SKTransition.flipHorizontal(withDuration: 1.0)
//        var call = String()
//    }
////
//        if player1.position.x <= 10{
//            print("player 2 menang")
//            winner = "Player 2"
//            let gameOverScene = GameOverscene(size: self.size, winner: winner)
//            view?.presentScene(gameOverScene)
//        }else if player2.position.x >= 478{
//            print("player 1 menang")
//            winner = "Player 1"
//            let gameOverScene = GameOverscene(size: self.size, winner: winner)
//            view?.presentScene(gameOverScene)
//        }
//    }
        
    
    }
    
//    func startCounter () {
//
//        counterTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(decrementCounter), userInfo: nil, repeats: true)
//        if second == 0 {
//            minute -= 1
//            second = 60
//        }
//    }
//
//    @objc func decrementCounter() {
//        second -= 1
//        timer.text = "0\(minute) : \(second)"
//    }
}

