//
//  ViewController.swift
//  speakyourmessage
//
//  Created by joseph on 2020/4/3.
//  Copyright © 2020 joseph. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    @IBOutlet weak var speedSlider: UISlider!
    @IBOutlet weak var toneSlider: UISlider!
    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var ConfessionTextField: UITextField!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var toneLabel: UILabel!
    @IBOutlet weak var volumeLabel: UILabel!
   //程式內設定按return自動關閉鍵盤
    @objc func closeKeyboard(){
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ConfessionTextField.addTarget(self, action: #selector(closeKeyboard), for: .editingDidEndOnExit)
    }
    //按螢幕鍵盤外的地方，使其鍵盤自動關閉
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
    }
    
   //點選龍頭Button唸出textfield的內容
    @IBAction func confessionButton(_ sender: UIButton) {
        //唸出confessionText內容
        let utterance = AVSpeechUtterance(string: ConfessionTextField.text!)
       //利用speechsynthesizer產生語音
        let synthesizer = AVSpeechSynthesizer()
        //voice設定講話的語種，在此設為中文
        utterance.voice = AVSpeechSynthesisVoice(language: "zh-TW")
        //pitchmultiplier為講話的音調，讓其由Slider操控
        utterance.pitchMultiplier = toneSlider.value
        //rate為講話速度，讓其由Slider控制
        utterance.rate = speedSlider.value
        //volume為講話聲量，讓它由Slider控制
        utterance.volume = volumeSlider.value
        //由語音器發出聲音，其說話內容為confessionText所輸入的內容
        synthesizer.speak(utterance)
       //Label顯示slider數值，到小數點第2位
        speedLabel.text = String(format: "%.2f",speedSlider.value)

        toneLabel.text = String(format: "%.2f",toneSlider.value)

        volumeLabel.text = String(format: "%.2f",volumeSlider.value)
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        speedLabel.text = String(format: "%.2f",speedSlider.value)

        toneLabel.text = String(format: "%.2f",toneSlider.value)

        volumeLabel.text = String(format: "%.2f",volumeSlider.value)
        
    }
    
}

