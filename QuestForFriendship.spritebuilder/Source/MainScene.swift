import Foundation

class MainScene: CCNode {
    var movementSpeed : CGFloat = 3
    var movement : CGFloat = 0
    var camera : CCNode!
    var connor : CCSprite!
    var dock1 : CCSprite!
    var dock2 : CCSprite!
    var docks : [CCSprite] = []
    var testHouseDoor : Door!
    
    func didLoadFromCCB() {
        docks.append(dock1)
        docks.append(dock2)
        testHouseDoor.nextScene = "TestInside"
        self.userInteractionEnabled = true
    }
    
    override func update(delta: CCTime) {
        if movement == -1 {
            connor.position = ccp(connor.position.x - movementSpeed, connor.position.y)
            connor.flipX = true
            if connor.animationManager.runningSequenceName == "Standstill" {
                connor.animationManager.runAnimationsForSequenceNamed("Running")
            }
            if connor.position.x + camera.position.x < 100 {
                camera.position = ccp(camera.position.x + movementSpeed, camera.position.y)
            }
        }
        else if movement == 1 {
            connor.position = ccp(connor.position.x + movementSpeed, connor.position.y)
            connor.flipX = false
            if connor.animationManager.runningSequenceName == "Standstill" {
                connor.animationManager.runAnimationsForSequenceNamed("Running")
            }
            if connor.position.x + camera.position.x > 468 {
                camera.position = ccp(camera.position.x - movementSpeed, camera.position.y)
            }
        }
        
        
        //to move dock sprites
        for dock in docks {
            let dockWorldPosition = camera.convertToWorldSpace(dock.position)
            let dockScreenPosition = self.convertToNodeSpace(dockWorldPosition)
            if dockScreenPosition.x <= (-dock.contentSize.width) {
                dock.position = ccp(dock.position.x + dock.contentSize.width * 2, dock.position.y)
            }
            else if dockScreenPosition.x >= (dock.contentSize.width) {
                dock.position = ccp(dock.position.x - dock.contentSize.width * 2, dock.position.y)
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
        if location.x < (testHouseDoor.position.x + 24.5) && location.x > (testHouseDoor.position.x - 24.5) {
            if location.y < (testHouseDoor.position.y + 44.5) && location.y > (testHouseDoor.position.y - 44.5) {
                let nextRoom: CCScene = CCBReader.loadAsScene(testHouseDoor.nextScene)
                CCDirector.sharedDirector().replaceScene(nextRoom);
                movement = 0
            }
        }
    }

    override func touchEnded(touch: CCTouch!, withEvent: CCTouchEvent!) {
        movement = 0
        connor.animationManager.runAnimationsForSequenceNamed("Standstill")
    }
    
    func moveScene(direction: CGFloat) {
        
    }

}
