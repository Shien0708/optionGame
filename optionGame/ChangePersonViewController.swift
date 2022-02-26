//
//  ChangePersonViewController.swift
//  optionGame
//
//  Created by 方仕賢 on 2022/2/25.
//

import UIKit

var indices = [Int](repeating: 0, count: 5)
let imageNames = ["face-", "head-", "glasses-", "facialHair-", "body-"]
var name = "Sam"

class ChangePersonViewController: UIViewController {
   
    @IBOutlet var imageViews: [UIImageView]!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var preButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var partSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var nameButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        for i in 0...imageViews.count-1{
            imageViews[i].image = UIImage(named: imageNames[i]+"\(indices[i])")
        }
        nameLabel.text = name
       
    }

    @IBAction func change(_ sender: UIButton) {
        
        view.endEditing(true)
        
        if sender == nextButton {
            switch partSegmentedControl.selectedSegmentIndex {
            case 0:
                indices[0] = (indices[0]+1)%30
                imageViews[0].image = UIImage(named: imageNames[0]+"\(indices[0])")
            case 1:
                indices[1] = (indices[1]+1)%46
                imageViews[1].image = UIImage(named: imageNames[1]+"\(indices[1])")
            case 2:
                indices[2] = (indices[2]+1)%9
                imageViews[2].image = UIImage(named: imageNames[2]+"\(indices[2])")
            case 3:
                indices[3] = (indices[3]+1)%17
                imageViews[3].image = UIImage(named: imageNames[3]+"\(indices[3])")
            default:
                indices[4] = (indices[4]+1)%30
                imageViews[4].image = UIImage(named: imageNames[4]+"\(indices[4])")
            }
        } else {
            switch partSegmentedControl.selectedSegmentIndex {
            case 0:
                indices[0] = (indices[0]-1+30)%30
                imageViews[0].image = UIImage(named: imageNames[0]+"\(indices[0])")
            case 1:
                indices[1] = (indices[1]-1+47)%47
                imageViews[1].image = UIImage(named: imageNames[1]+"\(indices[1])")
            case 2:
                indices[2] = (indices[2]-1+9)%9
                imageViews[2].image = UIImage(named: imageNames[2]+"\(indices[2])")
            case 3:
                indices[3] = (indices[3]-1+17)%17
                imageViews[3].image = UIImage(named: imageNames[3]+"\(indices[3])")
            default:
                indices[4] = (indices[4]-1+30)%30
                imageViews[4].image = UIImage(named: imageNames[4]+"\(indices[4])")
            }
        }
    }
    
    
    @IBAction func changeName(_ sender: UIButton) {
        view.endEditing(true)
        if nameTextField.text != ""{
            nameLabel.text = nameTextField.text!
            name = nameTextField.text!
            nameTextField.text = ""
        } else  {
            let controller = UIAlertController(title: "Enter Name", message: "Please enter your name!", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            controller.addAction(action)
            present(controller, animated: true, completion: nil)
        }
    }
    
}
