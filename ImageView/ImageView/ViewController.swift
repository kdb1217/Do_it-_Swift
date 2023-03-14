//
//  ViewController.swift
//  ImageView
//
//  Created by 김다빈 on 2023/03/14.
//

import UIKit

class ViewController: UIViewController {
    var isZoom = false //확대 여부를 나타내는 변수
    
    var imgOn: UIImage? //켜진 전구 이미지가 있는 UIImage 타입의 변수
    
    var imgOff: UIImage? //꺼진 전구 이미지가 있는 UIImage 타입의 변수

    @IBOutlet var btnResize: UIButton!
    @IBOutlet var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgOn = UIImage(named: "lamp_on.png")
        imgOff = UIImage(named: "lamp_off.png")
        
        imgView.image = imgOn
        // Do any additional setup after loading the view.
    }

    @IBAction func btnResizeimage(_ sender: UIButton) {
        let scale:CGFloat = 2.0
        var newWidth:CGFloat, newHeight:CGFloat
        
        if (isZoom) {//true
            newWidth = imgView.frame.width/scale
            newHeight = imgView.frame.height/scale
            btnResize.setTitle("확대", for: .normal)
        }
        
        else {//false
            newWidth = imgView.frame.width*scale
            newHeight = imgView.frame.height*scale
            btnResize.setTitle("축소", for: .normal)
        }
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        isZoom = !isZoom
    }
    
    @IBAction func switchimageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            imgView.image = imgOn
        } else {
            imgView.image = imgOff
        }
    }
}

