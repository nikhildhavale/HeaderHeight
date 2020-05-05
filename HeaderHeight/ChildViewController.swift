//
//  ChildViewController.swift
//  HeaderHeight
//
//  Created by Nikhil d on 05/05/20.
//  Copyright © 2020 Nikhil d. All rights reserved.
//

import UIKit

class ChildViewController: UIViewController {
    @IBOutlet weak var sampleLabel: UILabel!
    var heightEqualityConstraint:NSLayoutConstraint?
    var widthConstraint:NSLayoutConstraint?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let parent = self.parent as? ViewController ,heightEqualityConstraint == nil, widthConstraint == nil
              {
                  parent.containerView.translatesAutoresizingMaskIntoConstraints = false
                  widthConstraint = parent.containerView.widthAnchor .constraint(equalToConstant: UIScreen.main.bounds.width)
                  widthConstraint?.isActive = true
                  heightEqualityConstraint = parent.containerView.heightAnchor.constraint(equalTo: sampleLabel.heightAnchor, multiplier: 1)
                  heightEqualityConstraint?.isActive = true

              }
    }
    override func updateViewConstraints() {
        super.updateViewConstraints()
      
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
//        if let containerView = self.view.superview
//        {
//            var frame = containerView.frame
//            frame.size.height = sampleLabel.frame.size.height
//            containerView.frame = frame
//        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
