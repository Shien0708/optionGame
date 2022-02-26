//
//  RankViewController.swift
//  optionGame
//
//  Created by 方仕賢 on 2022/2/25.
//

import UIKit


var easyScores = [Int](repeating: 0, count: 4)
var mediumScores = [Int](repeating: 0, count: 4)
var hardScores = [Int](repeating: 0, count: 4)

var easyFirstImages = [UIImage](repeating: UIImage(), count: 4)
var mediumFirstImages = [UIImage](repeating: UIImage(), count: 4)
var hardFirstImages = [UIImage](repeating: UIImage(), count: 4)
var easySecondImages = [UIImage](repeating: UIImage(), count: 4)
var mediumSecondImages = [UIImage](repeating: UIImage(), count: 4)
var hardSecondImages = [UIImage](repeating: UIImage(), count: 4)
var easyThirdImages = [UIImage](repeating: UIImage(), count: 4)
var mediumThirdImages = [UIImage](repeating: UIImage(), count: 4)
var hardThirdImages = [UIImage](repeating: UIImage(), count: 4)

var easyNames = [String](repeating: "", count: 4)
var mediumNames = [String](repeating: "", count: 4)
var hardNames = [String](repeating: "", count: 4)

class RankViewController: UIViewController {
    @IBOutlet var firstImageViews: [UIImageView]!
    @IBOutlet var secondImageViews: [UIImageView]!
    @IBOutlet var thirdImageViews: [UIImageView]!
    
    @IBOutlet var names: [UILabel]!
    
    @IBOutlet var scoreLabels: [UILabel]!
    
    @IBOutlet weak var levelSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stage()
        for i in 0...3 {
            firstImageViews[i].image = easyFirstImages[i]
            secondImageViews[i].image = easySecondImages[i]
            thirdImageViews[i].image = easyThirdImages[i]
            if i < 3 {
                names[i].text = easyNames[i]
                scoreLabels[i].text = String(easyScores[i])+" Correct"
            }
        }
    }
    
    @IBAction func changeLevel(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            for i in 0...3 {
                firstImageViews[i].image = easyFirstImages[i]
                secondImageViews[i].image = easySecondImages[i]
                thirdImageViews[i].image = easyThirdImages[i]
                if i < 3 {
                    names[i].text = easyNames[i]
                    scoreLabels[i].text = String(easyScores[i])+" Correct"
                    view.bringSubviewToFront(scoreLabels[i])
                }
            }
        case 1:
            for i in 0...3 {
                firstImageViews[i].image = mediumFirstImages[i]
                secondImageViews[i].image = mediumSecondImages[i]
                thirdImageViews[i].image = mediumThirdImages[i]
                if i < 3 {
                    names[i].text = mediumNames[i]
                    scoreLabels[i].text = String(mediumScores[i])+" Correct"
                    view.bringSubviewToFront(scoreLabels[i])
                }
            }
        default:
            for i in 0...3 {
                firstImageViews[i].image = hardFirstImages[i]
                secondImageViews[i].image = hardSecondImages[i]
                thirdImageViews[i].image = hardThirdImages[i]
                if i < 3 {
                    names[i].text = hardNames[i]
                    scoreLabels[i].text = String(hardScores[i])+" Correct"
                    view.bringSubviewToFront(scoreLabels[i])
                }
            }
        }
       
    }
    
    func stage () {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 200, y: 267))
        path.addLine(to: CGPoint(x: 368, y: 267))
        path.addLine(to: CGPoint(x: 368, y: 220))
        path.addLine(to: CGPoint(x: 516, y: 220))
        path.addLine(to: CGPoint(x: 516, y: 301))
        path.addLine(to: CGPoint(x: 676, y: 301))
        path.addLine(to: CGPoint(x: 676, y: 500))
        path.addLine(to: CGPoint(x: 200, y: 500))
        path.close()
        
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.fillColor = UIColor.brown.cgColor
        
        view.layer.addSublayer(layer)
        
    }
   

}
