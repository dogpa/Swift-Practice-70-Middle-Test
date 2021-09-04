//
//  GradePageViewController.swift
//  Swift Practice # 70 Middle Test
//
//  Created by Dogpa's MBAir M1 on 2021/9/4.
//

import UIKit

class GradePageViewController: UIViewController {
    
    
    var totalGrade: Int!                        //指派totalGrade為Int，取得前一頁的答對幾題的分數
    
    @IBOutlet weak var gradeLabel: UILabel!     //顯示分數的Label
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //依照不同的答對題數，顯示不同的分數內容
        if totalGrade < 3 {
            gradeLabel.text = "總共 \(totalGrade * 10) 分 \n要多看地理雜誌"
            gradeLabel.textColor = .black
        }else if totalGrade > 2 && totalGrade <= 6 {
            gradeLabel.text = "總共 \(totalGrade * 10) 分 \n你是地理小老師"
            gradeLabel.textColor = .blue
        }else if totalGrade > 6 && totalGrade <= 9 {
            gradeLabel.text = "總共 \(totalGrade * 10) 分\n你是地理探險家"
            gradeLabel.textColor = .blue
        }else if totalGrade == 10 {
            gradeLabel.text = "總共 \(totalGrade * 10) 分\n你是全球地理通"
            gradeLabel.textColor = .red
        }
    }
    
    
}
