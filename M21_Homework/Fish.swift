//
//  Fish.swift
//  M21_Homework
//
//  Created by Михаил Ганин on 28.08.2023.
//

import Foundation
import UIKit

class Fish: UIImageView {
    var isCatched = false
       
       init(withImage image: UIImage) {
           super.init(image: image)
           self.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
           self.contentMode = .scaleAspectFit
           
           let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTap))
           self.addGestureRecognizer(tapGesture)
           self.isUserInteractionEnabled = true
       }
       
       required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       @objc private func didTap() {
           catchedAnimation()
       }
       
       private func catchedAnimation() {
           UIView.animate(withDuration: 0.5, animations: {
               self.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
               self.alpha = 0.0
           }, completion: { _ in
               self.removeFromSuperview()
           })
       }
   
}
