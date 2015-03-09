import Foundation

class MainScene: CCNode {
    var movementSpeed : CGFloat = 2
    var movement : CGFloat = 0
    var connor : CCSprite!
    
    func didLoadFromCCB() {
        self.userInteractionEnabled = true
    }
    
    override func update(delta: CCTime) {
        if movement == -1 {
            connor.position = ccp(connor.position.x - movementSpeed, connor.position.y)
            connor.flipX = true
            if connor.animationManager.runningSequenceName == "Standstill" {
                connor.animationManager.runAnimationsForSequenceNamed("Running")
            }
        }
        else if movement == 1 {
            connor.position = ccp(connor.position.x + movementSpeed, connor.position.y)
            connor.flipX = false
            if connor.animationManager.runningSequenceName == "Standstill" {
                connor.animationManager.runAnimationsForSequenceNamed("Running")
            }
        }
    }
    
    override func touchBegan(touch: CCTouch!, withEvent: CCTouchEvent!) {
        var location = touch.locationInNode(self)
        
        if location.x < connor.position.x {
            movement = -1
        }
        else {
            movement = 1
        }
    }

    override func touchEnded(touch: CCTouch!, withEvent: CCTouchEvent!) {
        movement = 0
    }

}
