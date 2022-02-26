//
//  GameViewController.swift
//  optionGame
//
//  Created by 方仕賢 on 2022/2/25.
//

import UIKit
import AVFoundation

class GameViewController: UIViewController {
    
    @IBOutlet weak var levelView: UIView!
    @IBOutlet var levelButtons: [UIButton]!
    @IBOutlet var imageViews: [UIImageView]!
    
    @IBOutlet var optionButtons: [UIButton]!
   
    @IBOutlet weak var timerProgress: UIProgressView!
    
    @IBOutlet weak var correctLabel: UILabel!
    @IBOutlet weak var wrongLabel: UILabel!
    
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var headView: UIView!
    
    @IBOutlet weak var audioSettingView: UIView!
    
    @IBOutlet weak var audioNameLabel: UILabel!
    @IBOutlet weak var audioSampleLabel: UILabel!
    
    @IBOutlet weak var speedSlider: UISlider!
    @IBOutlet weak var volumeSlider: UISlider!
    
    @IBOutlet weak var pitchSlider: UISlider!
    var answeredQuestion = [UILabel]()
    
    var level = 0
    var currentQuestion = 0
    var timer: Timer?
    var correctCount = 0
    var wrongCount = 0
    
    let synthesizer = AVSpeechSynthesizer()
    var utterance = AVSpeechUtterance()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        easyQuestions.shuffle()
        mediumQuestions.shuffle()
        hardQuestions.shuffle()
        
