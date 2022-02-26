//
//  ViewController.swift
//  optionGame
//
//  Created by 方仕賢 on 2022/2/25.
//

import UIKit

var mainImages = [UIImage](repeating: UIImage(), count: 5)

class ViewController: UIViewController {

    @IBOutlet var imageViews: [UIImageView]!
    
    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for i in 0...imageViews.count-1{
            imageViews[i].image = UIImage(named: imageNames[i]+"\(indices[i])")
            mainImages[i] = imageViews[i].image!
        }
    }
    
    
    @IBAction func doneChanging(segue: UIStoryboardSegue) {
        for i in 0...imageViews.count-1{
            imageViews[i].image = UIImage(named: imageNames[i]+"\(indices[i])")
        }
        nameLabel.text! = name
        for i in 0...imageViews.count-1 {
            mainImages[i] = imageViews[i].image!
        }
        view.endEditing(true)
    }
    

}

