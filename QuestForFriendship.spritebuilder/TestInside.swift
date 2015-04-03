//
//  TestInside.swift
//  QuestForFriendship
//
//  Created by Jacob Apenes on 4/2/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class TestInside: CCNode {
    var movementSpeed : CGFloat = 3
    var movement : CGFloat = 0
    var connor: CCSprite!
    var camera : CCNode!
    var outsideDoor : Door!
    
    func didLoadFromCCB() {
        outsideDoor.nextScene = "MainScene"
        self.userInteractionEnabled = true
    }
    
    override func update(delta: CCTime) {
        if movement == -1 {
            if connor.position.x < 40 {
                movement = 0
            }
            connor.position = ccp(connor.position.x - movementSpeed, connor.position.y)
            connor.flipX = true
            if connor.animationManager.runningSequenceName == "Standstill" {
                connor.animationManager.runAnimationsForSequenceNamed("Running")
            }
        }
        else if movement == 1 {
            if connor.position.x > 520 {
                movement = 0
            }
            connor.position = ccp(connor.position.x + movementSpeed, connor.position.y)
            connor.flipX = false
            if connor.animationManager.runningSequenceName == "Standstill" {
                connor.animationManager.runAnimationsForSequenceNamed("Running")
            }
        }
        
        
    }
    
    override func touchBegan(touch: CCTouch!, withEvent: CCTouchEvent!) {
        var location = touch.locationInNode(camera)
        
        if location.x < connor.position.x {
            movement = -1
        }
        else {
            movement = 1
        }
        
        
        //for entering doors
        if location.x < (outsideDoor.position.x + 24.5) && location.x > (outsideDoor.position.x - 24.5) {
            if location.y < (outsideDoor.position.y + 44.5) && location.y > (outsideDoor.position.y - 44.5) {
                let nextRoom: CCScene = CCBReader.loadAsScene(outsideDoor.nextScene)
                CCDirector.sharedDirector().replaceScene(nextRoom);
                movement = 0
            }
        }
    }
    
    override func touchEnded(touch: CCTouch!, withEvent: CCTouchEvent!) {
        movement = 0
        connor.animationManager.runAnimationsForSequenceNamed("Standstill")
    }

}