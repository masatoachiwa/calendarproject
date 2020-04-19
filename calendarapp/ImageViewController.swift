//
//  ImageViewController.swift
//  calendarapp
//
//  Created by アプリ開発 on 2019/12/15.
//  Copyright © 2019 Masato.achiwa. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

      
        
        @IBOutlet var jkImage: UIImageView!
        
        @IBOutlet var speechText: CustomLabel!
  
        @IBOutlet var loveBar: UIProgressView!
        
        @IBOutlet var doryokuLabel: CustomLabel!
        
        @IBOutlet var progressLabel: UILabel!
        


        var n = 0
        
        @IBOutlet var friendButton: UIButton!
        
        @IBOutlet var firstButton: UIButton!
        
        @IBOutlet var nextButton: UIButton!
        
        @IBOutlet var backButton: UIButton!
        
        
        
        
        var kakinNum = 0
        
        var cu : Int = 0
        
    //  let transform1 = CGAffineTransform(scaleX: 1, y: 10)
    //   let transform2 = CGAffineTransform(rotationAngle: CGFloat(-Double.pi / 2))
        
       
        
        
        
    override func viewDidLoad() {
        super.viewDidLoad()
     
//        friendButton.imageView?.contentMode = .scaleAspectFit
//     friendButton.contentHorizontalAlignment = .fill
//        friendButton.contentVerticalAlignment = .fill
        
        nextButton.isEnabled = false
         backButton.isEnabled = false
        
        
        let talkManager = TalkManager()
//        speechText.adjustsFontSizeToFitWidth = true 効果なし
//        speechText.minimumScaleFactor = 10
        
        switch talkManager.currentType {
        case .good:
                speechText.text = talkManager.numberOfLabel().0
                jkImage.image = talkManager.numberOfLabel().1
                
        case .bad:
                speechText.text = talkManager.badOfLabel().0
                jkImage.image = talkManager.badOfLabel().1
                
        case .rest:
                speechText.text = talkManager.badOfLabel().0
                jkImage.image = talkManager.badOfLabel().1
        }
        
        
        
    //   loveBar.transform = transform1
    loveBar.frame = CGRect(x:0, y: 0, width :0, height: 0) //優先度が低い
       // view.layoutIfNeeded()
        loveBar.translatesAutoresizingMaskIntoConstraints = false //制約をかける合図
        loveBar.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.4).isActive = true
        loveBar.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.04).isActive = true
       loveBar.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        loveBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        
        doryokuLabel.translatesAutoresizingMaskIntoConstraints = false
        doryokuLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.4).isActive = true
        doryokuLabel.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.04).isActive = true
        doryokuLabel.rightAnchor.constraint(equalTo: loveBar.leftAnchor, constant: -20).isActive = true
        doryokuLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
        
        //  loveBar.transform = transform1.concatenating(transform2)
        speechText.padding = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
      
        
        
        
        
        
        
        
        
        }
        

        
        override func viewWillAppear(_ animated: Bool) {
      
                let talkManager = TalkManager()
              
                
                loveBar.setProgress(Float(Double(talkManager.currentTotalPoint) * 0.005555), animated: true)

                let num = loveBar.progress  * 100
         
                 doryokuLabel.text = " 努力値累計 " +  "\(talkManager.currentTotalPoint)回" + "（ \(ceil(num * 10)/10)%）"
           
            
                
                switch talkManager.currentType {
                case .good:
                       speechText.text = talkManager.numberOfLabel().0
                         jkImage.image = talkManager.numberOfLabel().1
                       
                case .bad:
                       speechText.text = talkManager.badOfLabel().0
                         jkImage.image = talkManager.badOfLabel().1
                case.rest:
                        speechText.text = talkManager.restOfLabel().0
                        jkImage.image  = talkManager.restOfLabel().1
 
                }
        }

  
        @IBAction func goButton(_ sender: Any) {
        let outArray = (UserDefaults.standard.array(forKey: {"kakindayArray"}())as? [Int] ?? [0]) //達成できたボタン押した回数
                let numArray = outArray.count-1     //３回タップしたら、０を含むと配列の数は４つになるため−１する（タップ回数）のnumArrayを作る。
                if n >= numArray{                 //nが配列の個数以上だったら（nはタップ回数)が配列の個数以上だったら,足すのをやめる。
//                  n = numArray
//                        print(n)
                        return
                        
                }else{
               
                        n = n + 1
       
                 self.kakinNum = outArray[n]
   print(n,kakinNum)
                speechText.text = numberOfLabel().0
                jkImage.image = numberOfLabel().1
                }
        }
        
        
        @IBAction func backButton(_ sender: Any) {
                let outArray = (UserDefaults.standard.array(forKey: {"kakindayArray"}())as? [Int] ?? [0]) //達成できたボタン押した回数
              
                if n == 0{
                        return
                }else{
                n = n - 1
                        
                        self.kakinNum = outArray[n]
                        print(n,kakinNum)
              
                speechText.text = numberOfLabel().0
                jkImage.image = numberOfLabel().1
                }
        }
        
        
        @IBAction func firstButton(_ sender: Any) {
               n = 0
                let kakindayArray : [Int] =  (UserDefaults.standard.array(forKey: {"kakindayArray"}())as? [Int] ?? [0])
                let outArray = kakindayArray
                self.kakinNum = outArray[n]
               print(n,kakinNum)
                
                nextButton.isEnabled = true
                backButton.isEnabled = true
                
                
                
                speechText.text = numberOfLabel().0
                jkImage.image = numberOfLabel().1
        }
      
        let image1 = UIImage(named:"1")
        let image2 = UIImage(named:"2")
        let image3 = UIImage(named:"3")
        let image4 = UIImage(named:"4")
        let image5 = UIImage(named:"5")
        let image6 = UIImage(named:"6")
        let image7 = UIImage(named:"7")
        let image8 = UIImage(named:"8")
        let image9 = UIImage(named:"9")
        let image10 = UIImage(named:"10")
        let image11 = UIImage(named:"11")
        let image12 = UIImage(named:"12")
        let image13 = UIImage(named:"13")
        let image14 = UIImage(named:"14")
        let image15 = UIImage(named:"15")
        let image16 = UIImage(named:"16")
        let image17 = UIImage(named:"17")
        let image18 = UIImage(named:"18")
        let image19 = UIImage(named:"19")
        let image20 = UIImage(named:"20")
        let image21 = UIImage(named:"21")
        let image22 = UIImage(named:"22")
        let image23 = UIImage(named:"23")
        let image24 = UIImage(named:"24")
        let image25 = UIImage(named:"25")
        let image26 = UIImage(named:"26")
        let image27 = UIImage(named:"27")
        let image28 = UIImage(named:"28")
        let image29 = UIImage(named:"29")
        let image10a = UIImage(named:"10a")
        let image20a = UIImage(named:"20a")
        let image30a = UIImage(named:"30a")
        let image40a = UIImage(named:"40a")
        let image50a = UIImage(named:"50a")
        let image60a = UIImage(named:"60a")
        let image70a = UIImage(named:"70a")
        let image80a = UIImage(named:"80a")
        let image90a = UIImage(named:"90a")
        let image100a = UIImage(named:"100a")
        let image110a = UIImage(named:"110a")
        let image120a = UIImage(named:"120a")
        let image130a = UIImage(named:"130a")
        let image140a = UIImage(named:"140a")
        let image150a = UIImage(named:"150a")
        let image160a = UIImage(named:"160a")
        let image170a = UIImage(named:"170a")
        let image180a = UIImage(named:"180a")
        
        let name = (UserDefaults.standard.string(forKey: "name") ?? "田中")
        let effort = (UserDefaults.standard.string(forKey: "effort") ?? "努力")
        
        
        func numberOfLabel() -> (String, UIImage) {
                switch kakinNum {
                case 0:
                        return ("\(name)聞いたよー。\(effort)始めたんだってね？何日続くんだろうね？（笑",image1!)
                case 1:
                        return ("早速\(effort)やったんだ。",image2!)
                case 2:
                        return ("やるじゃん！絶対やめたと思った。",image14!)
                case 3:
                        return ("3日続いたね。エライ！",image6!)
                case 4:
                        return ("そろそろ飽きたころでしょ？",image3!)
                case 5:
                        return ("最近雨が多いのは\(name)が珍しく頑張ってるから？",image18!)
                case 6:
                        return( "\(effort)続いているみたいだね。頑張って。", image8!)
                case 7:
                        return( "一週間もったね。応援してるよ。",image10!)
                case 8:
                        return ("今日も\(effort)してたんだね。お疲れ様。",image15!)
                case 9:
                        return ("\(name)お疲れ様。はい、ジュース。",image4!)
                case 10:
                        return ("10日目達成だね。ちょっと見直したな。",image10a!)
                case 11:
                        return ("ここまできたら諦めたらだめだよ。",image8!)
                case 12:
                        return ("最近頑張ってるね。感心、感心（笑）",image18!)
                case 13:
                        return ("頑張るのもいいけど、たまには息抜きも必要だよ。",image10!)
                case 14:
                        return ("二週間経ったね。ちょっと尊敬するかも。", image6!)
                case 15:
                        return ("頑張って半年は続けることね！",image8!)
                case 16:
                        return ("私も\(effort)やろうかなー？",image7!)
                case 17:
                        return ("あーごめん笑。結局\(effort)やってない。私は小さい頃からピアノをずっと続けられているからいいの笑",image18!)
                case 18:
                        return ("お疲れ様。今日も飽きずに\(effort)できたね。",image17!)
                case 19:
                        return ("最近\(name)が頑張っても雨降らなくなったね笑",image1!)
                case 20:
                        return( "２０日達成したよー。へい、へーい！",image20a!)
                case 21:
                        return ("もうすぐ１ヶ月だねー。なんだかしみじみするね。",image7!)
                case 22:
                        return ("\(name)が頑張ってると、なんだか私も頑張らなきゃって思うよ。",image8!)
                case 23:
                        return ("焦らずに行こうね。急がば回れだよ。",image12!)
                case 24:
                        return ("さっき友達に\(name)のこと話したら褒めてたよ。",image18!)
                case 25:
                        return ("今日も頑張ったんだね。飛ばしすぎちゃだめだよ。",image10!)
                case 26:
                        return ("疲れ溜まってない？大丈夫？",image11!)
                case 27:
                        return ("お疲れ、今日は何時まで\(effort)してたの？",image1!)
                case 28:
                        return ("\(name)の努力が早く実るといいね。",image8!)
                case 29:
                        return ("えへへ。安定の努力家ですね！",image15!)
                case 30:
                        return ("30日経ったよ！これから苦しくなるかもしれないけど応援してるから！",image30a!)
                case 31:
                        return ("まだまだこれからだよ！うん。",image10!)
                case 32:
                        return ("やっぱり努力してる人って素敵だな。",image5!)
                case 33:
                        return ("もうすぐ定期試験だね。二足のわらじも大変だけど頑張ろ。",image6!)
                case 34:
                        return ("やっぱり定期試験の勉強との両立って難しいよね。できる\(name)のこと尊敬するなー。",image15!)
                case 35:
                        return("今日は私疲れちゃって全然勉強できなかったー。\(name)と違って私だめだなー。",image16!)
                case 36:
                        return ("今日もお疲れ様！明日は定期テストだよ。",image5!)
                case 37:
                        return ("定期テストできたの？\(effort)しながらよく頑張ったね。",image2!)
                case 38:
                        return ("\(name)ってさあ、\(effort)始める前よりもテストの点あがってない？",image11!)
                case 39:
                        return ("一つのことを努力する習慣がつくと、他のこともできるようになるのかな？",image14!)
                case 40:
                        return ("クラスメートも\(name)が変わったことに気がつき始めたかもね。",image18!)
                case 41:
                        return ("私は最初から\(name)はやればできるって知ってたよ。",image10!)
                case 42:
                        return ("お疲れ様、本当にすごいね。\(name)の集中力を分けて欲しいよ。",image20!)
                case 43:
                        return ("たまには休息もとらないとダメだよ。",image9!)
                case 44:
                        return ("\(name)は彼女いないの？",image3!)
                case 45:
                        return ("いないんだー。ごめん、変なこときいて。",image15!)
                case 46:
                        return ("今は\(effort)を頑張ってるから彼女なんていらないよね。",image12!)
                case 47:
                        return ("あっ、もうすぐ５０日だよ。ファイトー！",image6!)
                case 48:
                        return ("お疲れ！ちゃんと息抜きしてる？これ飲んで。",image4!)
                case 49:
                        return ("感心、感心！",image8!)
                case 50:
                        return ("５０日ー！おめでとー！",image50a!)
                case 51:
                        return ("とりあえず半年は頑張って！私にできることは協力するから。",image8!)
                case 52:
                        return ("だから後１３０日！道のりは長いよ！",image22!)
                case 53:
                        return ("\(name)なら絶対できるよ！",image24!)
                case 54:
                        return ("もう\(effort)しないと気持ち悪いんじゃない？",image16!)
                case 55:
                        return ("不思議だね。私も\(name)が今日は\(effort)してないって聞くと、何かあったの？って思うようになっちゃった。",image2!)
                case 56:
                        return ("なんだか\(name)の頑張ってる姿を見ると私も嬉しくなっちゃう。",image7!)
                case 57:
                        return ("今日も頑張ったね！私もピアノの練習頑張らなくっちゃ。",image15!)
                case 58:
                        return ("今度私にも\(effort)教えて欲しいなー。",image12!)
                case 59:
                        return ("やりすぎは体に毒だから、飛ばしすぎないでね。",image9!)
                case 60:
                        return ("６０日できたね。３分の１終わったよ！",image60a!)
                case 61:
                        return ("お疲れ！ねえ、\(name)はなんで\(effort)を始めたの？",image3!)
                case 62:
                        return ("みんなそれぞれいろんな理由があるけど、頑張っている人はかっこいいと思うよ。",image5!)
                case 63:
                        return ("だから、\(name)も今かっこいいよ。",image7!)
                case 64:
                        return ("照れてるのー？",image3!)
                case 65:
                        return ("その表情マルですね。",image3!)
                case 66:
                        return ("今これ流行ってるんだよ。\(name)は毎日頑張ってるから知らないかもね。",image17!)
                case 67:
                        return ("お疲れ様。良かったら一緒に帰ろ。",image8!)
                case 68:
                        return ("私ね、最近\(name)の影響なのかピアノの練習が前より楽しいんだ。",image7!)
                case 69:
                        return ("類は友を呼ぶっていうからかな、\(name)見てると私も頑張らなくちゃって思うの。",image18!)
                case 70:
                        return ("\(effort)を続けて思うような結果がでなかったらどうしようとか、そんなことを考えたりはしてないよね？",image25!)
                case 71:
                        return ("他には、どうせうまくいかないから頑張っても意味ないんじゃないか、とかね。",image23!)
                case 72:
                        return ("私がそうだったから...\(name)も同じ悩みを抱えていないか心配だったの。",image9!)
                case 73:
                        return ("でもここまで続けてきた\(name)ならきっとうまくいくよ。",image16!)
                case 74:
                        return ("それに私が応援しているんだから絶対に大丈夫（笑）",image17!)
                case 75:
                        return ("あっーー！今日で\(effort)始めてから達成できた日が75日経ってる。70日目伝えるの忘れてた。",image8!)
                case 76:
                        return ("看板もう描いちゃってたから許してね。正しくは76日目達成！",image70a!)
                case 77:
                        return ("私が\(name)の努力した日数を毎日ちゃんと数えてるからね！",image5!)
                case 78:
                        return ("言わなくても分かるよ、お疲れ様。",image15!)
                case 79:
                        return ("いつも以上に頑張らなくてもいいからね！いつも通りで。",image14!)
                case 80:
                        return ("８０日経ったよー。いえーい！",image80a!)
                case 81:
                        return ("\(name)は結果と過程どっちが大切派？",image11!)
                case 82:
                        return ("私は過程派だな。甘いかな？",image1!)
                case 83:
                        return ("努力しても結果が出ないことはあっても、結果を出す人に努力してない人はいないと思うんだ。",image8!)
                case 84:
                        return ("誰かの受け売りだけどね。私もそう思うな。",image18!)
                case 85:
                        return ("あせらずに頑張ってね。必ず成功するって信じてるから。",image12!)
                case 86:
                        return ("頑張れ！頑張れ！\(name)！",image6!)
                case 87:
                        return ("毎日頑張っていることって、辛いことじゃなくて楽しいことなんだって\(name)見てたら思うようになったな。",image15!)
                case 88:
                        return ("眠たい時とかは、無理して頑張るんじゃなくてちょっと仮眠してからするといいよ。",image18!)
                case 89:
                        return ("私は仮眠するとそのまま朝まで寝ちゃうから、向いてない人もいるけど。",image20!)
                case 90:
                        return ("９０日おめでとう！あっという間だった？長かった？何はともわれ残り９０日！",image90a!)
                case 91:
                        return ("今日もお疲れ様。３ヶ月あっという間だったなー。",image7!)
                case 92:
                        return ("折り返し地点を過ぎたって考えると残りはもうすぐだね。",image10!)
                case 93:
                        return ("なんだか最後までやり終えた\(name)を想像するとワクワクするね。",image5!)
                case 94:
                        return ("絶対に最後まで応援するからよろしくね。",image15!)
                case 95:
                        return ("お疲様、本当に\(name)が毎日楽しそうで羨ましい。",image17!)
                case 96:
                        return ("クラスの友達も最近\(name)の顔つきが変わった？って言ってたよ。",image2!)
                case 97:
                        return ("努力を楽しめる人って本当に素敵だと思うな。",image8!)
                case 98:
                        return ("そういう人は壁にぶち当たっても、それを突破するのが楽しんだろうな。",image10!)
                case 99:
                        return ("私はそんな\(name)を見てるのが楽しいよ。",image1!)
                case 100:
                        return ("おめでとう！１００日目だよ。ついに３桁いきましたね。",image100a!)
                case 101:
                        return ("もう\(effort)し続けることは苦にならないよね？",image12!)
                case 102:
                        return ("今日も１日お疲れ様です。これ飲んで休憩しよ。",image4!)
                case 103:
                        return("私正直いうとね、\(effort)一週間でやめると思っていたんだよ。",image13!)
                case 104:
                        return ("これだけ続けていられるのは本当に\(name)が変わろうと決心したからだよ。",image10!)
                case 105:
                        return ("それと少しは私のお陰もあるのかな？",image15!)
                case 106:
                        return ("嘘々、全部\(name)の力だよ。私は応援してるだけですから。",image18!)
                case 107:
                        return ("これからも\(name)のこと応援させてね。",image6!)
                case 108:
                        return( "何の得にもならないのにどうして応援してくれるのかって？",image11!)
                case 109:
                        return ("何だか楽しいんだよね。\(name)の成長見てると。",image17!)
                case 110:
                        return ("ジャーン！１１０日経ったよ！あと７０日だね。",image110a!)
                case 111:
                        return ("そう言えば私ね、一回だけピアノの練習をやめた時期があるんだ。",image25!)
                case 112:
                        return ("私より年下で私より後にピアノを始めたのに、本当に才能があるこですぐに抜かされたの。",image26!)
                case 113:
                        return ("だか練習するのがバカらしくなって休んだり、レッスンに行っても練習してないからすぐにバレたんだ。",image20!)
                case 114:
                        return ("それで先生にやめたいって言ったんだ。理由も正直に話したわ。",image13!)
                case 115:
                        return ("そしたら先生に「人と比べるんじゃなくて、昨日の自分を超えることを考えて」って言われたの。",image18!)
                case 116:
                        return ("先生は続けてこう言ったの。「人と比べるより、昨日の自分に勝つことができる子が伸びるの。",image18!)
                case 117:
                        return ("どんなに才能があっても、人と比べているだけで満足してたら絶対にどこかで止まるわ。",image18!)
                case 118:
                        return ("だから、自分に負けないで」って。それでもう一度やってみようと思ったんだ。",image17!)
                case 119:
                        return ("ごめんね。こんな話して、ちょっと嫉妬しちゃったんだ。毎日目標に向けて突っ走る\(name)を見て。",image16!)
                case 120:
                        return ("あっ、ごめん。今日で１２０日目だよ。いえーい！",image120a!)
                case 121:
                        return ("きっと\(name)は\(effort)の才能があるんだろうなー。",image13!)
                case 122:
                        return ("もし私みたいに、やめたい時期がきたら私に相談してくれると嬉しいな。",image9!)
                case 123:
                        return ("でもこれは、その…\(name)のこといつか挫折するって疑っているわけじゃないからね。",image24!)
                case 124:
                        return ("絶対に成功するって分かってるから。ちょっとだけ私の気持ちも知って欲しかっただけ。",image23!)
                case 125:
                        return ("変なこと言ってごめんね。また明日からも頑張ろー！",image17!)
                case 126:
                        return ("お疲れ様。一緒に帰ろ。",image8!)
                case 127:
                        return ("いえい！相変わらず絶好調だね。",image6!)
                case 128:
                        return( "人生のターニングポイントはいつですか？ふふ。将来絶対聞かれるよ。",image18!)
                case 129:
                        return ("お疲れ様。ルーティン化されてきて、やらない日がほとんどなくなったね。",image15!)
                case 130:
                        return ("ジャジャジャジャーン！１３０日達成だよ！あと５０日。",image130a!)
                case 131:
                        return ("ここから先がファイトだよ！意外と前半頑張りすぎて後半しぼんできちゃう人もいるから。",image22!)
                case 132:
                        return ("お疲れ様。毎日頑張りすぎないように頑張ろうね笑",image8!)
                case 133:
                        return ("すごいよ\(name)。本当にすごい。",image5!)
                case 134:
                        return ("お疲れ様。今日も頑張りすぎてない？",image13!)
                case 135:
                        return ("友達が\(name)のこと最近かっこいいって言ってたよ。",image3!)
                case 136:
                        return ("えっ？私は\(name)のことかっこいいと思わないのかって？",image11!)
                case 137:
                        return ("へへ。秘密です。",image15!)
                case 138:
                        return ("最後までやり遂げたらかっこいいかな？",image18!)
                case 139:
                        return ("もう心配無用だね。このままゴールまであと一息だよ。",image6!)
                case 140:
                        return ("１４０日達成！！後４０日だよ。",image140a!)
                case 141:
                        return ("これならゴールを半年じゃなくて１年でもいけそうだね。伸ばす？",image13!)
                case 142:
                        return ("冗談だよ。半年の目標を達成させてから次は考えよ。",image17!)
                case 143:
                        return ("ねー。\(name)は好きな人とかいるの？",image3!)
                case 144:
                        return ("えっ。いいじゃん。聞いたって。",image10!)
                case 145:
                        return ("逆に私はどうかって？うーん。いるよ。",image12!)
                case 146:
                        return ("へへ、誰かは秘密。そのうち教えてあげてもいいけど、今は恥ずかしいな。",image3!)
                case 147:
                        return ("そのうちっていつかって？うーん。",image16!)
                case 148:
                        return ("目標の１８０日達成したらかな。",image15!)
                case 149:
                        return ("そういえば\(name)が好きな人いるか聞いてない！",image24!)
                case 150:
                        return ("１５０日達成したよ。ラスト３０日！",image150a!)
                case 151:
                        return ("いよいよ１ヶ月切ったね。長かったような、短かったような。",image7!)
                case 152:
                        return ("今日もお疲れ様。風引かないようにゆっくりしてね。",image10!)
                case 153:
                        return ("お疲れ様、気を緩めずに行こうね。",image17!)
                case 154:
                        return ("季節もすっかり変わっちゃったけどまだまだ行くよ！",image6!)
                case 155:
                        return( "今日もお疲れ様！このセリフ何回ぐらい言ったんだろうね？",image15!)
                case 156:
                        return ("あとちょっとでお疲れ様って言えなくなっちゃうの寂しいな。",image16!)
                case 157:
                        return ("最初は\(name)のことバカにしてる人もいたけど、もうみんな応援してるよ。",image5!)
                case 158:
                        return ("私は最初からバカになんかしてないからね。",image8!)
                case 159:
                        return ("続かないとはちょっとだけ思ってたかも笑",image3!)
                case 160:
                        return ("１６０日達成。あと２０日。ゴールが見えてきたね。",image160a!)
                case 161:
                        return ("なんだか\(name)か遠い存在の人になってきちゃったな。",image25!)
                case 162:
                        return ("最後までいっても応援し続けるからね。",image9!)
                case 163:
                        return ("すごいよ。もうゴールが近いのにどんどん集中力が上がってきてるね。",image7!)
                case 164:
                        return ("今日もお疲れ様！最後の最後までこのまま駆け抜けて。",image6!)
                case 165:
                        return ("ここだけの話、\(name)の努力する姿を見ていると私の方が励みになっているんだよ。",image12!)
                case 166:
                        return ("不思議だね。応援している私の方が力をもらっちゃうなんて。",image7!)
                case 167:
                        return( "\(name)の頑張る姿を見るたびに私も頑張ってたんだよ。私も褒めてー。",image17!)
                case 168:
                        return ("自分より努力してる人に褒められると、嬉しいな。",image8!)
                case 169:
                        return( "そういえば覚えてる？ゴールになったら私の好きな人いう話？",image16!)
                case 170:
                        return ("１７０日達成！ラスト１０日！いよいよだね。",image170a!)
                case 171:
                        return ("ラスト９日！体調崩さないようにね！",image6!)
                case 172:
                        return ("ラスト８日！\(name)の応援できて本当によかった。",image7!)
                case 173:
                        return ("ラスト７日！もう少しだよ。",image8!)
                case 174:
                        return ("ラスト６日！あー！楽しかった時間が終わっちゃうね。",image12!)
                case 175:
                        return ("ラスト５日！お疲れ様。良かったら一緒に帰ろ？",image15!)
                case 176:
                        return ("ラスト４日！お疲れ様。本当に\(name)のこと尊敬してるよ。",image18!)
                case 177:
                        return ("ラスト３日！いよいよだね。なんだか分かんないけど泣けてきた。",image23!)
                case 178:
                        return ("ラスト２日！ヘイ、ヘイ^^",image6!)
                case 179:
                        return ("ラスト１日！本当にお疲れ様！私に素敵な体験をさせてくれてありがとう。",image17!)
                case 180:
                        return ("180日達成おめでとう。\(name)のことが大好きです。",image19!)
                        
                case 181:
                        return ("最後まで一緒に頑張ってくれて本当にありがとうございます。これからは私がいなくても一人で努力できるよね？もちろん私は\(name)のこと応援し続けるよ。",image17!)
                        
                case 182:
                        return ("もう諦めたの？",image3!)
                        
                case 183:
                        return ("諦めるの早！",image22!)
                case 184:
                        return ("ないわ〜",image20!)
                case 185:
                        return ("くずですね。",image28!)
                case 186:
                        
                        return ("…。",image1!)
                case 187:
                        return ("バイバイ！",image29!)
                        
                        
                                        case 188:
                                                return ("どんまい。そんな時もあるよ。",image16!)
                                                
                                        case 189:
                                                return ("気にしない気にしない。",image24!)
                                        case 190:
                                                return ("体調悪いの〜?",image11!)
                                        case 191:
                                                return ("明日は頑張ろうね。",image23!)
                                        case 192:
                                                return ("もしかしてやめようとしてる？",image25!)
                                        case 193:
                                                return ("まあ、そんなもんだと思ったよ。",image18!)
                                        case 194:
                                                return ("もう一回頑張ったら？",image11!)
                                        case 195:
                                                return ("本当にやめるの？",image26!)
                                        case 196:
                                                return ("まあしょうがないよね。",image14!)
                                        case 197:
                                                return ("幻滅です。",image20!)
                                        case 198:
                                                return ("幻滅だわ。",image22!)
                                        case 199:
                                                return ("最低。",image26!)
                                        case 200:
                                                return ("嫌い！",image27!)
                                        case 201:
                                                return ("近寄らないで。",image28!)
                                        case 202:
                                                return ("…。",image1!)
                                                
                                        case 203:
                                                return ("バイバイ！",image29!)
                        
                
                                                
                                        case 204:
                                                return ("今日はゆっくりしてね。",image15!)
                                                
                                        case 205:
                                                return ("気にしない気にしない。",image24!)
                                        case 206:
                                                return ("そんな時だってあるよ！",image17!)
                                        case 207:
                                                return ("\(name)もさぼることあるんだね。",image2!)
                                        case 208:
                                                return ("疲れていたんだよ。だから大丈夫。",image8!)
                                        case 209:
                                                return ("明日やればいいさー！",image6!)
                                        case 210:
                                                return ("誰だってできない時はあるよね。",image23!)
                                        case 211:
                                                return ("まだまだ全然大丈夫。明日取り戻そ！",image15!)
                                        case 212:
                                                return( "疲れちゃった？たまにはそんな日もあっていいと思うよ。",image11!)
                                        case 213:
                                                return ("私は信じてるから諦めないでね。",image7!)
                                        case 214:
                                                return ("\(name)なら絶対やり遂げられるよ。",image24!)
                                        case 215:
                                                return ("頑張って5分だけやってみると意外とそこからやり続けちゃうよ。",image14!)
                                        case 216:
                                                return ("どんまい。そんな日もあるよ。",image26!)
                                        case 217:
                                                return ("今日できなかったことよりも、明日再開することが大事だよ。",image12!)
                                        case 218:
                                                return( "大丈夫！全てが計画通りにいく人なんていないと思うよ。",image1!)
                                        case 219:
                                                return ("諦めてないよね？諦めるなんて絶対嫌だからね。",image9!)
                                                
                                        case 220:
                                                return ("ちょっとペースダウンしてない？大丈夫？",image22!)
                                        case 221:
                                                return ("ファイト！始めた時の\(name)の目は本気だったよ、もう一回頑張ろ。",image10!)
                                        case 222:
                                                return ("今日はたまたまだよね？",image23!)
                                        case 223:
                                                return ("もしかしてやめようとしてる？",image25!)
                                        case 224:
                                                return ("まあ、そんなもんだと思ったよ。",image18!)
                                        case 225:
                                                return ("もう一回頑張ったら？",image23!)
                                        case 226:
                                                return ("本当にやめるの？",image26!)
                                        case 227:
                                                return ("それで納得できるの？",image25!)
                                        case 228:
                                                return ("最後までやりとげる\(name)見たかった...。",image9!)
                                        case 229:
                                                return ("お疲れ様。",image22!)
                                        case 230:
                                                return ("\(name)の好きにしたら良いと思うよ。",image20!)
                                        case 231:
                                                return ("それで納得できるの？",image24!)
                                        case 232:
                                                return ("やめることは\(name)の自由だけどね...。",image26!)
                                        case 233:
                                                return( "そうやっていつも逃げてばかりなんだから。",image24!)
                                        case 234:
                                                return ("\(name)のバカ！",image22!)
                                        case 235:
                                                return ("最低！",image27!)
                                        case 236:
                                                return( "嫌い！",image28!)
                                        case 237:
                                                return ("近寄らないで。",image18!)
                                        case 238:
                                                return ("…。",image1!)
                                        case 239:
                                                return ("バイバイ！",image29!)
                                        case 240:
                                                return ("今日はゆっくりしてね。",image15!)
                                                
                                        case 241:
                                                return ("気にしない気にしない。",image24!)
                                        case 242:
                                                return ("そんな時だってあるよ！",image17!)
                                        case 243:
                                                return ("\(name)もさぼることあるんだね。",image2!)
                                        case 244:
                                                return( "疲れていたんだよ。だから大丈夫。",image8!)
                                        case 245:
                                                return ("明日やればいいさー！",image6!)
                                        case 246:
                                                return ("誰だってできない時はあるよね。",image23!)
                                        case 247:
                                                return ("まだまだ全然大丈夫。明日取り戻そ！",image15!)
                                        case 248:
                                                return ("疲れちゃった？そんな日もあっていいいと思うよ。",image11!)
                                        case 249:
                                                return( "私は信じてるから諦めないでね。",image7!)
                                        case 250:
                                                return ("\(name)なら絶対やりとげられるよ。",image24!)
                                        case 251:
                                                return ("頑張って5分だけやってみると意外とそこからやり続けちゃうよ。",image14!)
                                        case 252:
                                                return ("どんまい。そんな日もあるよ。",image26!)
                                        case 253:
                                                return ("今日できなかったことよりも、明日再開することが大事だよ。",image12!)
                                        case 254:
                                                return ("人間なんだからたまにはさぼらなくっちゃ！",image17!)
                                        case 255:
                                                return ("毎日続けるって難しいよね、分かるよ。",image23!)
                                                
                                        case 256:
                                                return( "さてはまたさぼったな。",image3!)
                                        case 257:
                                                return ("息抜きも大事だから気にしないでね。",image18!)
                                        case 258:
                                                return ("フレーフレー\(name)！",image6!)
                                        case 259:
                                                return ("まだまだこれからだよ、ファイト！",image8!)
                                        case 260:
                                                return ("目標を小刻みに決めると達成しやすいよ。",image14!)
                                        case 261:
                                                return ("まだまだだよ、挽回しよ。",image26!)
                                        case 262:
                                                return ("今が踏ん張り時だから一緒に頑張ろ。",image24!)
                                        case 263:
                                                return ("少しでも頑張れたなら「達成できた」って押してもいいと思うよ。",image16!)
                                        case 264:
                                                return ("今日は疲れちゃったね。おやすみなさい。",image18!)
                                        case 265:
                                                return ("達成できた\(name)の顔が見たいから明日は頑張ってね。",image8!)
                                        case 266:
                                                return ("サボったことがない人間なんて絶対いないから大丈夫だよ。",image10!)
                                        case 267:
                                                return ("youtube見てたんでしょ？",image3!)
                                        case 268:
                                                return ("毎日続けるって意外と難しいよね。でも\(name)はできるよ。",image12!)
                                        case 269:
                                                return ("ちょっとサボりぐせでてきたぞー、ファイトだよ！",image6!)
                                        case 270:
                                                return ("急用が入った時とかは「本日はお休み」を押してくれていいからね。",image9!)
                                        case 271:
                                                return ("絶対、絶対諦めちゃダメだから！",image24!)
                                        case 272:
                                                return ("\(name)ができなかった時は私も辛いんだよ。",image23!)
                                        case 273:
                                                return ("そんな日もあるさー！。今日のことは忘れて。",image18!)
                                        case 274:
                                                return("大丈夫？最近辛くない？",image25!)
                                        case 275:
                                                return ("まだあれだよね、想定内の範囲だよね？",image14!)
                                        case 276:
                                                return ("結果も大事だけど、今は過程が大事だよ！ファイト！",image7!)
                                        case 277:
                                                return ("次サボったら、罰としてジュースおごってもらうよ。",image22!)
                                        case 278:
                                                return ("ジュースごちそうさまです（笑）",image21!)
                                        case 279:
                                                return ("次は何奢ってもらおうかな？...冗談だよ。",image13!)
                                        case 280:
                                                return ("努力は楽しんだ方が勝ちだよ。ほら笑って。 ",image8!)
                                        case 281:
                                                return ("明日は達成しようね。",image26!)
                                        case 282:
                                                return ("ちょっと〜。２日に１回はさぼってるよ。気合いを入れ直して！",image20!)
                                        case 283:
                                                return ("大分ペースダウンしてない？大丈夫？",image22!)
                                        case 284:
                                                return ("大丈夫！全てが計画通りにいく人なんていないと思うよ。",image16!)
                                        case 285:
                                                return ("やる気スイッチ消えちゃったの？",image3!)
                                                
                                        case 286:
                                                return ("辛い時は音楽とか聞くといいよ！",image15!)
                                        case 287:
                                                return ("諦めてないよね？諦めるなんて絶対嫌だからね。",image9!)
                                        case 288:
                                                return ("ファイト！始めた時の\(name)の目は本気だったよ、もう一回がんばろ。",image10!)
                                        case 289:
                                                return ("もう辛いの？",image26!)
                                        case 290:
                                                return ("もしかしてやめようとしてる？",image25!)
                                        case 291:
                                                return ("根性よ！\(name)根性！",image27!)
                                        case 292:
                                                return ("もう一回頑張ったら？",image23!)
                                        case 293:
                                                return ("本当に辞めるの？",image26!)
                                        case 294:
                                                return ("それで納得できるの？",image24!)
                                        case 295:
                                                return ("最後までやりとげる\(name)見たかった...。",image9!)
                                        case 296:
                                                return( "そうやっていつも逃げてばかりなんだから。",image24!)
                                        case 297:
                                                return ("\(name)のバカ！",image22!)
                                        case 298:
                                                return ("最低！",image27!)
                                        case 299:
                                                return ("嫌い！",image28!)
                                        case 300:
                                                return ("近寄らないで。",image29!)
                                        case 301:
                                                return ("...。",image1!)
                                           case 302:
                                                return ("バイバイ！",image29!)
                        
                                        case 303:
                                                return ("よく今までサボらなかったね。尊敬します",image2!)
                                                
                                        case 304:
                                                return ("あわてない、あわてない。",image2!)
                                        case 305:
                                                return ("一休み、一休み。",image4!)
                                        case 306:
                                                return ("\(name)もさぼることあるんだね。",image3!)
                                        case 307:
                                                return( "疲れていたんだよ。だから大丈夫。",image8!)
                                        case 308:
                                                return ("明日やればいいさー！",image6!)
                                        case 309:
                                                return ("誰だってできない時はあるよね。",image23!)
                                        case 310:
                                                return ( "まだまだ全然大丈夫。明日取り戻そ！",image15!)
                                        case 311:
                                                return ("疲れちゃった？そんな日もあっていいいと思うよ。",image11!)
                                        case 312:
                                                return ("順調だね！全然問題ないよ。",image18!)
                                        case 313:
                                                return ("たまにはサボらないと壊れちゃうよ",image14!)
                                        case 314:
                                                return ("こんなに頑張っているんだから少しくらい気にしないで。",image10!)
                                        case 315:
                                                return ("どんまい。そんな日もあるよ。",image26!)
                                        case 316:
                                                return ("今日できなかったことよりも、明日再開することが大事だよ。" ,image12!)
                                        case 317:
                                                return ("人間なんだからたまにはさぼらなくっちゃ。",image17!)
                                        case 318:
                                                return ("たまにはサボりたくなっちゃうよね。明日頑張ろ！",image8!)
                                                
                                        case 319:
                                                return ("さてはまたさぼったな？",image3!)
                                        case 320:
                                                return( "息抜きも大事だから気にしないでね。",image18!)
                                        case 321:
                                                return ("フレーフレー\(name)！",image6!)
                                        case 322:
                                                return ("まだまだこれからだよ、ファイト！",image8!)
                                        case 323:
                                                return ("目標を小刻みに決めると達成しやすいよ。",image14!)
                                        case 324:
                                                return ("まだまだだよ、挽回しよ。",image26!)
                                        case 325:
                                                return ("今が踏ん張り時だから一緒に頑張ろ。",image2!)
                                        case 326:
                                                return ("少しでも頑張れたなら「達成できた」って押してもいいと思うよ。",image24!)
                                        case 327:
                                                return ("今日は疲れちゃったね。おやすみなさい。",image18!)
                                        case 328:
                                                return ("達成できた\(name)の顔が見たいから明日は頑張ってね。",image8!)
                                        case 329:
                                                return ("サボったことがない人間なんて絶対いないから大丈夫だよ。",image10!)
                                        case 330:
                                                return ("youtube見てたんでしょ？",image3!)
                                        case 331:
                                                return ("毎日続けるって意外と難しいよね。でも\(name)はできるよ。",image12!)
                                        case 332:
                                                return ("ちょっとサボりぐせ出てきたぞー、ファイトだよ。",image6!)
                                        case 333:
                                                return ("急用が入った時とかは「本日はお休み」を押してくれていいからね。",image9!)
                                        case 334:
                                                return ("絶対、絶対諦めちゃダメだから。", image24!)
                                        case 335:
                                                return ("\(name)ができなかった時は私も辛いんだよ。",image23!)
                                        case 336:
                                                return ("そんな日もあるさー！。今日のことは忘れて。",image18!)
                                        case 337:
                                                return ("毎日続けるなんて辛いから、たまにはさぼらないと笑",image17!)
                                        case 338:
                                                return( "まだあれだよね、想定内の範囲だよね？",image14!)
                                        case 339:
                                                return ("結果も大事だけど、今は過程が大事だよ！ファイト！",image7!)
                                        case 340:
                                                return( "次サボったら、罰としてジュースおごってもらうよ。",image22!)
                                        case 341:
                                                return( "ジュースごちそうさまです（笑）",image21!)
                                        case 342:
                                                return ("次は何奢ってもらおうかな？...冗談だよ。",image13!)
                                        case 343:
                                                return ("努力は楽しんだ方が勝ちだよ。ほら笑って。 ",image8!)
                                        case 344:
                                                return ("明日は達成しようね。",image26!)
                                        case 345:
                                                return ("ちょっと〜。２日に１回はさぼってるよ。気合いを入れ直して！",image20!)
                                        case 346:
                                                return ("大分ペースダウンしてない？大丈夫？",image22!)
                                        case 347:
                                                return ("大丈夫！全てが計画通りにいく人なんていないと思うよ。",image16!)
                                        case 348:
                                                 return ("やる気スイッチ消えちゃったの？",image3!)
                                                
                                        case 349:
                                                return ("辛い時は音楽とか聞くといいよ！",image15!)
                                        case 350:
                                                return ("私は信じてるから諦めないでね。",image10!)
                                        case 351:
                                                return ("\(name)なら絶対やりとげられるよ。",image17!)
                                        case 352:
                                                return ("50日目のさぼりで〜す。",image50a!)
                                        case 353:
                                                return ("初心に戻って頑張ろうよ。",image1!)
                                        case 354:
                                                return ("せっかく３ヶ月以上頑張ったんだから正念場だよ。",image24!)
                                        case 355:
                                                return ("\(name)は努力がしたくてたまらなくなーる、おまじないだよ。",image3!)
                                        case 356:
                                                return ("まだ諦めてないよね？",image9!)
                                        case 357:
                                                return ("\(name)の夢絶対叶えてね。",image10!)
                                        case 358:
                                                return ("最近頑張りすぎて疲れちゃったね。明日がんばろ。",image16!)
                                                
                                        case 359:
                                                return ("努力する前のルーティンを見つけると、スッと行動に移せるみたいだよ。",image18!)
                                        case 360:
                                                return ("分かったよ。気を取り直して明日だね。",image8!)
                                        case 361:
                                                return ("SNSばかり見てちゃだめだよ。",image3!)
                                        case 362:
                                                return ("辛いのは分かるけど一緒に頑張ろう。",image25!)
                                        case 363:
                                                return ("サボりぐせつけちゃダメだよ。",image26!)
                                        case 364:
                                                return ("頑張ってだしんよー！えへ。",image6!)
                                        case 365:
                                                return ("ここで諦めたら絶対にもったいないよ。",image23!)
                                        case 366:
                                                return("ファイトだよ！本当にファイト！",image24!)
                                        case 367:
                                                return ("自分に負けちゃダメだよ",image10!)
                                        case 368:
                                                return ("明日はやるんだよ！あ・し・た・は！",image22!)
                                        case 369:
                                                return ("\(effort)をする前にストレッチをすると良いかも。",image6!)
                                        case 370:
                                                return ("やめたいって思うのはみんなあるけど、そこでやめないことで成長できると思うよ。",image16!)
                                        case 371:
                                                return ("１日のノルマを少なくして、毎日達成できた実感を得る作戦にしてもいいかも。",image11!)
                                        case 372:
                                                return ("こんなところで止まっちゃダメだよ。突き抜けて。",image24!)
                                        case 373:
                                                return ("辛い時は息抜きも大事だよ。",image4!)
                                        case 374:
                                                return ("大丈夫？相談にのろうか？",image9!)
                                        case 375:
                                                return ("辛いのは分かるよ。でもここまできたんだからラストスパート頑張ろ！",image23!)
                                        case 376:
                                                return ("絶対に最後までやりとげよう。諦めちゃダメだよ。",image26!)
                                        case 377:
                                                return( "気にしないで。リセットして次回は絶対やろう。",image10!)
                                        case 378:
                                                return ("ファイトファイト！",image6!)
                                        case 379:
                                                return ("\(name)なら絶対にできるよ！",image24!)
                                        case 380:
                                                return ("目標を達成した時の喜びを想像して...やりたくなってきた？",image7!)
                                        case 381:
                                                return ("ここまできたら月に変わって諦めさせないよ。",image17!)
                                        case 382:
                                                return ("あとちょっとだから！負けないで。",image25!)
                                        case 383:
                                                return (" ここからは自分との勝負だよ",image9!)
                                        case 384:
                                                return ("少しでも頑張れたなら「達成できたボタン」を押すのもいいと思うよ。",image11!)
                                        case 385:
                                                return( "辛くない？大丈夫？",image12!)
                                        case 386:
                                                return ("あとちょっとじゃん！正念場だよ。",image23!)
                                        case 387:
                                                return ("\(name)なら絶対いけるーーーーーーーーー！！！！",image24!)
                                        case 388:
                                                return ("私が言うんだから絶対いけるよ！",image22!)
                                        case 389:
                                                return ("\(name)は諦めないって私信じてるから。",image18!)
                                        case 390:
                                                return( "諦めてないよね？諦めるなんて絶対嫌だからね。",image9!)
                                        case 391:
                                                return ("ファイト！\(effort)始めた時の\(name)の目は本気だったよ、もう一回がんばろ。",image10!)
                                        case 392:
                                                return ("やっぱり...辛いの？",image26!)
                                        case 393:
                                                return ("もしかしてやめようとしてる？",image25!)
                                        case 394:
                                                return( "根性よ！\(name)根性！",image27!)
                                        case 395:
                                                return ("もう一回頑張ったら？",image23!)
                                        case 396:
                                                return ("本当に辞めるの？",image26!)
                                        case 397:
                                                return ("それで納得できるの？",image24!)
                                        case 398:
                                                return ("最後までやりとげる\(name)見たかった...。",image9!)
                                        case 399:
                                                return ("そうやっていつも逃げてばかりなんだから",image24!)
                                        case 400:
                                                return ("\(name)のバカ！",image22!)
                                        case 401:
                                                return ("最低！",image27!)
                                        case 402:
                                                return ("嫌い！",image28!)
                                        case 403:
                                                return ("近寄らないで！",image29!)
                                        case 404:
                                                return ("...。",image1!)
                                        case 405:
                                                return ("バイバイ！",image29!)
                                        case 406:
                                                return("バイバイ",image9!)
                case 407:
                        return ("あらかじめお休みの日を決めておくことは全然悪いことじゃないよ。",image10!)
                        
                case 408:
                        return ("体力回復したー？",image15!)
                case 409:
                        return ("お休みの日は何してるの？",image11!)
                case 410:
                        return ("やっぱりお休みの日は外で体動かしたいよねー。",image6!)
                        
                case 411:
                        return ("続けるにはメリハリが大事だよ。だから今日は必要なお休み！",image16!)
                case 412:
                        return ("\(effort)が趣味になると最強だけど、中々難しいよね。",image14!)
                case 413:
                        return ("今は超回復期間だね。また明日がんばろー！",image17!)
                case 414:
                        return ("お休みの日も中々外出できないから辛いよね。",image9!)
                case 415:
                        return ("\(name)は好きなyoutubeとかあるの？",image11!)
                        
                case 416:
                        return ("クラスメートの噂なんて気にしちゃダメだからね。",image8!)
                case 417:
                        return ("\(name)の悪口？う〜ん。私は聞いたことないよ。",image13!)
                case 418:
                        return ("急用でできなかった時はいいけど、自分の意思に負けて\(effort)できなかった時は、「本日はお休み」押したらダメだからね！",image22!)
                case 419:
                        return ("詰め込みすぎるより、適度なお休みがあった方が絶対に長続きすると思うから安心して休んで。",image1!)
                case 420:
                        return ("今日はお休み？私が代わりにやってあげるよー",image6!)
                        
                case 421:
                        return ("あわてない、あわてない。一休み、一休み。",image3!)
                case 422:
                        return ("私おはぎが大好きなんだよねー。おはぎ食べたら明日も頑張れる笑",image17!)
                case 423:
                        return ("\(name)はなんで\(effort)をやろうと思ったの？？",image7!)
                case 424:
                        return ("\(name)は朝派？夜派？私は断然朝だなー。",image8!)
                case 425:
                        return ("量より質っていうけど、ある程度の量を確保しないと質って保てないよね？",image14!)
                        
                case 426:
                        return ("休みだ！休みだー！イエーイ！",image6!)
                case 427:
                        return ("自粛ムードだからこそ\(effort)頑張って！",image18!)
                        
                case 428:
                        return("",image1!)
              
                default:
                        return ("",image17!)
                
                
                }
                
        
                
                
}


}