        for i in 0...3 {
            imageViews[i].image = mainImages[i]
        }
        
    }
    
    func countDown(second: Float){
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { timer in
            self.timerProgress.progress -= second
            if self.timerProgress.progress == 0 {
                self.timer?.invalidate()
                let animator = UIViewPropertyAnimator(duration: 2, curve: .linear) {
                    self.resultView.isHidden = false
                    self.view.bringSubviewToFront(self.resultView)
                    self.correctLabel.text = "✅ \(self.correctCount)"
                    self.wrongLabel.text = "❌ \(self.wrongCount)"
                    self.recordImages()
                }
                animator.startAnimation()
            }
        })
      
    }
    
    func recordImages(){
        if timerProgress.progress == 0 {
            var index = 0
            
            switch level {
            case 0:
                while correctCount < easyScores[index] && index < 3 {
                    index += 1
                }
                if index < 3 {
                    for i in (index...2).reversed() {
                        if i+1 <= 2 {
                            easyScores[i+1] = easyScores[i]
                            easyNames[i+1] = easyNames[i]
                        }
                    }
                    easyScores[index] = correctCount
                    easyNames[index] = name
                    
                    if index == 0 {
                        for i in 0...3 {
                            easyThirdImages[i] = easySecondImages[i]
                            easySecondImages[i] = easyFirstImages[i]
                            easyFirstImages[i] = imageViews[i].image!
                        }
                    } else if index == 1 {
                        for i in 0...3 {
                            easyThirdImages[i] = easySecondImages[i]
                            easySecondImages[i] = imageViews[i].image!
                        }
                    } else {
                        easyThirdImages.removeAll()
                        for i in 0...3 {
                            easyThirdImages.append(imageViews[i].image!)
                        }
                    }
                }
                
            case 1:
                while correctCount < mediumScores[index] && index < 2 {
                    index += 1
                }
                
                if index < 3 {
                    for i in (index...2).reversed() {
                        if i+1 <= 2 {
                            mediumScores[i+1] = mediumScores[i]
                            mediumNames[i+1] = mediumNames[i]
                        }
                    }
                    mediumScores[index] = correctCount
                    mediumNames[index] = name
                    
                    if index == 0 {
                        for i in 0...3 {
                            mediumThirdImages[i] = mediumSecondImages[i]
                            mediumSecondImages[i] = mediumFirstImages[i]
                            mediumFirstImages[i] = imageViews[i].image!
                        }
                    } else if index == 1 {
                        for i in 0...3 {
                            easyThirdImages[i] = mediumSecondImages[i]
                            mediumSecondImages[i] = imageViews[i].image!
                        }
                    } else {
                        mediumThirdImages.removeAll()
                        for i in 0...3 {
                            mediumThirdImages.append(imageViews[i].image!)
                        }
                    }
                }
               
            default:
                while correctCount < hardScores[index] && index < 2 {
                    index += 1
                }
                if index < 3 {
                    for i in (index...2).reversed() {
                        if i+1 <= 2 {
                            hardScores[i+1] = hardScores[i]
                            hardNames[i+1] = hardNames[i]
                        }
                    }
                    hardScores[index] = correctCount
                    hardNames[index] = name
                    
                    if index == 0 {
                        for i in 0...3 {
                            hardThirdImages[i] = hardSecondImages[i]
                            hardSecondImages[i] = hardFirstImages[i]
                            hardFirstImages[i] = imageViews[i].image!
                        }
                    } else if index == 1 {
                        for i in 0...3 {
                            hardThirdImages[i] = hardSecondImages[i]
                            hardSecondImages[i] = imageViews[i].image!
                        }
                    } else {
                        hardThirdImages.removeAll()
                        for i in 0...3 {
                            hardThirdImages.append(imageViews[i].image!)
                        }
                    }
                }
            }
        }
    }
    
    
    @IBAction func showQuestion(_ sender: UIButton) {
        levelView.isHidden = true
        for i in 0...2 {
            optionButtons[i].backgroundColor = .clear
        }
        
        switch sender {
        case levelButtons[0]:
            view.addSubview(easyQuestions[currentQuestion].question)
            for i in 0...2 {
                optionButtons[i].setTitle(easyQuestions[currentQuestion].options[i], for: .normal)
            }
            level = 0
            countDown(second: 1/15)
            
        case levelButtons[1]:
            view.addSubview(mediumQuestions[currentQuestion].question)
            for i in 0...2 {
                optionButtons[i].setTitle(mediumQuestions[currentQuestion].options[i], for: .normal)
            }
            level = 1
            countDown(second: 0.1)
        default:
            view.addSubview(hardQuestions[currentQuestion].question)
            for i in 0...2 {
                optionButtons[i].setTitle(hardQuestions[currentQuestion].options[i], for: .normal)
            }
            level = 2
            countDown(second: 0.2)
        }
    }
    
    func nextQuestion(){
        
        timer?.invalidate()
        _ = Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: { _ in
            switch self.level {
            case 0:
                self.currentQuestion = (self.currentQuestion+1)%easyQuestions.count
            case 1:
                self.currentQuestion = (self.currentQuestion+1)%mediumQuestions.count
            default:
                self.currentQuestion = (self.currentQuestion+1)%hardQuestions.count
            }
            self.showQuestion(self.levelButtons[self.level])
        })
    }
    
    
    @IBAction func chooseAnswer(_ sender: UIButton) {
        
        var button = 0
        
        while optionButtons[button] != sender {
            button += 1
        }
        
        switch level {
        case 0:
            if button == easyQuestions[currentQuestion].answerIndex {
                sender.backgroundColor = .cyan
                imageViews[0].image = UIImage(named: "face-22")
                correctCount += 1
            } else {
                sender.backgroundColor = .red
                imageViews[0].image = UIImage(named: "face-14")
                wrongCount += 1
            }
        case 1:
            if button == mediumQuestions[currentQuestion].answerIndex {
                sender.backgroundColor = .cyan
                imageViews[0].image = UIImage(named: "face-22")
                correctCount += 1
            } else {
                sender.backgroundColor = .red
                imageViews[0].image = UIImage(named: "face-14")
                wrongCount += 1
            }
            
        default:
            if button == hardQuestions[currentQuestion].answerIndex {
                sender.backgroundColor = .cyan
                imageViews[0].image = UIImage(named: "face-22")
                correctCount += 1
            } else {
                sender.backgroundColor = .red
                imageViews[0].image = UIImage(named: "face-14")
                wrongCount += 1
            }
        }
        
        _ = Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: { _ in
            self.imageViews[0].image = UIImage(named: imageNames[0]+"\(indices[0])")
        })
        nextQuestion()
    }
    
    
    @IBAction func playAgain(_ sender: Any) {
        resultView.isHidden = true
        levelView.isHidden = false
        view.bringSubviewToFront(levelView)
        
        correctCount = 0
        wrongCount = 0
        currentQuestion = 0
        
        easyQuestions.shuffle()
        mediumQuestions.shuffle()
        hardQuestions.shuffle()
        
        timerProgress.progress = 1
    }
    
    
    func talk(string: String){
        //輸入要說的話
        utterance = AVSpeechUtterance(string: string)
        //調整語言
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        //調整速度
        utterance.rate = speedSlider.value
        //調整音調
        utterance.pitchMultiplier = pitchSlider.value
        //調整音量
        utterance.volume = volumeSlider.value
        //產生語音內容
        synthesizer.speak(utterance)
    }
    
    @IBAction func speak(_ sender: Any) {
        switch level {
        case 0:
            talk(string: easyQuestions[currentQuestion].string)
        case 1:
            talk(string: mediumQuestions[currentQuestion].string)
        default:
            talk(string: hardQuestions[currentQuestion].string)
        }
    }
    
    @IBAction func setAudio(_ sender: UIButton) {
        audioSettingView.isHidden = false
        
        audioNameLabel.text = name
    }
    
    
    @IBAction func tryTheAudio(_ sender: UIButton) {
        talk(string: (audioSampleLabel.text! + audioNameLabel.text!))
    }
    
    
    @IBAction func finishSetting(_ sender: Any) {
        audioSettingView.isHidden = true
    }
    

}
