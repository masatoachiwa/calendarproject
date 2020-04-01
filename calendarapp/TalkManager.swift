//
//  TalkManager.swift
//  calendarapp
//
//  Created by アプリ開発 on 2019/12/17.
//  Copyright © 2019 Masato.achiwa. All rights reserved.
//

import UIKit

class TalkManager {
        

       
        var badPoint = 0{
                willSet {
                        UserDefaults.standard.set(newValue, forKey: "badpoint") //新しい値をnewValueに保存
                        UserDefaults.standard.synchronize()
                }
        }
        
        
        var point = 0 {
                willSet {
                        UserDefaults.standard.set(newValue, forKey: "goodpoint") //新しい値をnewValueに保存
                        UserDefaults.standard.synchronize()
                }
        }
        
        var currentTotalPoint: Int {
                get{
                        return  UserDefaults.standard.integer(forKey: "goodpoint")
                }
        }
        var currentTotalbadPoint: Int {
                get{
                        return  UserDefaults.standard.integer(forKey: "badpoint")
                }
        }
        
        var lovePoint: Double = 0 {
                willSet {
                        UserDefaults.standard.set(newValue, forKey: "lovePoint") //新しい値をnewValueに保存
                        UserDefaults.standard.synchronize()
                }
        }
        var currentTotallovePoint: Double {
                get{
                        return  UserDefaults.standard.double(forKey: "lovePoint")
                }
        }
        

        var currentType: Type {
                get{
                        guard let type = Type(rawValue: UserDefaults.standard.integer(forKey: "type")) else {  //enum TypeからKey"type"に保存された新しい値rawValueがあったらtypeに代入して返す。
                                //デフォルトはgoodType
                                return Type.good
                        }
                        return type
                }
                
                set {
                      //  UserDefaults.standard.set(newValue, forKey: "type")
                       
                          UserDefaults.standard.set(newValue.rawValue, forKey: "type")
                }
        }
   
      

     
        
        var dayArray : [String] =  (UserDefaults.standard.array(forKey: {"dayArray"}())as? [String] ?? [""])
        var baddayArray : [String] =  (UserDefaults.standard.array(forKey: {"baddayArray"}())as? [String] ?? [""])
        var restdayArray : [String] =  (UserDefaults.standard.array(forKey: {"restdayArray"}())as? [String] ?? [""])
         var alldayArray : [String] =  (UserDefaults.standard.array(forKey: {"restdayArray"}())as? [String] ?? [""])
        
        
        func date(abcd:String){ //yymmddの追加と値の保存
          
               dayArray.append(abcd)
                print(dayArray)
                
                let defaults = UserDefaults.standard
               defaults.set(dayArray, forKey: "dayArray")
                

        }
        func badDate(abcd:String){ //yymmddの追加と値の保存
               
                baddayArray.append(abcd)
                
                let defaults = UserDefaults.standard
                defaults.set(baddayArray, forKey: "baddayArray")
                
               
        }
        func restDate(abcd:String){ //yymmddの追加と値の保存
                
              restdayArray.append(abcd)
                
                let defaults = UserDefaults.standard
                defaults.set(restdayArray, forKey: "restdayArray")
                
        }
        
        func allDate(abcd:String){ //yymmddの追加と値の保存
                
                alldayArray.append(abcd)
                
                let defaults = UserDefaults.standard
                defaults.set(alldayArray, forKey: "alldayArray")
        

        }
        
        
        
        
        func remove(){
                let defaults = UserDefaults.standard
                dayArray.removeAll() //配列空にする
                defaults.set(dayArray, forKey: "dayArray")
                baddayArray.removeAll() //配列空にする
                defaults.set(baddayArray, forKey: "baddayArray")
                restdayArray.removeAll() //配列空にする
                defaults.set(restdayArray, forKey: "restdayArray")
                
                alldayArray.removeAll()
                 defaults.set(alldayArray, forKey: "alldayArray")
        }
        

