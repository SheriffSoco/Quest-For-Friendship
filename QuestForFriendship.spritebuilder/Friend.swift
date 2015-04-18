//
//  Friend.swift
//  QuestForFriendship
//
//  Created by Jacob Apenes on 3/11/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class Friend : CCSprite {
    
    var itemWanted = 0
    var checkForItem = false
    
    func check() {
        checkForItem = true
    }
    
    
}