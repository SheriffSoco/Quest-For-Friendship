//
//  backpackInventory.swift
//  QuestForFriendship
//
//  Created by Jacob Apenes on 4/13/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation

class FriendsInventory : CCNode {
    
    var menuButton = 0
    var friendsIndex = 0
    var arraySize = 0
    var xItem : CGFloat = 30
    var yAItem : CGFloat = 176
    var yBItem : CGFloat = 103
    var yCItem : CGFloat = 30
    
    var full : CCSprite!
    var half : CCSprite!
    var none : CCSprite!
    
    var one : CCNode!
    var two : CCNode!
    var three : CCNode!
    var four : CCNode!
    var friendsArray : [CCNode] = []
    
    func didLoadFromCCB() {
        friendsArray.append(one)
        friendsArray.append(two)
        friendsArray.append(three)
        friendsArray.append(four)
        arraySize = friendsArray.count-3
    }
    
    func exit() {
        self.visible = false
        menuButton = 0
        friendsIndex = 0
    }
    
    func open() {
        self.visible = true
        menuButton = 1
        changeDescriptions()
    }
    
    func up() {
        if friendsIndex != 0 {
            friendsIndex--
            changeDescriptions()
        }
    }
    
    func down() {
        if friendsIndex != arraySize {
            friendsIndex++
            changeDescriptions()
        }
    }
    
    func changeDescriptions() {
        for friend in friendsArray {
            if friend == friendsArray[friendsIndex] {
                friend.position = ccp(xItem, yAItem)
                friend.visible = true
            }
            else if friend == friendsArray[friendsIndex+1] {
                friend.position = ccp(xItem, yBItem)
                friend.visible = true
            }
            else if friend == friendsArray[friendsIndex+2] {
                friend.position = ccp(xItem, yCItem)
                friend.visible = true
            }
            else {
                friend.visible = false
            }
        }
    }
    
    func fullHead() {
        full.visible = true
        half.visible = false
        none.visible = false
    }
    
    func halfHead() {
        full.visible = false
        half.visible = true
        none.visible = false
    }
}