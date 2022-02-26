//
//  Question.swift
//  optionGame
//
//  Created by 方仕賢 on 2022/2/25.
//

import Foundation
import UIKit

struct Question {
    var answerIndex: Int
    var options: [String]
    var question: UILabel
    var string: String
}

func NSString(string: String, image: String) -> UILabel {
    let content = NSMutableAttributedString(string: string)
    let attachment = NSTextAttachment()
    attachment.image = UIImage(named: image)
    attachment.bounds = CGRect(x: 0, y: -15, width: 70, height: 70)
    
    content.append(NSAttributedString(attachment: attachment))
    
    let label = UILabel(frame: CGRect(x: 350, y: 120, width: 280, height: 70))
    label.numberOfLines = 1
    label.attributedText = content
    label.textColor = .black
    label.backgroundColor = .white
    label.font = UIFont.systemFont(ofSize: 40)
    return label
}



var easyQuestions = [Question(answerIndex: 2, options: ["Black Tea", "Bean Tea", "Bubble Milk Tea"], question: NSString(string: "I love ", image: "bubbleMilkTea"), string: "I love bubble milk tea." ), Question(answerIndex: 0, options: ["heart", "heat", "head"], question: NSString(string: "This is a ", image: "rainbowHeart"), string: "This is a heart."), Question(answerIndex: 1 , options: ["sleep", "slipper", "slippery"], question: NSString(string: "There is a ", image: "slipper"), string: "There is a slipper."), Question(answerIndex: 1, options: ["Thailand", "Taiwan", "Taiwanese"], question: NSString(string: "This is ", image: "Taiwan"), string: "This is Taiwan")]

var mediumQuestions = [Question(answerIndex: 2, options: ["Black Tea", "Bean Tea", "Bubble Milk Tea"], question: NSString(string: "I love ", image: "bubbleMilkTea"), string: "I love bubble milk tea." ), Question(answerIndex: 0, options: ["heart", "heat", "head"], question: NSString(string: "This is a ", image: "rainbowHeart"), string: "This is a heart."), Question(answerIndex: 1 , options: ["sleep", "slipper", "slippery"], question: NSString(string: "There is a ", image: "slipper"), string: "There is a slipper."), Question(answerIndex: 1, options: ["Thailand", "Taiwan", "Taiwanese"], question: NSString(string: "This is ", image: "Taiwan"), string: "This is Taiwan"), Question(answerIndex: 2, options: ["night mare", "night marker", "night market"], question: NSString(string: "This is a ", image: "nightMarket"),string: "This is a night market"), Question(answerIndex: 0, options: ["stinky tofu", "stingray", "stinky foot"], question: NSString(string: "We eat" , image:"stinkyTofu"), string: "We eat stinky tofu.")]

var hardQuestions = [Question(answerIndex: 2, options: ["Black Tea", "Bean Tea", "Bubble Milk Tea"], question: NSString(string: "I love ", image: "bubbleMilkTea"), string: "I love bubble milk tea." ), Question(answerIndex: 0, options: ["heart", "heat", "head"], question: NSString(string: "This is a ", image: "rainbowHeart"), string: "This is a heart."), Question(answerIndex: 1 , options: ["sleep", "slipper", "slippery"], question: NSString(string: "There is a ", image: "slipper"), string: "There is a slipper."), Question(answerIndex: 1, options: ["Thailand", "Taiwan", "Taiwanese"], question: NSString(string: "This is ", image: "Taiwan"), string: "This is Taiwan"), Question(answerIndex: 2, options: ["night mare", "night marker", "night market"], question: NSString(string: "This is a ", image: "nightMarket"),string: "This is a night market"), Question(answerIndex: 0, options: ["stinky tofu", "stingray", "stinky foot"], question: NSString(string: "We eat" , image:"stinkyTofu"), string: "We eat stinky tofu."), Question(answerIndex: 0, options: ["temple", "tempo", "template"], question: NSString(string: "This is a ", image: "temple"), string: "This is a temple."), Question(answerIndex: 1, options: ["Taipei 110", "Taipei 101", "Taipei 011"], question: NSString(string: "It is ", image: "Taipei101"), string: "It is Taipei 101"), Question(answerIndex: 2, options: ["apple cake", "pine cake", "pineapple cake"], question: NSString(string: "We love ", image: "pineappleCake"), string: "We love pineapple cake.")]




