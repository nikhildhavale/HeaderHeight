//
//  ViewController.swift
//  HeaderHeight
//
//  Created by Nikhil d on 05/05/20.
//  Copyright © 2020 Nikhil d. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "identfier", for: indexPath)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
    static let sampleText = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
    @IBOutlet weak var containerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "identfier")
        // Do any additional setup after loading the view.
    }

    @IBAction func addButtonClicked(_ sender: Any) {
        if let childController = self.children.first as? ChildViewController
        {
            var firstText = childController.sampleLabel.text ?? ""
            firstText += ViewController.sampleText
            childController.sampleLabel.text = firstText
            childController.sampleLabel.sizeToFit()
            tableView.reloadData()
//            self.view.setNeedsUpdateConstraints()
//            self.view.layoutIfNeeded()
            
            
        }
    }
    @IBAction func resetButtonClicked(_ sender: Any) {
        if let childController = self.children.first as? ChildViewController
        {
            childController.sampleLabel.text = nil
            childController.sampleLabel.sizeToFit()
            tableView.reloadData()

//            self.view.setNeedsUpdateConstraints()
//            self.view.layoutIfNeeded()

        }
    }
    
}

