//
//  ViewController.swift
//  pictureBook
//
//  Created by Hsiao-Han Chi on 2022/4/1.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var picturebookImageView: UIImageView!
    @IBOutlet weak var picturebookPageControl: UIPageControl!
    @IBOutlet weak var picturebookSegment: UISegmentedControl!
    @IBOutlet weak var picturebookTextView: UITextView!
    
    //Array儲存資料
    let picturebookImages = ["向左走向右走", "月亮忘記了", "星空"]
    let picturebookText = ["習慣讓人有種莫名的安全感，卻又有種莫名的寂寞。而你永遠不知道，你的習慣會讓你錯過什麼。」---《向左走，向右走》", "「每個人都有一個像月亮一樣的愛人，因為這個愛人，我們擁有守護的能力。」---《月亮忘記了》", "「仰望星空，我想知道：有人正從世界的某個地方朝我走來嗎？像光那樣，從一顆星到達另外一顆星。」---《星空》"]
    
    //定義陣列顯示的順序
    var num : Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sync()
    }
    
    //建立 Function 定義同步改變的資料元件
    func sync(){
        picturebookImageView.image = UIImage(named: picturebookImages[num])
        picturebookTextView.text = picturebookText[num]
        picturebookPageControl.currentPage = num
        picturebookSegment.selectedSegmentIndex = num
    }

    @IBAction func pageChange(_ sender: UIPageControl) {
        num = sender.currentPage
        sync()
        
    }
    
    @IBAction func segmentChange(_ sender: UISegmentedControl) {
        num = sender.selectedSegmentIndex
        sync()
        
    }
    
    @IBAction func next(_ sender: Any) {
        if num == picturebookImages.count - 1 {
            num = 0
        }else{
            num += 1
        }
        sync()
        
    }
    
    
    @IBAction func previous(_ sender: Any) {
        if num == 0 {
            num = picturebookImages.count - 1
        }else{
            num -= 1
        }
        sync()
    }
    
    @IBAction func changePage(_ sender: UISwipeGestureRecognizer){
        if sender.direction == .left{
            if num == picturebookImages.count - 1 {
                num = 0
            }else{
                num += 1
            }
            sync()
        }else if sender.direction == .right{
            if num == 0 {
                num = picturebookImages.count - 1
            }else{
                num -= 1
            }
            sync()
        }
    }
    
}

