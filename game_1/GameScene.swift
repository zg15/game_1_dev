//
//  GameScene.swift
//  game_1
//
//  Created by AlexGong on 12/19/18.
//  Copyright © 2018 nosuchorganization. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
//    private var label : SKLabelNode?
//    private var spinnyNode : SKShapeNode?
    var player:SKSpriteNode!
    
//    var enemy:SKSpriteNode!
    
    var velocity:Double! = 500
    
    var cam: SKCameraNode?
    
    var timer = Timer()
    
    override func didMove(to view: SKView) {
        
        scheduledTimerWithTimeInterval()
        
        cam = SKCameraNode()
        
        self.camera = cam
        
        player = SKSpriteNode(imageNamed: "magic")
        
        player.position = CGPoint(x: 60, y: 200)
        
        player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
        
        player.physicsBody?.isDynamic = true
        player.physicsBody?.friction = 0
        player.physicsBody?.allowsRotation = false
        player.physicsBody?.affectedByGravity = false
        player.physicsBody?.restitution = 1
        player.physicsBody?.linearDamping = 0
        player.physicsBody?.angularDamping = 0
        
//        enemy = SKSpriteNode(imageNamed: "enemy")
//        let eTexture:SKTexture! = enemy.texture
//        let eSize:CGSize! = enemy.texture?.size()
//        enemy.physicsBody = SKPhysicsBody(texture: eTexture, size: eSize)
//        enemy.physicsBody?.isDynamic = true
//        enemy.physicsBody?.friction = 0
//        enemy.physicsBody?.allowsRotation = false
//        enemy.physicsBody?.affectedByGravity = false
//        enemy.physicsBody?.restitution = 1
//        enemy.physicsBody?.linearDamping = 0
//        enemy.physicsBody?.angularDamping = 0
        
        
        self.addChild(player)
        
        self.addChild(cam!)
        
        for node in self.children {
            if node.name == "map_1" {
                if let someTileMap:SKTileMapNode = node as? SKTileMapNode {
                    print(1)
                    giveObstaclePhysicsBody(tileMap: someTileMap)
                    someTileMap.removeFromParent()
                }
            }
        }
        
//        player.physicsBody?.applyImpulse(CGVector(dx: 180, dy: 200))

//        var ball_2 = self.childNode(withName: "ball") as! SKSpriteNode
//
//        ball_2.position = CGPoint(x: 70, y: 70)
//
//        var ball_3 = self.childNode(withName: "ball") as! SKSpriteNode
//
//        ball_3.position = CGPoint(x: 90, y: 50)
//
//        var ball_4 = self.childNode(withName: "ball") as! SKSpriteNode
//
//        ball_4.position = CGPoint(x: 10, y: 80)
        
        
//        // Get label node from scene and store it for use later
//        self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode
//        if let label = self.label {
//            label.alpha = 0.0
//            label.run(SKAction.fadeIn(withDuration: 2.0))
//        }
//
//        // Create shape node to use during mouse interaction
//        let w = (self.size.width + self.size.height) * 0.05
//        self.spinnyNode = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.3)
//
//        if let spinnyNode = self.spinnyNode {
//            spinnyNode.lineWidth = 2.5
//
//            spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
//            spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
//                                              SKAction.fadeOut(withDuration: 0.5),
//                                              SKAction.removeFromParent()]))
//        }
    }
    
    func scheduledTimerWithTimeInterval(){
        // Scheduling timer to Call the function "updateCounting" with the interval of 1 seconds
        timer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(self.updateCounting), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounting(){
//        NSLog("counting..")
        print("10s passed")
        var enemy: SKSpriteNode!
        enemy = SKSpriteNode(imageNamed: "enemy")
        let eTexture:SKTexture! = enemy.texture
        let eSize:CGSize! = enemy.texture?.size()
        enemy.physicsBody = SKPhysicsBody(texture: eTexture, size: eSize)
        enemy.physicsBody?.isDynamic = true
        enemy.physicsBody?.friction = 0
        enemy.physicsBody?.allowsRotation = false
        enemy.physicsBody?.affectedByGravity = false
        enemy.physicsBody?.restitution = 1
        enemy.physicsBody?.linearDamping = 0
        enemy.physicsBody?.angularDamping = 0
        self.addChild(enemy)
        enemy.physicsBody?.applyImpulse(CGVector(dx: 20, dy: 20))
        
    }
    
    
//    func touchDown(atPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.green
//            self.addChild(n)
//        }
//    }
//
//    func touchMoved(toPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.blue
//            self.addChild(n)
//        }
//    }
//
//    func touchUp(atPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.red
//            self.addChild(n)
//        }
//    }
//
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if let label = self.label {
//            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
//        }
//
//        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
//    }
//
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
//    }
//
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
//    }
//
//    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
//    }
    
    
    func giveObstaclePhysicsBody(tileMap: SKTileMapNode) {
        let startingLocation: CGPoint = tileMap.position
        let tileSize = tileMap.tileSize
        let halfWidth = CGFloat(tileMap.numberOfColumns) / 2.0 * tileSize.width
        let halfHeight = CGFloat(tileMap.numberOfRows) / 2.0 * tileSize.height
        
        for col in 0..<tileMap.numberOfColumns {
            for row in 0..<tileMap.numberOfRows {
                if let tileDefinition = tileMap.tileDefinition(atColumn: col, row: row) {
                    let tileArray = tileDefinition.textures
                    let tileTexture = tileArray[0]
                    let x = CGFloat(col) * tileSize.width - halfWidth + (tileSize.width / 2)
                    let y = CGFloat(row) * tileSize.height - halfHeight + (tileSize.height / 2)
                    
                    let tileNode = SKSpriteNode(texture: tileTexture)
                    tileNode.position = CGPoint(x:x, y:y)
                    tileNode.physicsBody = SKPhysicsBody(texture: tileTexture, size: CGSize(width: tileTexture.size().width, height: tileTexture.size().height))
//                    tileNode.physicsBody?.linearDamping = 60.0
                    tileNode.physicsBody?.affectedByGravity = false
                    tileNode.physicsBody?.allowsRotation = false
                    tileNode.physicsBody?.isDynamic = false
                    tileNode.physicsBody?.friction = 0
                    tileNode.physicsBody?.restitution = 1
                    
                    self.addChild(tileNode)
                    
                    tileNode.position = CGPoint(x: tileNode.position.x + startingLocation.x, y:
                        tileNode.position.y + startingLocation.y)
                    
                }
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            self.touchDown(atPoint: t.location(in: self))
        }
    }

    func touchDown(atPoint pos: CGPoint) {

        print("touch down")

        var actionArray = [SKAction]()

        player.removeAllActions()
        player.physicsBody?.velocity = CGVector(dx: 0, dy: 0)

        let diff_x:Double = Double(pos.x - player.position.x)

        let diff_y:Double = Double(pos.y - player.position.y)

        let distance:Double = (pow(diff_x, 2) + pow(diff_y, 2)).squareRoot()

        let time:Double = distance / velocity

        print(time)
        
        actionArray.append(SKAction.moveBy(x: CGFloat(diff_x), y: CGFloat(diff_y), duration: time))

//        actionArray.append(SKAction.move(to: pos, duration: time))



        player.run(SKAction.sequence(actionArray))
    }

//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
//    }

    func touchMoved(toPoint pos: CGPoint) {

        print("touch moved")

        var actionArray = [SKAction]()

        let diff_x:Double = Double(pos.x - player.position.x)

        let diff_y:Double = Double(pos.y - player.position.y)

        let distance:Double = (pow(diff_x, 2) + pow(diff_y, 2)).squareRoot()

        let time:Double = distance / velocity

        print(time)

//        actionArray.append(SKAction.move(to: pos, duration: time))

        actionArray.append(SKAction.moveBy(x: CGFloat(diff_x), y: CGFloat(diff_y), duration: time))

        player.run(SKAction.sequence(actionArray))
    }

//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
//    }
//
//    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
//    }

    func touchUp(atPoint pos: CGPoint) {

        print("touch ended")

        player.removeAllActions()

    }
    
    override func update(_ currentTime: TimeInterval) {
        super.update(currentTime)
        
        if let camera = cam, let p1 = player {
            camera.position = p1.position
        }
    }
}
