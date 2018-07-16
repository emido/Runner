//
//  CatNode.swift
//  Runner Game
//
//  Created by Peter Rutherford on 2016-11-14.
//  Copyright © 2016 cs2680. All rights reserved.
//

import Foundation
import SpriteKit

class CatNode: SKSpriteNode
{
	var isJumping = false

	func startRunAnimation()
	{
		self.removeAction(forKey: "ANIMATION")

		let runTextures = 	[	SKTexture(image: #imageLiteral(resourceName: "cat_run_1")),
								SKTexture(image: #imageLiteral(resourceName: "cat_run_2")),
								SKTexture(image: #imageLiteral(resourceName: "cat_run_3")),
								SKTexture(image: #imageLiteral(resourceName: "cat_run_4")),
								SKTexture(image: #imageLiteral(resourceName: "cat_run_5")),
								SKTexture(image: #imageLiteral(resourceName: "cat_run_6")),
								SKTexture(image: #imageLiteral(resourceName: "cat_run_7")),
								SKTexture(image: #imageLiteral(resourceName: "cat_run_8")),
							]

		let runAction = SKAction.animate(with: runTextures, timePerFrame: 0.1)

		self.run(SKAction.repeatForever(runAction), withKey: "ANIMATION")

		isJumping = false
	}

	func startJumpAnimation()
	{
		self.removeAction(forKey: "ANIMATION")

		self.texture = SKTexture(image: #imageLiteral(resourceName: "cat_jump"))
	}

	func jump()
	{
		if !isJumping
		{
			self.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 400))
			isJumping = true
		}
	}
}
