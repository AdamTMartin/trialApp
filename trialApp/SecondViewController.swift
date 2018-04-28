//
//  SecondViewController.swift
//  trialApp
//
//  Created by Adam Martin on 3/2/18.
//  Copyright © 2018 Adam Martin. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    let label = UILabel()
    let square = UIView()
    let descriptionLabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            //This is the label
            label.frame = CGRect(x: 16, y: 16, width: 200, height: 20)
            label.text = "Title Text Here!"
            label.textColor = .white
            label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        
            //This is the square
            square.frame = CGRect(x:25,y:25,width:250,height:250)
            square.backgroundColor = #colorLiteral(red: 0.5569, green: 0.2667, blue: 0.6784, alpha: 1) /* #8e44ad */
            square.layer.cornerRadius = 14
            square.layer.shadowOffset = CGSize(width: 0, height: 10)
            square.layer.shadowOpacity = 0.25
            square.layer.shadowRadius = 10
        
            descriptionLabel.frame = CGRect(x: 20, y: 225, width: 335, height: 132)
            descriptionLabel.text = "Three years ago, Apple completely revamped their design language for the modern users. It is now much simpler, allowing designers to focus on animation and function rather than intricate visual details."
            descriptionLabel.textColor = .black
            descriptionLabel.numberOfLines = 10
            descriptionLabel.alpha = 0
        
            //This is adding the views
            self.view.addSubview(square)
            square.addSubview(label)
            square.addSubview(descriptionLabel)
            self.view = view
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func animateOnTouch(_ sender: UIButton) {
        
        let animator = UIViewPropertyAnimator(duration: 0.7, dampingRatio: 0.7){
            
            //Square Animation
            self.square.frame = CGRect(x: 0, y: 0, width: 375, height: 375)
            self.square.layer.cornerRadius = 0
            self.square.layer.shadowOpacity = 0
            
            //Label Animation
            self.descriptionLabel.alpha = 1
        }
        animator.startAnimation()
    }
    
    @IBAction func unAnimateOnTouch(_ sender: UITapGestureRecognizer) {
            
            let animator = UIViewPropertyAnimator(duration: 0.7, dampingRatio: 0.7){
                
                //Square Animation
                self.square.frame = CGRect(x:25,y:25,width:250,height:250)
                self.square.layer.cornerRadius = 14
                self.square.layer.shadowOpacity = 0.25
                
                //Label Animation
                self.descriptionLabel.alpha = 0
            }
            animator.startAnimation()
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
