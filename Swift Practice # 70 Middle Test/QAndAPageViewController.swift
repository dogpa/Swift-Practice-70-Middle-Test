//
//  QAndAPageViewController.swift
//  Swift Practice # 70 Middle Test
//
//  Created by Dogpa's MBAir M1 on 2021/9/4.
//

import UIKit

class QAndAPageViewController: UIViewController {

    @IBOutlet weak var numbersOfQuestionLabel: UILabel! //顯示目前是第幾題
    
    @IBOutlet weak var questionContentLabel: UILabel!   //顯示題目內容
 
    @IBOutlet var answerButtonArray: [UIButton]!        //4個button的outlet collection
    
    
    var indexOfQuestion = 0         //儲存目前題數與startToQuestion的Func抓題目用
    var timesForRightAnswer = 0     //儲存答對題數
    
    //透過自訂義的QA struct及建立題庫
    var qAndAArray : [QA] = [
        QA(question: "臺灣下列哪個地區的媽祖廟,\n祭祀歷史最為悠久?", optionArrary: ["鹿港天后宮","大甲鎮瀾宮","澎湖天后宮","臺南大天后宮"], answer: "澎湖天后宮"),
        QA(question: "莫拉克風災迄今已經十年，\n當年造成嚴重災情的那瑪夏，\n位於臺灣的哪個縣市？", optionArrary: ["屏東縣","臺東縣","高雄市","南投縣"], answer: "高雄市"),
        QA(question: "下列哪個臺灣地名的來源，\n不同於其他三者，\n最可能與原住民族語言有關？", optionArrary: ["苗栗","彰化","嘉義","桃園"], answer: "苗栗"),
        QA(question: "臺灣盛產香蕉的最主要因素\n為下列何者？", optionArrary: ["土壤","氣候","水文","地形"], answer: "氣候"),
        QA(question: "下列何者為英國的海外屬地？", optionArrary: ["關島","夏威夷","愛爾蘭","福克蘭群島"], answer: "福克蘭群島"),
        QA(question: "近年來大量移入美國境內的移民，\n以下列何處的數量最多？", optionArrary: ["歐洲","非洲","亞洲","中南美洲"], answer: "中南美洲"),
        QA(question: "下列哪個城市的格局，\n是模仿中國唐代長安的棋盤式設計？", optionArrary: ["高雄","京都","上海","首爾"], answer: "京都"),
        QA(question: "二戰期間，\n哪個國家重創歐美國家遠東的勢力，\n激發東方民族的反歐情緒？", optionArrary: ["美國","中國","日本","德國"], answer: "日本"),
        QA(question: "「阿猴東城門」\n該史蹟位在下列哪個縣市？", optionArrary: ["臺東縣","屏東縣","高雄市","臺南市"], answer: "屏東縣"),
        QA(question: "以下臺灣四個鄉鎮區中，\n哪個位於濁水溪南岸，\n並以米與醬油聞名？", optionArrary: ["高雄美濃","台東池上","苗栗三義","雲林西螺"], answer: "雲林西螺"),
        QA(question: "臺灣最大的淡水湖泊為何？", optionArrary: ["南仁湖","日月潭","澄清湖","鯉魚潭"], answer: "日月潭"),
        QA(question: "日本2019年新的年號為下列何者？", optionArrary: ["平成","令和","大正","安久"], answer: "令和"),
        QA(question: "2020台灣公視戲劇\n「斯卡羅」\n發生地點為何", optionArrary: ["屏東縣恆春","台東縣大武","花蓮縣光復","高雄市桃源"], answer: "屏東縣恆春"),
        QA(question: "哪個國家座落於裂谷上，\n而且國土持續增加中？", optionArrary: ["日本","冰島","印尼","巴西"], answer: "澎湖天后宮"),
        QA(question: "何者不是台灣四極點燈塔", optionArrary: ["鵝鑾鼻燈塔","三貂角燈塔","國聖燈塔","目斗嶼燈塔"], answer: "目斗嶼燈塔"),
    ]
    
    //色彩Array改變Button的底色使用
    var buttonColor : [UIColor] = [.black, .blue, .brown , .link, .lightGray, .orange, .purple, .systemGreen, .systemPink, .lightGray, .systemRed, .cyan, .darkGray, .systemYellow, .systemTeal, .red, .green, .darkText ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        qAndAArray.shuffle()                        //重新改變qAndAArray的順序
        indexOfQuestion = 0                         //indexOfQuestion歸0
        startToQuestion(index: indexOfQuestion)     //執行自定義的Func參數帶入indexOfQuestion

    }
    
    //自定義Func改變Button的顏色
    func changeButtonColor() {
        let randomColor = buttonColor.randomElement()           //取得隨機色彩
        for i in 0...3 {                                        //透過for迴圈指派顏色
            answerButtonArray[i].backgroundColor = randomColor
        }
    }
    
    //自定義Func 出題目 改變第二頁的顯示題目內容與4個Button的選項
    func startToQuestion (index: Int) {
        changeButtonColor()                                             //先變顏色
        numbersOfQuestionLabel.text = "第 \(index+1) 題"                 //顯示題號
        questionContentLabel.text = "\(qAndAArray[index].question)"     //顯示題目內容
        qAndAArray[index].optionArrary.shuffle()                        //改變指定的選項的順序
        for i in 0...3 {                                                //指派答案到button上
            answerButtonArray[i].setTitle(String(qAndAArray[index].optionArrary[i]), for: .normal)
        }
    }
    
    
    //4個button的IBAction
    @IBAction func startToQuestion(_ sender: UIButton) {
        //判斷是否答對
        if sender.currentTitle == String(qAndAArray[indexOfQuestion].answer){
            timesForRightAnswer += 1            //答對+1
        }else{
            timesForRightAnswer += 0            //答錯+0
        }
        print(timesForRightAnswer)              //列印目前答對題數
        indexOfQuestion += 1                    //題號+1
        startToQuestion(index: indexOfQuestion) //執行下一題
        
        
        if indexOfQuestion == 10 {  //回答滿十題後
            indexOfQuestion = 9     //參數回到9
            startToQuestion(index: indexOfQuestion)
            
            //跳出通知並跳至顯示分數的頁面透過performSegue的方式完成
            let controller = UIAlertController(title: "完成做答", message: "請至下一頁確認分數", preferredStyle: .alert)
                        let yesAction = UIAlertAction(title: "了解", style: .default) { _ in
                            self.performSegue(withIdentifier: "goToSeeGrade", sender: nil)
                        }
                        controller.addAction(yesAction)
                        present(controller, animated: true, completion: nil)
            
        }
    }
    
    //將答對幾題的timesForRightAnswer傳給顯示分數的頁面
    @IBSegueAction func passGrade(_ coder: NSCoder) -> GradePageViewController? {
        
        let controller = GradePageViewController(coder: coder)
        controller?.totalGrade = timesForRightAnswer
        return controller
        
    }
    
    


}

