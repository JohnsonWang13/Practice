
import UIKit

class ViewController: UIViewController {
    
    let diceView = UIView()
    let dice1 = UIImageView.init(image: UIImage(named: "dice1"))
    let dice2 = UIImageView.init(image: UIImage(named: "dice2"))
    let dice3 = UIImageView.init(image: UIImage(named: "dice3"))
    let dice4 = UIImageView.init(image: UIImage(named: "dice4"))
    let dice5 = UIImageView.init(image: UIImage(named: "dice5"))
    let dice6 = UIImageView.init(image: UIImage(named: "dice6"))
    var angle = CGPoint.init(x: 0, y: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addDice()
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(viewTransform))
        diceView.addGestureRecognizer(panGesture)
    }
    
    func addDice() {
        
        let viewFrame = UIScreen.main.bounds
        
        diceView.frame = CGRect(x: 0, y: viewFrame.maxY / 2 - 50, width: viewFrame.width, height: 100)
        
        let transform = CATransform3DIdentity
        var diceTransform = CATransform3DIdentity
        
        
        //1
        dice1.frame = CGRect(x: viewFrame.maxX / 2 - 50, y: 0, width: 100, height: 100)
        diceTransform = CATransform3DTranslate(diceTransform, 0, 0, 50)
        dice1.layer.transform = diceTransform
        
        
        //6
        dice6.frame = CGRect(x: viewFrame.maxX / 2 - 50, y: 0, width: 100, height: 100)
        diceTransform = CATransform3DTranslate(transform, 0, 0, -50)
        dice6.layer.transform = diceTransform
        
        
        //2
        dice2.frame = CGRect(x: viewFrame.maxX / 2 - 50, y: 0, width: 100, height: 100)
        diceTransform = CATransform3DRotate(transform, (CGFloat.pi / 2), 0, 1, 0)
        diceTransform = CATransform3DTranslate(diceTransform, 0, 0, 50)
        dice2.layer.transform = diceTransform
        
        
        //5
        dice5.frame = CGRect(x: viewFrame.maxX / 2 - 50, y: 0, width: 100, height: 100)
        diceTransform = CATransform3DRotate(transform, (-CGFloat.pi / 2), 0, 1, 0)
        diceTransform = CATransform3DTranslate(diceTransform, 0, 0, 50)
        dice5.layer.transform = diceTransform
        
        
        //3
        dice3.frame = CGRect(x: viewFrame.maxX / 2 - 50, y: 0, width: 100, height: 100)
        diceTransform = CATransform3DRotate(transform, (-CGFloat.pi / 2), 1, 0, 0)
        diceTransform = CATransform3DTranslate(diceTransform, 0, 0, 50)
        dice3.layer.transform = diceTransform
        
        
        //4
        dice4.frame = CGRect(x: viewFrame.maxX / 2 - 50, y: 0, width: 100, height: 100)
        diceTransform = CATransform3DRotate(transform, (CGFloat.pi / 2), 1, 0, 0)
        diceTransform = CATransform3DTranslate(diceTransform, 0, 0, 50)
        dice4.layer.transform = diceTransform
        
        
        diceView.addSubview(dice1)
        diceView.addSubview(dice2)
        diceView.addSubview(dice3)
        diceView.addSubview(dice4)
        diceView.addSubview(dice5)
        diceView.addSubview(dice6)
        self.view.addSubview(diceView)
        
    }
    
    
    func viewTransform(sender: UIPanGestureRecognizer) {
        
        let point = sender.translation(in: diceView)
        let angle1 = angle.x + (point.x/30)
        let angle2 = angle.y - (point.y/30)
        
        var transform = CATransform3DIdentity
        transform.m34 = -1 / 500
        transform = CATransform3DRotate(transform, angle1, 0, 1, 0)
        transform = CATransform3DRotate(transform, angle2, 1, 0, 0)
        diceView.layer.sublayerTransform = transform
        
        if sender.state == .ended {
            angle.x = angle1
            angle.y = angle2
        }
    }
}

