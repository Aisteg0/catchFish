//
//  ViewController.swift
//  M21_Homework
//
//  Created by Maxim Nikolaev on 15.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var countFish = 0
    var randomX = Int.random(in: 0...400)
    var randomY = Int.random(in: 0...800)
    
    var fishArray: [UIImageView] = []
    
            
    var isFishCatched = false
    
    // MARK: viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let backImage = UIImage(named: "ocean") ?? UIImage()
        view.backgroundColor = UIColor(patternImage: backImage)
        let fish1 = Fish(withImage: UIImage(named: "fish")!)
        let fish2 = Fish(withImage: UIImage(named: "fish")!)
        let fish3 = Fish(withImage: UIImage(named: "fish")!)
        let fish4 = Fish(withImage: UIImage(named: "fish")!)
        let fish5 = Fish(withImage: UIImage(named: "fish")!)
//
        fishArray.append(fish1)
        fishArray.append(fish2)
        fishArray.append(fish3)
        fishArray.append(fish4)
        fishArray.append(fish5)

        
        view.addSubview(fish1)
        view.addSubview(fish2)
        view.addSubview(fish3)
        view.addSubview(fish4)
        view.addSubview(fish5)
        moveLeft()
    }
    
    func moveLeft() {
      if isFishCatched { return }
      
        UIView.animate(withDuration: 1,
                       delay: 1,
                     options: [.curveEaseInOut , .allowUserInteraction],
                     animations: {
            for fish in self.fishArray {
                fish.center = CGPoint(x: Int.random(in: 0...400), y:  Int.random(in: 0...800))
            }
          
            
      },
                     completion: { finished in
                      print("fish moved left!")
                      self.moveRight()
      })
    }
    
    
    func moveRight() {
        if isFishCatched { return }
        
        UIView.animate(withDuration: 1,
                       delay: 1,
                       options: [.curveEaseInOut , .allowUserInteraction],
                       animations: {
            for fish in self.fishArray {
                fish.center = CGPoint(x: Int.random(in: 0...400), y:  Int.random(in: 0...800))
            }
        },
                       completion: { finished in
            print("fish moved left")
            self.moveTop()
            
        }
        )
    }
    
    func moveTop() {
        if isFishCatched { return }
        UIView.animate(withDuration: 1, delay: 1,  options: [.curveEaseInOut , .allowUserInteraction], animations: {
            for fish in self.fishArray {
                fish.center = CGPoint(x: Int.random(in: 0...400), y:  Int.random(in: 0...800))
            }
        },
        completion: { finished in
            print("fish moved top")
            self.moveBottom()
        })
    }
    
    func moveBottom() {
        if isFishCatched { return }
        UIView.animate(withDuration: 1, delay: 1,  options: [.curveEaseInOut , .allowUserInteraction], animations: {
            for fish in self.fishArray {
                fish.center = CGPoint(x: Int.random(in: 0...400), y:  Int.random(in: 0...800))
            }
        }, completion: { finisched in
            print("fish moved bottom")
            self.moveLeft()
            
        })
    }
}

