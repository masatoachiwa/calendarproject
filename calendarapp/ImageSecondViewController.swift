//
//  ImageSecondViewController.swift
//  calendarapp
//
//  Created by アプリ開発 on 2020/04/07.
//  Copyright © 2020 Masato.achiwa. All rights reserved.
//

import UIKit

class ImageSecondViewController: UIViewController {

        @IBOutlet var gakuseiLabel: CustomLabel!
    
        @IBOutlet var nesuButton: UIButton!
        
        @IBOutlet var firstButton: UIButton!
        
        @IBOutlet var backButton: UIButton!
        
        
        var num = 0
      
        let talkManager = TalkManager()
        
        override func viewDidLoad() {
        super.viewDidLoad()

                gakuseiLabel.text = talkManager.gakuseiOfLabel().0
                gakuseiLabel.padding = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 8)
                
                nesuButton.isEnabled = false
                backButton.isEnabled = false
                
    }
    
         override func viewWillAppear(_ animated: Bool) {
        
          let talkManager = TalkManager()
          gakuseiLabel.text = talkManager.gakuseiOfLabel().0
        
        
        }
        
        
        
        @IBAction func jkButton(_ sender: Any) {
      self.dismiss(animated: true, completion: nil)
        
        
        }
    
        
        @IBAction func fristButton(_ sender: Any) {
      self.num = 3
               gakuseiLabel.text = newgakuseiOfLabel().0
        
                nesuButton.isEnabled = true
                backButton.isEnabled = true
        }
        
        
        
        @IBAction func nestButton(_ sender: Any) {
                        
                self.num = num + 3
                gakuseiLabel.text = newgakuseiOfLabel().0
                print(num)
                
                if num >= talkManager.currentTotalPoint{
                        num =  talkManager.currentTotalPoint
         gakuseiLabel.text = newgakuseiOfLabel().0
        print(num)
        
                }
        }
        
        @IBAction func backButton(_ sender: Any) {
                self.num = num - 3
                if num <= 0{
                        num = 1
                        gakuseiLabel.text = newgakuseiOfLabel().0
                        print(num)
                }else {
                gakuseiLabel.text = newgakuseiOfLabel().0
                print(num)
                }
                
        }
        
        let name = (UserDefaults.standard.string(forKey: "name") ?? "田中")
        let effort = (UserDefaults.standard.string(forKey: "effort") ?? "努力")
        
        func newgakuseiOfLabel() -> (String,Int) {
                switch num {
                case 0...3:
                        return ("普通男  \(name)って知ってる？\nメガネ男  そんなやついたっけ？\nデカ男  いや、知らないわ", 1)
                        
                case 4...6:
                        return("普通男  \(effort)始めたとかって風の噂で聞いたぜ。\nメガネ男  興味ねー\nデカ男  この後どうする？  ", 2)
                        
                case 7...9:
                        return("普通男  \(name)、\(effort)続いてるらしいよ。\nメガネ男  一週間で終わってたら面白かったんですが。\nデカ男  何日続くか賭けようぜ。  ", 3)
                case 10...12:
                        return ("普通男  \(name)の夢が叶うといいですね。\nメガネ男  全く思ってないの分かりすぎ笑\nデカ男  お前ら性格わりー笑", 4)
                        
                case 13...15:
                        return ("普通男  \(name)早く挫折しないかなー\nメガネ男  今するよりも、もう少し調子乗ってからした方が面白くね？\nデカ男  悪趣味でうける笑", 5)
                        
                case 16...18:
                        return ("普通男  \(name)頑張ってる？\nメガネ男  みたいだわ。\nデカ男  身の程を知った方がいいのにな。", 6)
                        
                case 19...21:
                        return ("普通男  \(name)の頑張りどう思う？\nメガネ男  いちいち周りに言う時点でキモい\nデカ男  それな。", 7)
                        
                case 22...25:
                        return("普通男  \(effort)始めたら？\nメガネ男  今は学校の勉強をするべきかなー\nデカ男  俺は野球しか興味ない  ", 8)
                        
                case 26...29:
                        return("普通男　さっき\(name)が偉そうに\(effort)のこと話してたぜ。\nメガネ男  何もなしてないのに話すのが一番痛いわ。\nデカ男  てか誰も応援してないの気づかないのがうける。", 9)
                case 30...32:
                        return ("普通男  １ヶ月ぐらい経ちましたね。\nメガネ男  \(name)の\(effort)？笑\nデカ男  あいつにしてはもったな。", 10)
                        
                case 33...35:
                        return ("普通男  面白い話してやろうか？\nメガネ男  \(name)の無駄な努力より面白い話？\nデカ男  無駄とか言ったんなって笑", 0)
                        
                case 36...38:
                        return ("普通男  \(name)になんで急に\(effort)始めたの？って聞いたんだわ。\nメガネ男  マジで？なんて言ってた笑？\nデカ男  どうせ応援している程で聞いたんだろ？性格悪いわー。", 0)
                case 39...41:
                        return ("普通男  \(effort)を頑張って夢を叶えたいらしいよ。\nメガネ男  現実を見ようよ笑\nデカ男  俺が可能性のある夢持った方がいいぞってアドバイスしてやろうか。", 0)
                case 42...44:
                        return ("普通男  努力すれば変われるって思ってやつ多いよね。\nメガネ男  変われる奴はごく一部ってのを気づいた方がいいよね。\nデカ男  途中で挫折するのが見え見えで痛いよな。", 0)
                        
                case 45...47:
                        return("普通男  努力するためにお金を投資して無駄遣いするやつもいるよね。\nメガネ男  情報搾取されてて痛いわー。\nデカ男   \(name)は搾取する側にとってはカモだわ  ", 0)
                        
                case 48...50:
                        return("普通男  初めての○○シリーズの本が家に何冊もあるやつとかうけん？\nメガネ男  \(name)の家めっちゃありそう。\nデカ男  全部が中途半端なんだよな。", 0)
                case 51...53:
                        return ("普通男  非リア充に限って無駄な努力好きだよな。\nメガネ男  非リア充に失礼ですよ。\nデカ男  俺はリア充だから無駄な努力してないわ", 0)
                        
                case 54...56:
                        return ("普通男  \(name)のこと応援してる？笑\nメガネ男  表面上はしてるぜ。\nデカ男  あー俺も笑", 0)
                        
                case 57...59:
                        return ("普通男  てか、応援てみんな表面上だけだよな？\nメガネ男  あまり大声でいえないけどそうだろうな。\nデカ男  柔道部の堂上剛のことガチで応援してるぜ。", 0)
                        
                case 60...62:
                        return ("普通男  堂上は才能あるし、本当に努力しているから俺も応援してる。\nメガネ男  去年全国でベスト８まで行ったし、今年は1位とってほしいよな。\nデカ男  なんで\(name)のこと応援できねんだろうな？笑", 0)
                        
                case 63...65:
                        return("普通男  堂上と違ってなんか痛い感あるからな。\nメガネ男  それはあるね。\nデカ男  \(name)が俺たちより上になるって考えると腹たつわ笑", 0)
                        
                case 66...68:
                        return("普通男　なんやかんや\(name)まだ頑張ってるらしいね。\nメガネ男  想像以上に頑張ってるな。\nデカ男  いや普通だろ？", 0)
                case 69...71:
                        return ("普通男  ちょっと\(name)の顔つき変わったことない？\nメガネ男  それはない笑\nデカ男  錯覚だろ？", 0)
                        
                case 72...74:
                        return ("普通男  クラスメートで\(name)のことすごいって言う出すやつでてきたな。\nメガネ男  絶対お世辞だろ。\nデカ男  結果出したら褒めたるわ。", 0)
                        
                case 75...77:
                        return ("普通男  努力するだけで褒めらるなら俺もなんかしようかな？\nメガネ男  学校の勉強しろ！\nデカ男  ブレブレは痛いぜ。", 0)
                case 79...81:
                        return ("普通男  最近頑張ることは悪いことじゃないって\(name)見て思うようになったかも。\nメガネ男  応援するよ。表面上は。\nデカ男  何を頑張るかにもよるよな。", 0)
                case 82...84:
                        return("普通男  最近\(name)の周り友達増えてね？\nメガネ男  ちょっとずつ結果出してきてるらしいよ。\nデカ男  ミーハーきもいわ。  ", 0)
                        
                case 85...87:
                        return("普通男　ちょっとでも結果を出したのは評価できるな。\nメガネ男  ３ヶ月ぐらいやって全く効果なかったらクソだろ。\nデカ男  最初は伸びしろがある分成長が分かりやすいからな、本当に大変なのは今からだぞ。", 0)
                case 88...90:
                        return ("普通男  \(name)ここまで続くと思った？\nメガネ男  思ってない笑\nデカ男  俺の２ヶ月が一番当たりに近いから後でジュースおごれよ。", 0)
                        
                case 91...93:
                        return ("普通男  最近暇だなー。\nメガネ男  \(name)早く挫折しねーかな。\nデカ男  ちょっだけ本当に成功するんじゃないかって気がしてきたわ。", 0)
                        
                case 94...96:
                        return ("普通男  \(name)が成功したらどうする？\nメガネ男  表面上は一緒に喜ぶかなー。\nデカ男  普通にすげーって思うよ。", 0)
                case 97...99:
                        return ("普通男  努力ってどのくらい頑張ったら結果がついてくるんだろう？\nメガネ男  本気で努力したら科学者でもない限り半年である程度結果でるだろ。\nデカ男  筋肉は間違いなく効果現れるぞ。", 0)
                case 100...102:
                        return ("普通男  \(name)の\(effort)も3ヶ月後が楽しみだな。\nメガネ男  口先だけの男かどうか見極めてやるよ。\nデカ男  今の所順調そうだな。", 0)
                        
                case 103...105:
                        return("普通男  最近\(name)のことバカにする声聞かなくなってきよな。\nメガネ男  そういう風潮がでてくるとすぐに同調圧力で褒め出すよな。\nデカ男   頑張っている人を褒めている自分素敵やん。って感じだろ。", 0)
                        
                case 106...108:
                        return("普通男  率直に今の\(name)のこと、どう思う？\nメガネ男  可もなく不可もなくって感じか。  \nデカ男  頑張ってるのは認めるけど、賞賛には値しない。", 0)
                case 109...111:
                        return ("普通男  \(name)にしてはよく頑張ってるよな\nメガネ男  \(name)のハードル低すぎてうけるわ。\nデカ男  \(name)だから出来たって言われるようにならないと本当の成功とは言えないよな。", 0)
                        
                case 112...114:
                        return ("普通男  \(name)がクラスでちょっと上の方に上がってきた？\nメガネ男  分かる。潰す？\nデカ男  出る杭は...ってやつか？", 0)
                        
                case 115...117:
                        return ("普通男  どやって潰す？\nメガネ男  ３人でLINE毎日送りまくるとか？\nデカ男  こっちがめんどいわ。ほかっとけよ。", 0)
                        
                case 118...120:
                        return ("普通男  今潰そうとするとこっちもリスクあるしな。\nメガネ男  クラスの女子とかにも人気出てきたからな。\nデカ男  仲良くしといた方が特かもな笑", 0)
                        
                case 121...123:
                        return("普通男  まぁでも俺は実は、\(name)のこと根は良いやつって思ってたけど。\nメガネ男  はい、嘘。\nデカ男  昔の\(name)は知らんが今の\(name)はまぁ頑張ってるな。", 0)
                        
                case 125...127:
                        return("普通男　これから\(name)のこと応援するわ。\nメガネ男  俺も表面上は応援することにするよ。\nデカ男  俺は温かく見守る派でいく。", 0)
                case 128...130:
                        return ("普通男  \(name)って毎日努力出来たか、出来なかったか記録つけてるらしいぜ。\nメガネ男  後から見返して反省とかできるからいいな。\nデカ男  俺もやろうかな", 0)
                        
                case 131...133:
                        return ("普通男   \(name)のまねして何か始めるクラスメート増えてきたよね？\nメガネ男  知らん間に影響力持ち初めてね？\nデカ男  俺も実は最近野球だけじゃなくて勉強も頑張るようにしたんだ。", 0)
                        
                case 134...136:
                        return ("普通男  \(name)に憧れるやつ出てきたぞ笑\nメガネ男  まぁちょっとは分かるけど。\nデカ男  俺も最近LINE交換しちゃったわ。", 0)
                case 137...139:
                        return ("普通男  うちのクラス完全に努力ブームになったな。\nメガネ男  俺も最近TOEICの勉強始めちゃった。\nデカ男  努力って楽しいよな。", 0)
                case 140...142:
                        return ("普通男  よく考えたら\(name)っていいやつだった？\nメガネ男  結構いいやつだったな\nデカ男  お前ら変わりすぎ笑", 0)
                        
                case 143...145:
                        return ("普通男  クラスで\(name)のことバカにしてるやつ少数だけどいるらしいぜ\nメガネ男  人の努力を素直に応援できない哀れな人がいるみたいだな。\nデカ男  ただの妬み野郎だろ。", 0)
                        
                case 146...148:
                        return("普通男  \(name)と同じクラスで良かったよな。\nメガネ男  類は友を呼ぶと言いますからね。\nデカ男  俺たちは同類なんだろうな。", 0)
                        
                case 149...151:
                        return("普通男　\(name)の夢叶うといいな。\nメガネ男  俺らが心配しなくても叶いますよ。\nデカ男  たとえ満足な結果が出なくても次は絶対叶えるよ。", 0)
                case 152...154:
                        return ("普通男  他のクラスでも\(name)の話題出るらしいぜ。\nメガネ男  他のクラスだとアンチがまだ結構いるらしいな。\nデカ男  \(name)の頑張りを間近で見てないからだろ。", 0)
                        
                case 155...157:
                        return ("普通男   俺たちって昔\(name)のことアンチだったけ？\nメガネ男  俺は割と最初から応援してたよ。\nデカ男  えっ？笑", 0)
                        
                case 158...160:
                        return ("普通男  アンチにも負けずに己の信念を貫く\(name)のこと尊敬するわ。\nメガネ男  なかなか真似できないよな。\nデカ男  それをバカにするやつって自分には出来ないからバカにするんだろうな。", 0)
                case 161...163:
                        return ("普通男  \(name)が結果も出してきているな。\nメガネ男  あれだけ努力してたら当然。\nデカ男  結果が出ない方が不思議だわ。", 0)
                case 164...166:
                        return("普通男  \(name)って意外とゲーム好きらしいよ。\nメガネ男  俺と同じじゃん。嬉しいわ。\nデカ男  何のゲーム？俺もやろうかな？", 0)
                        
                case 167...169:
                        return("普通男  \(name)に聞いたら今は\(effort)を精一杯やりたいからゲームやってないらしいわ。\nメガネ男  意志強くてやばいわ。\nデカ男  \(name)もそういう誘惑と戦っているって聞くと親近感わくね。  ", 0)
                case 170...172:
                        return ("普通男  もうすぐ\(name)の\(effort)がひと段落するらしいぜ。\nメガネ男  みんなで打ち上げしようぜ。\nデカ男  絶対行くわ！", 0)
                        
                case 173...175:
                        return ("普通男  うちらって\(name)っていう最高の友達をもったよな。\nメガネ男  \(name)が俺たちのこと友達って思ってくれているかな？\nデカ男  思ってくれているさ。", 0)
                        
                case 176...178:
                        return ("普通男  この半年間\(name)のおかげで本当に楽しかったな。\nメガネ男  久しぶりに充実した半年間だった。\nデカ男  これからもお互い頑張ろうぜ！", 0)
                        
                case 179...180:
                        return ("普通男  終わっちゃったな。とりあえずお疲れ。\nメガネ男  ああ。お疲れ。\nデカ男  いかん。泣けてきた。", 0)
                case 181...200:
                        return ("普通男  これからは俺たちがいなくても頑張れるよな。\nメガネ男  そりょそうだろ、\(name)だぜ。\nデカ男  てか今から頑張らないといけないのは他人より俺たちだぜ。", 0)
                        
                        
                default:
                        return ("最後までプレイしてくださりありがとうございます。終わり。",180)
                }
                
        }
}
        
  
        
        
        
        

