//
//  DateManager.swift
//  calendarapp
//
//  Created by アプリ開発 on 2019/10/30.
//  Copyright © 2019 Masato.achiwa. All rights reserved.
//

import UIKit


class DateManager {
      
      var year: Int
      var month: Int
      var day: Int
        var daysArray: [String]! = []
        
         init() {
        let calendar = Calendar(identifier: .gregorian) //西暦を代入
        let date = calendar.dateComponents([.year, .month, .day], from: Date()) //現在日時の年、月、日にちを代入
        year = date.year!
        month = date.month!
        day = date.day!
        }

        // 現在タイトルに表示されている年月を宣言
        var nowYear: Int = 0
        var nowMonth: Int = 0
        
       let isLeapYear = { (year: Int) in year % 400 == 0 || (year % 4 == 0 && year % 100 != 0) }  //うるう年の条件（クロージャー）
        
       let zellerCongruence = { (year: Int, month: Int, day: Int) in (year + year/4 - year/100 + year/400 + (13 * month + 8)/5 + day) % 7 }   //曜日の計算。計算結果は0〜6の整数値
        
        func dayOfWeek(_ year: Int, _ month: Int, _ day: Int) -> Int {  //曜日を求める関数。引数を渡すとzellerCongruenceが自動で計算してくれる
                var year = year
                var month = month
                if month == 1 || month == 2 {
                        year -= 1
                        month += 12
                }
                return zellerCongruence(year, month, day)
        }
        
        func numberOfDays(_ year: Int, _ month: Int) -> Int { //各月の最終日の数字をリターンしたいため
                var monthMaxDay = [1:31, 2:28, 3:31, 4:30, 5:31, 6:30, 7:31, 8:31, 9:30, 10:31, 11:30, 12:31]
                if month == 2, isLeapYear(year) {
                        monthMaxDay.updateValue(29, forKey: 2)
                }
                return monthMaxDay[month]!
        }
        func conditionFourWeeks(_ year: Int, _ month: Int) -> Bool {  //週が４つの場合の条件。年、月、１日を代入してうるう年でなく２月、かつ１日にが日曜日の場合にtrueが返される
                let firstDayOfWeek = dayOfWeek(year, month, 1)
                return !isLeapYear(year) && month == 2 && (firstDayOfWeek == 0)
        }
        func conditionSixWeeks(_ year: Int, _ month: Int) -> Bool {  //週が6つの場合。
                let firstDayOfWeek = dayOfWeek(year, month, 1)
                let days = numberOfDays(year, month)
                return (firstDayOfWeek == 6 && days == 30) || (firstDayOfWeek >= 5 && days == 31)
        }
        
        func numberOfWeeks(_ year: Int, _ month: Int) -> Int {
                if conditionFourWeeks(year, month) {
                        return 4
                } else if conditionSixWeeks(year, month) {
                        return 6
                } else {
                        return 5
                }
        }
        
        func dateManager(_ year: Int,_ month: Int){
                let firstDayOfWeek = dayOfWeek(year, month, 1)  //１日の曜日を求めてInt型で返して代入（0〜6)
                let numberOfCells = numberOfWeeks(year, month) * 7  //１ヶ月の週の数かける７で全体のセルの数
                let days = numberOfDays(year, month) //１ヶ月のマスの数
               self.daysArray = alignmentOfDays(firstDayOfWeek, numberOfCells, days)  //(１日の曜日、セルの数、マスの数 )
             
        }
 
        
        
        
        
        
        func alignmentOfDays(_ firstDayOfWeek: Int, _ numberOfCells: Int, _ days: Int) -> [String] {
                var daysArray: [String] = []
                var dayCount = 0
                for i in 0 ... numberOfCells {
                        let diff = i - firstDayOfWeek  //(0-3,1-,3,2-3,3-３3,4 -3,5-3,35-3)
                        if diff < 0 || dayCount >= days { //difが0より小さいまたは、dayCountが31以上の場合は配列に空欄を追加
                                daysArray.append("")
                        } else {
                                daysArray.append(String(diff + 1))
                                dayCount += 1
                        }
                }
                return daysArray
        }


}
