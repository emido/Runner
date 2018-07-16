//
//  GameScene.swift
//  RunnerGame
//
//  Created by A on 3/15/17.
//  Copyright © 2017 Alma. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene
{
    
    var cat: CatNode!
    var platform: Array<SKSpriteNode>?
    var lastTime: TimeInterval?
    
    
    override func didMove(to view: SKView)
    {
        let backgroundTexture = SKTexture(image: #imageLiteral(resourceName: "background"))
        let backgroundNode = SKSpriteNode(texture: backgroundTexture)
        backgroundNode.size = CGSize(width:1334, height: 750)
        self.addChild(backgroundNode)
        
        
        
        // Add Platform
        
        for i in 0..<10
        {
            let platformX = (-440 + (i * 400))
            let platform = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "platform")))
            platform.size = CGSize(width: 256, height:64)
            platform.position = CGPoint(x: platformX, y: -232)
            platform.physicsBody = SKPhysicsBody(rectangleOf: platform.size)
            platform.physicsBody?.isDynamic = false
            
            
            let moveAction = SKAction.moveBy(x: -160, y: 0, duration: 1)
            let repeatAction = SKAction.repeatForever(moveAction)
            platform.run(repeatAction)
            
            
            self.platform?.append(platform)
            self.addChild(platform)
        }
        
        
        let snowEmitter = SKEmitterNode(fileNamed: "MyParticle")
        snowEmitter?.position = CGPoint(x:0, y:400)
        self.addChild(snowEmitter!)
        
        
        // Add cat
        let catTexture = SKTexture(image: #imageLiteral(resourceName: "cat_run_1"))
        let catSize = CGSize(width:140, height: 140)
        self.cat = CatNode(texture: catTexture, color: UIColor.white, size: catSize)
        self.cat.position = CGPoint(x: -520, y: -200)
        
        self.cat.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width:70, height: 140))
        self.cat.physicsBody?.allowsRotation = false
        self.addChild(self.cat)
        self.cat.startRunAnimation()
        
        
        
        

       
    }
    
    
    func touchDown(atPoint pos : CGPoint)
    {
        self.cat.startJumpAnimation()
        self.cat.jump()
    }
    
    func touchMoved(toPoint pos : CGPoint)
    {
    }
    
    func touchUp(atPoint pos : CGPoint)
    {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval)
    {
        // Called before each frame is rendered
        if lastTime == nil
        {
            lastTime = currentTime
            return
        }
        
        if self.platform != nil
        {
            for platform in self.platform!
            {
                platform.position.x = platform.position.x - CGFloat(140 * (currentTime - lastTime!))
            }
            
        }
        lastTime = currentTime
    }
}
