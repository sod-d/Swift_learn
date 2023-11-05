//
//  ViewController.swift
//  multiPickerView
//
//  Created by soyoung kim on 2023/11/05.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let MAX_ARRAY_NUM = 10
    let PICKER_VIEW_COLUMN = 2
    var imageArray = [UIImage?]()
    var imageFileName : [String] = ["1.jpg", "2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg","8.jpg","9.jpg","10.jpg"]
    
    @IBOutlet var pickerImage1: UIPickerView!
    @IBOutlet var lblImageFileName: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for i in 0 ..< MAX_ARRAY_NUM {
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
        
        lblImageFileName.text = "selected Image : " + imageFileName[0]
        imageView.image = imageArray[0]
    }
    
    //피커 뷰의 컴포넌트는 피커뷰에 표시되는 열의 개수를 의미
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    //피커 뷰에게 컴포넌트의 열의 개수를 정수값으로 넘겨줌
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }
    
//    컴포넌트의 각 열의 타이틀을 문자열(String) 값으로 넘겨줍니다
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return imageFileName[row]
//    }

    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView1 = UIImageView(image: imageArray[row])
        imageView1.frame = CGRect(x: 0, y: 0, width: 100, height: 150)
        
        return imageView1
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(component == 0){
            lblImageFileName.text =  "selected Image : " + imageFileName[row]
        }else{
            imageView.image = imageArray[row]
        }
        
        
    }

}

