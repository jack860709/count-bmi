//
//  ContentView.swift
//  text2
//
//  Created by 陳昀靖 on 2023/2/3.
//

import SwiftUI

struct ContentView: View {
    @State private var height=""
    @State private var weight=""
    @State private var tall=0.0
    @State private var wei=0.0
    @State private var tallc=0.0
    @State private var total=0.0
    @State private var bmip=0.0
    @State private var bmic="期待結果"
    @State private var bmiimg="cat"
    @State private var endtext="好期待"
    @State private var showActionSheet = false
    let myLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 80))
    var body: some View {
        ZStack {
            Color(red: /*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/, green: /*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/, blue: /*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                TextField("你的身高", text: $height, prompt: Text("你的身高"))
                            .textFieldStyle(.roundedBorder)
                            .padding()
                
                TextField("你的體重", text: $weight, prompt: Text("你的體重"))
                            .textFieldStyle(.roundedBorder)
                            .padding()
                
                        Button("印出BMI")
                {
                            countbmi()
                            pbmi()
                } .textFieldStyle(.roundedBorder)
                    .font(.largeTitle)
                    .padding()
                
                Text(bmic)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                Spacer()
                
                Text(endtext)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Image(bmiimg)
                    .resizable()
                    .cornerRadius(10)
                    .aspectRatio(contentMode: .fit)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            }
            .padding()
        }
        }
    func countbmi(){
        tall = (height as NSString).doubleValue
        wei = (weight as NSString).doubleValue
        tallc = tall*tall/10000
        total = wei/tallc
        bmic = String(format: "%.2f", total)
    }
    func pbmi(){
        bmip = (bmic as NSString).doubleValue
        switch bmip{
        case 0..<18.5:
            endtext = "可以吃凍咁囉～～"
            bmiimg="cat1"
        case 18.5..<24:
            endtext="健康！！！"
            bmiimg="cat2"
        case 24..<27:
            endtext="差一點就是整條街最亮的仔^^"
            bmiimg="cat3"
        case 27..<30:
            endtext="明天可能沒辦法吃罐罐了><"
            bmiimg="cat4"
        case 30..<35:
            endtext="要開始運動拉～～～"
            bmiimg="cat5"
        case 35..<100:
            endtext="可愛到膨脹拉！！"
            bmiimg="cat6"
        default:
            bmic="查無結果"
        }
            
        }
            
        
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