        func resetPoint() {
                point = 0
                badPoint = 0
                
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
        
        let name = UserDefaults.standard.string(forKey: "name")
        let effort = UserDefaults.standard.string(forKey: "effort")
        
        func numberOfLabel() -> (String, UIImage,Int) {
                switch currentTotalPoint {
                case 0:
                        return ("聞いたよー。\(effort!)始めたんだってね？何日続くんだろうね？（笑",image1!, 0)
                case 1:
                return ("早速\(effort!)やったんだ。",image2!,1)
                case 2:
                        return ("やるじゃん！絶対やめたと思った。",image14!,2)
                case 3:
                        return ("3日続いたね。エライ！",image6! ,3)
                case 4:
                        return ("そろそろ飽きたころでしょ？",image3!,4)
                case 5:
                        return ("最近雨が多いのは\(name!)が珍しく頑張ってるから？",image18!,5)
                case 6:
                        return( "\(effort!)続いているみたいだね。頑張って。", image8!,6)
                case 7:
                       return( "一週間もったね。応援してるよ。",image10!,7)
                case 8:
                        return ("今日も\(effort!)してたんだね。お疲れ様。",image15!,8)
               case 9:
                        return ("\(name!)お疲れ様。はい、ジュース。",image4!,9)
                case 10:
                       return ("10日目達成だね。ちょっと見直したな。",image10a!,10)
               case 11:
                       return ("ここまできたら諦めたらだめだよ。",image8!,11)
               case 12:
                        return ("最近頑張ってるね。感心、感心（笑）",image18!,12)
               case 13:
                        return ("頑張るのもいいけど、たまには息抜きも必要だよ。",image10!,13)
                case 14:
                        return ("二週間経ったね。ちょっと尊敬するかも。", image6!,14)
                case 15:
                        return ("頑張って半年は続けることね！",image8!,15)
               case 16:
                        return ("私も\(effort!)やろうかなー？",image7!,16)
                case 17:
                        return ("あーごめん笑。結局\(effort!)やってない。でもね、私は小さい頃からピアノずっと続けれてるからいいの。",image18!,17)
                case 18:
                        return ("お疲れ様。今日も飽きずに\(effort!)してるね。",image17!,18)
                case 19:
                        return ("最近\(name!)が頑張っても雨降らなくなったね。",image1!,19)
                case 20:
                        return( "２０日達成したよー。へい、へい。",image20a!,20)
                case 21:
                        return ("もうすぐ１ヶ月だねー。しみじみだね。",image7!,21)
                case 22:
                        return ("\(name!)が頑張ってると、なんだか私も頑張らなきゃって思うよ。",image8!,22)
                case 23:
                        return ("焦らずに行こうね。急がば回れだよ。",image12!,23)
                case 24:
                        return ("さっき友達に\(name!)のこと話したら褒めてたよ。",image18!,24)
                case 25:
                       return ("今日も頑張ったんだね。飛ばしすぎちゃだめだよ。",image10!,25)
                case 26:
                        return ("疲れ溜まってない？大丈夫？",image11!,26)
                case 27:
                        return ("お疲れ、昨日は何時まで\(effort!)してたの？",image1!,27)
                case 28:
                        return ("\(name!)の努力が早く実るといいね",image8!,28)
                case 29:
                        return ("えへへ。安定の努力家ですね！",image15!,29)
                case 30:
                        return ("30日経ったよ！これから苦しくなるかもしれないけど応援してるから！",image30a!,30)
                case 31:
                        return ("まだまだこれからだよ！",image10!,31)
                case 32:
                        return ("やっぱり努力してる人って素敵だな。",image5!,32)
                case 33:
                        return ("もうすぐ定期試験だね。二足のわらじも大変だけど頑張ろ。",image6!,33)
                case 34:
                        return ("やっぱり両立って難しいよね。できる\(name!)のこと尊敬するなー。",image15!,34)
                case 35:
                        return("昨日は疲れて全然勉強できなかったー。\(name!)と違って私だめだなー。",image16!,35)
                case 36:
                        return ("テストできたの？\(effort!)しながらよく頑張ったね",image2!,36)
                case 37:
                        return ("テスト終わったね。また\(effort!)頑張ろー！",image6!,37)
                case 38:
                        return ("\(name!)ってさあ、\(effort!)始める前よりもテストの点あがってない？",image11!,38)
                case 39:
                        return ("一つのことを努力する習慣がつくと、他のこともできるようになるのかな？",image14!,39)
                case 40:
                        return ("クラスメートも\(name!)が変わったことに気がつきはじめたかもね。",image18!,40)
                case 41:
                        return ("私は最初から\(name!)はやればできるって知ってたよ。",image10!,41)
                case 42:
                        return ("お疲れ様、\(name!)の集中力を分けて欲しいよ。",image20!,42)
                case 43:
                        return ("たまには休息もとらないとダメだよ。",image9!,43)
                case 44:
                        return ("\(name!)は彼女いないの？",image3!,44)
                case 45:
                        return ("いないんだー。ごめん、変なこときいて。",image15!,45)
                case 46:
                        return ("今は\(effort!)を頑張ってるから彼女なんていらないよね。",image12!,46)
                case 47:
                        return ("あっ、もうすぐ５０日だよ。ファイトー！",image6!,47)
                case 48:
                        return ("お疲れ！ちゃんと息抜きしてる？これ飲んで",image4!,48)
                case 49:
                        return ("感心、感心",image8!,49)
                case 50:
                        return ("５０日ー！おめでとー！",image50a!,50)
                case 51:
                        return ("とりあえず半年は頑張って！私にできることは協力するから。",image8!,51)
                case 52:
                        return ("後１３０日！道のりは長いよ！",image22!,52)
                case 53:
                        return ("\(name!)なら絶対できるよ！",image24!,53)
                case 54:
                        return ("もう\(effort!)しないと気持ち悪いんじゃない？",image16!,54)
                case 55:
                        return ("不思議だね。私も\(name!)が\(effort!)してないって聞くと、何かあったの？って思うようになっちゃった。",image2!,55)
                case 56:
                        return ("なんだか\(name!)が頑張ってる姿見ると私も嬉しくなっちゃう。",image7!,56)
                case 57:
                        return ("今日も頑張ったね！私もピアノの練習頑張らなくっちゃ",image15!,57)
                case 58:
                        return ("今度私にも\(effort!)教えて欲しいなー。",image12!,58)
                case 59:
                        return ("やりすぎは体に毒だから、飛ばしすぎないでね。",image9!,59)
                case 60:
                        return ("６０日できたね。３分の１終わったよ！",image60a!,60)
                case 61:
                        return ("お疲れ！ねえ、\(name!)はなんで\(effort!)を始めたの？",image3!,61)
                case 62:
                        return ("みんなそれぞれいろんな理由があるけど、頑張っている人はかっこいいと思うよ。",image5!,62)
                case 63:
                        return ("だから、\(name!)も今かっこいいよ。",image7!,63)
                case 64:
                        return ("照れてるのー？",image3!,64)
                case 65:
                        return ("その表情マルですね。",image3!,65)
                case 66:
                        return ("今これ流行ってるんだよ。\(name!)は毎日頑張ってるから知らないかもね。",image17!,66)
                case 67:
                        return ("お疲れ様。良かったら一緒に帰ろ。",image8!,67)
                case 68:
                        return ("私ね、最近\(name!)の影響なのかピアノの練習が前より楽しいんだ。",image7!,68)
                case 69:
                        return ("類は友を呼ぶっていうからかな、\(name!)見てると私も頑張らなくちゃって思うの。",image18!,69)
                case 70:
                        return ("\(effort!)を続けて思うような結果がでなかったらどうしようとか、そんなことを考えたりはしない？",image25!,70)
                case 71:
                        return ("どうせうまくいかないから、頑張っても意味ないんじゃないか、とかね。",image27!,71)
                case 72:
                        return ("私がそうだったらか、\(name!)は同じや悩み抱えていないか心配だったから。",image9!,72)
                case 73:
                        return ("やっぱりあるんだね。でもここまで続けてきた\(name!)ならきっとうまくいくよ。",image16!,73)
                case 74:
                        return ("それに私が応援しているんだから絶対うまくいくよ。",image17!,74)
                case 75:
                        return ("あっーー！今日で\(effort!)始めてから達成できた日が75日経ってる。70日目伝えるの忘れてた。",image8!,75)
                case 76:
                        return ("正しくは76日目だよ",image70a!,76)
                case 77:
                        return ("私が\(name!)の努力した日数をちゃんと数えてるからね！",image5!,77)
                case 78:
                        return ("言わなくても分かるよ、お疲れ様。",image15!,78)
                case 79:
                        return ("いつも以上に頑張らなくてもいいからね！いつも通りで。",image14!,79)
                case 80:
                       return ("８０日経ったよー。いえーい！",image80a!,80)
                case 81:
                        return ("\(name!)は結果と過程どっちが大切派？",image11!,81)
                case 82:
                        return ("私は過程派だな。甘いかな？",image1!,82)
                case 83:
                        return ("努力しても結果が出ないことはあっても、結果を出す人に努力してない人はいないと思うんだ。",image8!,83)
                case 84:
                        return ("誰かの受け売りだけどね。私もそう思うな",image18!,84)
                case 85:
                        return ("あせらずに頑張ってね。必ず成功するって信じてるから。",image12!,85)
                case 86:
                        return ("頑張れ！頑張れ！\(name!)",image6!,86)
                case 87:
                        return ("毎日頑張っていることって、辛いことじゃなくて楽しいことなんだって**見てたら思うようになったな。",image15!,87)
                case 88:
                        return ("眠たい時とかは、無理して頑張るんじゃなくてちょっと仮眠してからするといいよ。",image18!,88)
                case 89:
                        return ("私はそのまま朝まで寝ちゃうから、向いてない人もるけど。",image20!,89)
                case 90:
                        return ("９０日経ったよー。半分行きました。残り９０日！",image90a!,90)
                case 91:
                        return ("今日もお疲れ。３ヶ月あっという間だったね。長かった？",image7!,91)
                case 92:
                        return ("折り返し地点を過ぎたって考えると残りはもうすぐだね。",image10!,92)
                case 93:
                        return ("なんだかやり終えた\(name!)を想像するとワクワクするね。",image5!,93)
                case 94:
                        return ("最後まで応援するからよろしくね。",image15!,94)
                case 95:
                        return ("お疲様、本当に\(name!)毎日が楽しそうで羨ましい。",image17!,95)
                case 96:
                        return ("クラスの友達も\(name!)の顔つきが変わった？！っていってたよ。",image2!,96)
                case 97:
                        return ("努力を楽しめる人って本当に素敵だと思うな。",image8!,97)
                case 98:
                        return ("そういう人は壁にぶち当たっても、それを突破するのが楽しんだろうな。",image10!,98)
               case 99:
                        return ("私はそんな\(name!)を見てるのが楽しいよ。",image1!,99)
                case 100:
                        return ("おめでとう！１００日目だよ。３桁いきましたね。",image100a!,100)
                case 101:
                        return ("もう続けることは苦にならないよね？",image12!,101)
                case 102:
                        return ("今日も１日お疲れ様です。",image4!,102)
                case 103:
                        return("私正直いうとね、一週間で辞めると思っていたんだよ。",image13!,103)
                case 104:
                        return ("これだけ続けていられるのは本当に＊＊が変わろうと決心しただよ。",image10!,104)
                case 105:
                        return ("それと少しは私のお陰もあるのかな？",image15!,105)
                case 106:
                        return ("嘘嘘、全部\(name!)の力だよ。私は応援してるだけですから。",image18!,106)
                case 107:
                        return ("これからも\(name!)のこと応援させてね。",image6!,107)
                case 108:
                        return( "何の得にもならないのにどうして応援してくれるのかって？",image11!,108)
                case 109:
                        return ("何だか楽しいんだよね。\(name!)の成長見てると。",image17!,109)
                case 110:
                        return ("１１０日経ったよ！あと７０日だよ。",image110a!,110)
                case 111:
                        return ("ねー聞いて。私ね、一回だけピアノの練習を辞めた時期があるんだ。",image25!,111)
                case 112:
                        return ("自分より年下で自分より後にピアノを始めたのに、自分よりピアノがうまいこがいてバカらしくなっちゃったの。",image26!,112)
                case 113:
                        return ("レッスンの日は休んだり、行っても練習してないからすぐにバレたんだ。",image14!,113)
                case 114:
                        return ("それで先生に辞めたいって言ったんだ。理由も正直に話した。",image13!,114)
                case 115:
                        return ("そしたら先生に「人と比べるんじゃなくて、昨日の自分を超えることを考えて」って言われたの。",image1!,115)
                case 116:
                        return ("先生は続けてこう言ったの。「人と比べるより、昨日の自分に勝つことができる子が伸びるの。",image1!,116)
                case 117:
                        return ("どんなに才能があっても、人と比べているだけで満足してたら絶対にどこかで止まるわ。",image1!,117)
                case 118:
                        return ("だから、自分に負けないで」って。それでもう一度やってみようと思ったんだ。",image1!,118)
                case 119:
                        return ("ごめんね。こんな話して、ちょっと嫉妬しちゃったんだ。毎日目標に向けて突っ走る〇〇を見て。",image16!,119)
                case 120:
                        return ("あっ、ごめん。今日で１２０日目だよ。いえーい！",image120a!,120)
                case 121:
                        return ("きっと\(name!)は\(effort!)の才能があるんだろうなー",image13!,121)
                case 122:
                        return ("もし私みたいに、辞めたい時期がきたら私に相談してくれると嬉しいな。",image12!,122)
                case 123:
                        return ("でもこれは、その…\(name!)のこといつか挫折するって疑っているわけじゃないからね。",image24!,123)
                case 124:
                        return ("絶対に成功するって分かってるから。ちょっとだけ私の気持ちも知って欲しかっただけ。",image23!,124)
                case 125:
                        return ("変なこと言ってごめんね。また明日からも頑張ろー！",image17!,125)
                case 126:
                        return ("お疲れ様。一緒に帰ろ。",image8!,126)
                case 127:
                        return ("いえい！相変わらず絶好調だね。",image6!,127)
                case 128:
                        return( "人生のターニングポイントはいつですか？ふふ。将来絶対聞かれるよ。",image18!,128)
                case 129:
                        return ("お疲れ様。ルーティン化されてきて、やらない日がほとんどなくなったね。",image15!,129)
                case 130:
                        return ("１３０日達成だよ！あと５０日。",image130a!,130)
                case 131:
                        return ("ここから先がファイトだよ！意外と前半頑張りすぎて後半しぼんできちゃう人もいるから。",image22!,131)
                case 132:
                        return ("お疲れ様。毎日頑張りすぎないように頑張ろうね笑",image10!,132)
                case 133:
                        return ("すごいよ\(name!)。本当にすごい。",image5!,133)
                case 134:
                        return ("お疲れ様。今日も頑張りすぎてない？",image13!,134)
                case 135:
                        return ("友達が\(name!)のこと最近かっこいいって言ってたよ。",image3!,135)
                case 136:
                        return ("えっ？私は\(name!)のことかっこいいと思わないのかって？",image11!,136)
                case 137:
                        return ("へへ。秘密です。",image15!,137)
                case 138:
                        return ("最後までやり遂げたらかっこいいかな？",image18!,138)
                case 139:
                        return ("もう心配無用だね。このままゴールまであと一息だよ",image6!,139)
                case 140:
                        return ("１４０日達成！！後４０日だよ。",image140a!,140)
                case 141:
                        return ("これならゴールを半年じゃなくて１年でもいけそうだね。伸ばす？",image13!,141)
                case 142:
                        return ("冗談だよ。半年の目標を終わらせてから次は考えよ。",image17!,142)
                case 143:
                        return ("ねー。\(name!)は好きな人とかいるの？",image3!,143)
                case 144:
                        return ("えっ。いいじゃん。聞いたって。",image10!,144)
                case 145:
                        return ("逆に私はどうかって？うーん。いるよ。",image3!,145)
                case 146:
                        return ("へへ、誰かは秘密。そのうち教えてあげてもいいけど、今は恥ずかしいな。",image12!,146)
                case 147:
                        return ("そのうちっていつかって？うーん。",image16!,147)
                case 148:
                        return ("目標の１８０日達成したらかな。",image15!,148)
                case 149:
                        return ("そういえば\(name!)が好きな人いるか聞いてない！",image24!,149)
                case 150:
                        return ("１５０日達成したよ。ラスト３０日！",image150a!,150)
               case 151:
                        return ("いよいよ１ヶ月切ったね。長かったような、短かったような。",image7!,151)
                case 152:
                        return ("今日もお疲れ様。風引かないようにゆっくりしてね。",image10!,152)
                case 153:
                        return ("お疲れ様、気を緩めずに行こうね。",image17!,153)
                case 154:
                        return ("季節もすっかり変わっちゃったけどまだまだ行くよ！",image6!,154)
                case 155:
                        return( "今日もお疲れ様！このセリフ何回ぐらい言ったんだろう？",image15!,155)
                case 156:
                        return ("あとちょっとでお疲れ様って言えなくなっちゃうの寂しいな。",image16!,156)
                case 157:
                        return ("最初は\(name!)のことバカにしてる人もいたけど、もうみんな応援してるよ。",image5!,157)
                case 158:
                        return ("私は最初からバカになんかしてないからね。",image8!,158)
                case 159:
                        return ("続かないとはちょっとだけ思ってたかも笑",image3!,159)
                case 160:
                        return ("１６０日達成。あと２０日。ゴールが見えてきたね。",image160a!,160)
                case 161:
                        return ("なんだか\(name!)か遠い存在の人になってきちゃったな。",image25!,161)
                case 162:
                        return ("最後までいっても応援し続けるからね。",image9!,162)
                case 163:
                        return ("すごいよ。もうゴールが近いのにどんどん集中力上がってきてるね。",image7!,163)
                case 164:
                        return ("今日もお疲れ様！最後の最後までこのまま駆け抜けて。",image6!,164)
                case 165:
                        return ("ここだけの話、\(name!)の努力する姿見てると私の方が励みになっているんだよ。",image12!,165)
                case 166:
                        return ("不思議だね。応援している私の方が力もらっちゃうなんて",image7!,166)
                case 167:
                        return( "\(name!)の頑張る姿見るたびに私も頑張ってたんだよ。褒めて。",image17!,167)
                case 168:
                        return ("自分より努力してる人に褒められると、嬉しいな。",image8!,168)
                case 169:
                        return( "そういえば覚えてる？ゴールになったら私の好きな人いう話？",image16!,169)
                case 170:
                        return ("１７０日達成！ラスト１０日だよーー！",image170a!,170)
                case 171:
                        return ("ラスト９日！体調崩さないようにね！",image6!,171)
                case 172:
                        return ("ラスト８日！\(name!)の応援できて本当によかった。",image7!,172)
                case 173:
                        return ("ラスト７日！もう少しだよ。",image8!,173)
                case 174:
                        return ("ラスト６日！あー！楽しかった時間が終わっちゃうね。",image12!,174)
                case 175:
                     return ("ラスト５日！お疲れ様。良かったら一緒に帰ろ？",image15!,175)
                case 176:
                       return ("ラスト４日！お疲れ様。本当に\(name!)のこと尊敬してるよ。",image18!,176)
                case 177:
                       return ("ラスト３日！いよいよだね。なんだか分かんないけど泣けてきた。",image23!,177)
               case 178:
                       return ("ラスト２日！ヘイ、ヘイ^^",image6!,178)
               case 179:
                       return ("ラスト１日！本当にお疲れ様！私に素敵な体験さえてくれてありがとう。",image17!,179)
                case 180:
                       return ("おめでとう。\(name!)のことが大好きです。。",image19!,180)
                        
                default:
                        return ("最後まで一緒に頑張ってくれて本当にありがとうございます。これからは私がいなくても一人で努力できるよね？もちろん私は〇〇のこと応援し続けるよ",image17!,180)
                }
        }
        
        func  badOfLabel()->(String, UIImage){
                if currentTotalPoint <= 5 {
                        switch currentTotalbadPoint {
                                case 0 :  //エラーでる
                                return ("",image8!)
                                
                        case 1:
                                return ("もう諦めたの？",image3!)
                                
                        case 2:
                                return ("諦めるの早！",image22!)
                        case 3:
                                return ("ないわ〜",image20!)
                        case 4:
                                return ("くずですね",image28!)
                        case 5:
                                
                                return ("…",image1!)
                        default:
                                return ("バイバイ",image29!)
                        }
                }
                else if currentTotalPoint  > 5 && currentTotalPoint <= 20{
                        switch currentTotalbadPoint {
                        case 1:
                                return ("どんまい。そんな時もあるよ",image16!)
                                
                        case 2:
                                return ("気にしない気にしない",image24!)
                        case 3:
                                return ("体調悪いの〜?",image11!)
                        case 4:
                                return ("明日は頑張ろうね",image23!)
                        case 5:
                                return ("もしかして辞めようとしてる？",image25!)
                        case 6:
                                return ("まあ、そんなもんだと思ったよ。",image18!)
                        case 7:
                                return ("もう一回頑張ったら？",image11!)
                        case 8:
                                return ("本当に辞めるの？",image26!)
                        case 9:
                                return ("まあしょうがないよね",image14!)
                        case 10:
                                return ("幻滅です",image20!)
                        case 11:
                                return ("幻滅だわ",image22!)
                        case 12:
                                return ("最低",image26!)
                        case 13:
                                return ("嫌い",image27!)
                        case 14:
                                return ("近寄らないで",image28!)
                        case 15:
                                return ("…",image1!)
                                
                        default:
                                return ("バイバイ",image29!)
                        }
                        
                }else if currentTotalPoint  > 21 && currentTotalPoint <= 50{
                           switch currentTotalbadPoint {
                          
                           case 1:
                                return ("今日はゆっくりしてね",image15!)
                                
                           case 2:
                                return ("気にしない気にしない",image24!)
                           case 3:
                                return ("そんな時だってあるよ！",image17!)
                           case 4:
                                return ("\(name!)もさぼることあるんだね",image2!)
                           case 5:
                                return ("疲れていたんだよ。だから大丈夫",image8!)
                           case 6:
                                return ("明日やればいいさー！",image6!)
                           case 7:
                                return ("誰だってできない時はあるよね",image23!)
                           case 8:
                                return ("まだまだ全然大丈夫。明日取り戻そ！",image15!)
                           case 9:
                                return( "疲れちゃった？そんな日もあっていいいと思うよ",image11!)
                           case 10:
                                return ("私は信じてるから諦めないでね",image7!)
                           case 11:
                                return ("\(name!)なら絶対やり遂げられるよ。",image24!)
                           case 12:
                                return ("頑張って5分だけやってみると意外とそこからやり続けちゃうんだよ",image14!)
                           case 13:
                                return ("どんまい。そんな日もあるよ",image26!)
                           case 14:
                                return ("今日できなかったことよりも、明日は再開することが大事だよ",image12!)
                           case 15:
                                return( "大丈夫！全てが計画通りにいく人なんていないと思うよ",image1!)
                          case 16:
                                return ("諦めてないよね？諦めるなんて絶対嫌だからね",image9!)
                                
                           case 17:
                                return ("ちょっとペースダウンしてない？大丈夫？",image22!)
                           case 18:
                                return ("ファイト！始めた時の〇〇の目は本気だったよ、もう一回頑張ろ",image10!)
                           case 19:
                                return ("今日はたまたまだよね？",image23!)
                           case 20:
                                return ("もしかして辞めようとしてる？",image25!)
                           case 21:
                                return ("まあ、そんなもんだと思ったよ。",image18!)
                           case 22:
                                return ("もう一回頑張ったら？",image23!)
                           case 23:
                                return ("本当に辞めるの？",image26!)
                           case 24:
                                return ("それで納得できるの？",image25!)
                           case 25:
                                return ("最後までやりとげる〇〇見たかった...",image9!)
                           case 26:
                                return ("お疲れ様",image22!)
                           case 27:
                                return ("\(name!)の好きにしたら良いと思うよ",image20!)
                           case 28:
                                return ("それで納得できるの?",image24!)
                           case 29:
                                return ("辞めることは\(name!)の自由だけどね...",image26!)
                           case 30:
                                return( "そうやっていつも逃げてばかりなんだから",image24!)
                           case 31:
                                return ("\(name!)のバカ",image22!)
                           case 32:
                                return ("最低",image27!)
                           case 33:
                                return( "嫌い",image28!)
                           case 34:
                                return ("近寄らないで",image18!)
                           case 35:
                                return ("…",image1!)

                           default:
                return ("バイバイ",image29!)
                        
                        }
                }else if currentTotalPoint  > 51 && currentTotalPoint <= 100{
                        switch currentTotalbadPoint {
                                
                        case 1:
                                return ("今日はゆっくりしてね",image15!)
                                
                        case 2:
                                return ("気にしない気にしない",image24!)
                        case 3:
                                return ("そんな時だってあるよ！",image17!)
                        case 4:
                                return ("\(name!)もさぼることあるんだね",image2!)
                        case 5:
                                return( "疲れていたんだよ。だから大丈夫",image8!)
                        case 6:
                                return ("明日やればいいさー！",image6!)
                        case 7:
                                return ("誰だってできない時はあるよね",image23!)
                        case 8:
                                return ("まだまだ全然大丈夫。明日取り戻そ！",image15!)
                        case 9:
                                return ("疲れちゃった？そんな日もあっていいいと思うよ",image11!)
                        case 10:
                                return( "私は信じてるから諦めないでね",image7!)
                        case 11:
                                return ("\(name!)なら絶対やり遂げられるよ。",image24!)
                        case 12:
                                return ("頑張って5分だけやってみると意外とそこからやり続けちゃうよ",image14!)
                        case 13:
                                return ("どんまい。そんな日もあるよ",image26!)
                        case 14:
                                return ("今日できなかったことよりも、明日再開することが大事だよ",image12!)
                        case 15:
                                return ("人間なんだからたまにはさぼらなくっちゃw",image17!)
                        case 16:
                                return ("毎日続けるって難しいよね、分かるよ",image23!)
                                
                        case 17:
                                return( "さてはまたさぼったな",image3!)
                        case 18:
                                return ("息抜きも大事だから気にしないでね",image18!)
                        case 19:
                                return ("フレーフレー\(name!)！",image6!)
                        case 20:
                                return ("まだまだこれからだよ、ファイト",image8!)
                        case 21:
                                return ("目標を小刻みに決めると達成しやすいよ",image14!)
                        case 22:
                                return ("まだまだだよ、挽回しよ",image26!)
                        case 23:
                                return ("今が踏ん張り時だから一緒に頑張ろ",image24!)
                        case 24:
                                return ("少しでも頑張れたなら「達成できた」って押してもいいと思うよ",image16!)
                        case 25:
                                return ("今日は疲れちゃったね。おやすみなさい",image18!)
                        case 26:
                                return ("達成できた\(name!)の顔が見たいから明日は頑張ってね",image8!)
                        case 27:
                                return ("サボったことがない人間なんて絶対いないから大丈夫だよ",image10!)
                        case 28:
                                return ("youtube見てたんでしょ？",image3!)
                        case 29:
                                return ("毎日続けるって意外と難しいよね。でも○○はできるよ",image12!)
                        case 30:
                                return ("ちょっとサボりぐせでてきたぞー、ファイトだよ",image6!)
                        case 31:
                                return ("急用が入った時とかは「本日はお休み」を押してくれていいからね",image9!)
                        case 32:
                                return ("絶対、絶対諦めちゃダメだから",image24!)
                        case 33:
                                return ("\(name!)ができなかった時は私も辛いんだよ",image23!)
                        case 34:
                                return ("そんな日もあるさー！。今日のことは忘れて",image18!)
                        case 35:
                                return("大丈夫？最近辛くない？",image25!)
                        case 36:
                                return ("まだあれだよね、想定内の範囲だよね？",image14!)
                        case 37:
                                return ("結果も大事だけど、今は過程が大事だよ！ファイト！",image7!)
                        case 38:
                                return ("次サボったら、罰としてジュースおごってもらうよ",image22!)
                        case 39:
                                return ("ジュースごちそうさまです",image21!)
                        case 40:
                                return ("次は何奢ってもらおうかな？...冗談だよ",image13!)
                        case 41:
                                return ("努力は楽しんだ方が勝ちだよ。ほら笑って ",image8!)
                        case 42:
                                return ("明日は達成しようね",image26!)
                        case 43:
                                return ("ちょっと〜。２日に１回はさぼってるよ。気を入れ直して！",image20!)
                        case 44:
                                return ("大分ペースダウンしてない？大丈夫",image22!)
                        case 45:
                                return ("大丈夫！全てが計画通りにいく人なんていないと思うよ",image16!)
                        case 46:
                                return ("少しでも頑張れたなら達成できたって押してもいいと思うよ",image11!)
                                
                        case 47:
                                return ("辛い時は音楽とか聞くといいよ！",image15!)
                        case 48:
                                return ("諦めてないよね？諦めるなんて絶対嫌だからね",image9!)
                        case 49:
                                return ("ファイト！始めた時の\(name!)の目は本気だったよ、もう一回がんばろ",image10!)
                        case 50:
                                return ("もう辛いの？",image26!)
                        case 51:
                                return ("もしかして辞めようとしてる？",image25!)
                        case 52:
                                return ("根性よ！\(name!)根性！",image27!)
                        case 53:
                                return ("もう一回頑張ったら？",image23!)
                        case 54:
                                return ("本当に辞めるの？",image26!)
                        case 55:
                                return ("それで納得できるの？",image24!)
                        case 56:
                                return ("最後までやりとげる\(name!)見たかった...",image9!)
                        case 57:
                                return( "そうやっていつも逃げてばかりなんだから",image24!)
                        case 58:
                                return ("\(name!)のバカ",image22!)
                        case 59:
                                return ("最低",image27!)
                        case 60:
                                return ("嫌い",image28!)
                        case 61:
                                return ("近寄らないで",image29!)
                        case 62:
                                return ("...",image1!)
                      
                        default:
                                return ("バイバイ",image29!)
                        
                        
                        }
                        
                
        }else if currentTotalPoint  > 101 && currentTotalPoint <= 180{
        switch currentTotalbadPoint {
        
        case 1:
        return ("よく今までサボらなかったね。尊敬します",image2!)
        
        case 2:
        return ("気にしない気にしない",image2!)
        case 3:
        return ("そんな時だってあるよ！",image17!)
        case 4:
        return ("\(name!)もさぼることあるんだね。",image3!)
        case 5:
        return( "疲れていたんだよ。だから大丈夫。",image8!)
        case 6:
        return ("明日やればいいさー！",image6!)
        case 7:
        return ("誰だってできない時はあるよね。",image23!)
        case 8:
        return ( "まだまだ全然大丈夫。明日取り戻そ！",image15!)
        case 9:
        return ("疲れちゃった？そんな日もあっていいいと思うよ",image11!)
        case 10:
        return ("順調だね！全然問題ないよ。",image18!)
        case 11:
        return ("たまにはサボらないと壊れちゃうよ",image14!)
        case 12:
        return ("こんなに頑張っているんだから少しくらい気にしないで。",image10!)
        case 13:
        return ("どんまい。そんな日もあるよ。",image26!)
        case 14:
        return ("今日できなかったことよりも、明日再開することが大事だよ。" ,image12!)
        case 15:
        return ("人間なんだからたまにはさぼらなくっちゃ。",image17!)
        case 16:
        return ("たまにはサボりたくなっちゃうよね。明日頑張ろ！",image8!)
        
        case 17:
        return ("さてはまたさぼったな",image3!)
        case 18:
        return( "息抜きも大事だから気にしないでね。",image18!)
        case 19:
        return ("フレーフレー\(name!)！",image6!)
        case 20:
        return ("まだまだこれからだよ、ファイト。",image8!)
        case 21:
        return ("目標を小刻みに決めると達成しやすいよ。",image14!)
        case 22:
        return ("まだまだだよ、挽回しよ。",image26!)
        case 23:
        return ("今が踏ん張り時だから一緒に頑張ろ。",image2!)
        case 24:
        return ("少しでも頑張れたなら「達成できた」って押してもいいと思うよ。",image24!)
        case 25:
        return ("今日は疲れちゃったね。おやすみなさい。",image18!)
        case 26:
        return ("達成できた\(name!)の顔が見たいから明日は頑張ってね。",image8!)
        case 27:
        return ("サボったことがない人間なんて絶対いないから大丈夫だよ。",image10!)
        case 28:
        return ("youtube見てたんでしょ？",image3!)
        case 29:
        return ("毎日続けるって意外と難しいよね。でも○○はできるよ。",image12!)
        case 30:
        return ("ちょっとサボりぐせでてきたぞー、ファイトだよ。",image6!)
        case 31:
        return ("急用が入った時とかは「本日はお休み」を押してくれていいからね。",image9!)
        case 32:
        return ("絶対、絶対諦めちゃダメだから。", image24!)
        case 33:
        return ("\(name!)ができなかった時は私も辛いんだよ。",image23!)
        case 34:
        return ("そんな日もあるさー！。今日のことは忘れて。",image18!)
        case 35:
        return ("毎日続けるなんて辛いから、たまにはさぼらないと笑",image17!)
        case 36:
        return( "まだあれだよね、想定内の範囲だよね？",image14!)
        case 37:
        return ("結果も大事だけど、今は過程が大事だよ！ファイト！",image7!)
        case 38:
        return( "次サボったら、罰としてジュースおごってもらうよ。",image22!)
        case 39:
        return( "ジュースごちそうさまです。",image2!)
        case 40:
        return ("次は何奢ってもらおうかな？...冗談だよ。",image13!)
        case 41:
        return ("努力は楽しんだ方が勝ちだよ。ほら笑って ",image8!)
        case 42:
        return ("明日は達成しようね",image26!)
        case 43:
        return ("ちょっと〜。２日に１回はさぼってるよ。気を入れ直して！",image20!)
        case 44:
        return ("大分ペースダウンしてない？大丈夫？",image22!)
        case 45:
        return ("大丈夫！全てが計画通りにいく人なんていないと思うよ。",image16!)
        case 46:
        return ("少しでも頑張れたなら達成できたって押してもいいと思うよ。",image11!)
        
        case 47:
        return ("辛い時は音楽とか聞くといいよ！",image15!)
        case 48:
                return ("私は信じてるから諦めないでね。",image10!)
        case 49:
                return ("\(name!)なら絶対やり遂げられるよ。",image17!)
        case 50:
                return ("50日目のさぼりで〜す。",image50a!)
        case 51:
                return ("初心に戻って頑張ろうよ",image1!)
        case 52:
                return ("せっかく３ヶ月以上頑張ったんだから正念場だよ。",image24!)
        case 53:
                return ("\(name!)は努力がしたくてたまらなくなーる、おまじないだよ",image3!)
        case 54:
                return ("まだまだ諦めてないよね？",image9!)
        case 55:
                return ("\(name!)の夢絶対叶えてね。",image10!)
        case 56:
                return ("最近頑張りすぎて疲れちゃったね。明日がんばろ。",image16!)
                
        case 57:
                return ("努力する前のルーティンを見つけると、スッと行動に移せるみたいだよ。",image18!)
        case 58:
                return ("分かったよ。気を取り直して明日だね。",image8!)
        case 59:
                return ("SNSばかり見てちゃだめだよ",image3!)
        case 60:
                return ("辛いのは分かるけど一緒に頑張ろう",image25!)
        case 61:
                return ("サボりぐせつけちゃダメだよ",image26!)
        case 62:
                return ("頑張ってだしんよー！えへ。",image6!)
        case 63:
                return ("ここで諦めたら絶対にもったいないよ。",image23!)
        case 64:
                return("ファイトだよ！本当にファイト！",image24!)
        case 65:
                return ("自分に負けちゃダメだよ",image10!)
        case 66:
                return ("明日やるんだよ！あ・し・た！",image22!)
        case 67:
                return ("勉強をする前にストレッチをするとかも良いかも",image19!)
        case 68:
                return ("やめたいって思うのはみんなあるけど、そこでやめないことで成長できると思うよ。",image16!)
        case 69:
                return ("１日のノルマを少なくして、毎日達成できた実感を得る作戦にしてもいいかも。",image11!)
        case 70:
                return ("こんなところで止まっちゃダメだよ。突き抜けて。",image27!)
        case 71:
                return ("辛い時は息抜きも大事だよ",image4!)
        case 72:
                return ("大丈夫？相談にのろうか？",image9!)
        case 73:
                return ("辛いのは分かるよ。でもここまできたんだからラストスパート頑張ろ！",image23!)
        case 74:
                return ("絶対に最後までやり遂げよう。妥協しちゃダメだよ",image26!)
        case 75:
                return( "気にしないで、リセットして次回は絶対やろう。",image10!)
        case 76:
                return ("ファイトファイト！",image6!)
        case 77:
                return ("\(name!)なら絶対にできるよ！",image24!)
        case 78:
                return ("目標を達成した時の喜びを想像して...やりたくなってきた？",image7!)
        case 79:
                return ("ここまできたら月に変わって諦めさせないよ。",image17!)
        case 80:
                return ("あとちょっとだから、負けないで",image25!)
        case 81:
                return (" ここまできたら自分との勝負だよ",image9!)
        case 82:
                return ("少しでも頑張れたなら「達成できたボタン」を押すのもいいと思うよ",image11!)
        case 83:
                return( "辛くない？大丈夫？",image12!)
        case 84:
                return ("あとちょっとじゃん！正念場だよ。",image23!)
        case 85:
                return ("\(name!)なら絶対いけるーーーーーーーーー！！！！",image24!)
        case 86:
                return ("私が言うんだから絶対いけるよ！",image22!)
        case 87:
                return ("\(name!)は諦めないって私信じてるから",image18!)
        case 88:
        return( "諦めてないよね？諦めるなんて絶対嫌だからね",image9!)
        case 89:
        return ("ファイト！始めた時の〇〇の目は本気だったよ、もう一回がんばろ",image10!)
        case 90:
        return ("やっぱり...辛いの？",image26!)
        case 91:
        return ("もしかして辞めようとしてる？",image25!)
        case 92:
        return( "根性よ！\(name!)根性！",image27!)
        case 93:
        return ("もう一回頑張ったら？",image23!)
        case 94:
        return ("本当に辞めるの？",image26!)
        case 95:
        return ("それで納得できるの？",image24!)
        case 96:
        return ("最後までやりとげる\(name!)見たかった...",image9!)
        case 97:
        return ("そうやっていつも逃げてばかりなんだから",image24!)
        case 98:
        return ("\(name!)のバカ",image22!)
        case 99:
        return ("最低",image27!)
        case 100:
        return ("嫌い",image28!)
        case 101:
        return ("近寄らないで",image29!)
        case 102:
        return ("...",image1!)
        
        

        default:
        return ("バイバイ",image29!)
        
        

                
        }
        
        }
                        
                else {
                        return("バイバイ",image9!)
                }
                
        }
        
        
}
