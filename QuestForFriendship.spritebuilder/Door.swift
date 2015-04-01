//
//  House.swift
//  QuestForFriendship
//
//  Created by Jacob Apenes on 3/20/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class Door: CCSprite {
    var nextScene: NSString = "MainScene"
    
    func moveToNextScene (room: NSString) {
        let scene: CCScene = CCBReader.loadAsScene(room)
        CCDirector.sharedDirector().replaceScene(scene)
    }
}