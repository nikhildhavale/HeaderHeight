//
//  ChildViewController.swift
//  HeaderHeight
//
//  Created by Nikhil d on 05/05/20.
//  Copyright © 2020 Nikhil d. All rights reserved.
//

import UIKit
import WebKit
class ChildViewController: UIViewController {
    @IBOutlet weak var sampleLabel: UILabel!
    @IBOutlet weak var webView: WKWebView!
    var heightEqualityConstraint:NSLayoutConstraint?
    var widthConstraint:NSLayoutConstraint?
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.load(URLRequest(url: URL(string: "http://help.websiteos.com/websiteos/example_of_a_simple_html_page.htm")!))
        // Do any additional setup after loading the view.
        ///    [self.webView.scrollView addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew context:nil];

        webView.scrollView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
        webView.scrollView.isScrollEnabled = false
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let parent = self.parent as? ViewController ,heightEqualityConstraint == nil, widthConstraint == nil
              {
                  parent.containerView.translatesAutoresizingMaskIntoConstraints = false
                widthConstraint = parent.containerView.widthAnchor .constraint(equalTo: parent.tableView.widthAnchor)
                  widthConstraint?.isActive = true
                heightEqualityConstraint = parent.containerView.heightAnchor.constraint(equalToConstant: webView.scrollView.contentSize.height)
                  heightEqualityConstraint?.isActive = true
                //heightEqualityConstraint = parent.containerView.heightAnchor.constraint(equalTo: sampleLabel.heightAnchor, multiplier: 1)
              }
        
        
    }
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "contentSize"
        {
            heightEqualityConstraint?.constant = webView.scrollView.contentSize.height
        }
    }
    deinit {
        webView.scrollView.removeObserver(self, forKeyPath: "contentSize")
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
