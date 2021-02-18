//
//  1130_animation.swift
//  test_takkyu01
//
//  Created by x18079xx on 2020/11/30.
//  Copyright © 2020 AIT. All rights reserved.
//

import SwiftUI

struct Point {
    var x:Double = 0
    var y:Double = 0
}

func angle(a:Point, b:Point) -> Double {
    var r = atan2(b.y - a.y, b.x - a.x)
    if r < 0 {
        r = r + 2 * .pi
    }
    return floor(r * 360 / (2 * .pi))
}

func distance(a:Point, b:Point) -> Double {
    return sqrt(pow(b.x - a.x, 2) + pow(b.y - a.y, 2))
}

struct ContentView: View {
    //ボタンのフラグ変数
    @State var isAnimation = false
    @State var isAnimation2 = false
    @State var isAnimation3 = false
    @State var x:Double = 0
    @State var y:Double = 0
    @State var bfx:Double = 0
    @State var bfy:Double = 0
    @State var kpx:Double = 0
    @State var kpy:Double = 0
    @State var rotact = 0
    @State var rota1 = 0
    @State var rota2 = 0
    @State var count = 0
    @State var count2 = 0
    @State var r:Double = 0
    @State var x2:Double = 0
    @State var y2:Double = 0
    @State var w:Double = 0
    @State var h:Double = 0
    @State var herfw:Double = 0
    @State var herfh:Double = 0
    @State var dis1:Double = 0
    
    @State var nowx: [Double] = [0]
    @State var nowy: [Double] = [0]
    @State var beforx: [Double] = [0]
    @State var befory: [Double] = [0]
    @State var posx: [Double] = [0]
    @State var posy: [Double] = [0]
    @State var dis: [Double] = [0]
    @State var id = [[false,false,false],
                     [false,false,false],
                     [false,false,false],
                     [false,false,false],
                     [false,false,false],
                     [false,false,false]]



    let gradient = RadialGradient(gradient: Gradient(colors: [.white, .black]), center: .center, startRadius: 0, endRadius: 100)
    
    var foreverAnimation: Animation {
            Animation.linear(duration: 2.0)
                .repeatForever(autoreverses: false)
        }
    
    var body: some View {
        ZStack{
            VStack{
//                Text("\(distance(a: Point(x: self.beforx[self.count], y: self.befory[self.count]), b: Point(x: self.nowx[self.count], y: self.nowy[self.count]))),\(angle(a: Point(x: self.beforx[self.count], y: self.befory[self.count]), b: Point(x: self.nowx[self.count], y: self.nowx[self.count]))),\(self.count)")
//                    .font(.system(size: 30, weight: .black, design: .default))
                Rectangle()
                    .frame(width: 100, height: 850)
                    .opacity(0)

                HStack{
                    //初期位置に戻すボタン
                    Button(action: {
                        //self.r = atan2(self.y - self.bfy, x - self.bfx)
                        //self.r = angle(Point(x: self.bfx, y: self.bfy), b: Point(x: self.x, y: self.y))
                        self.x = self.kpx
                        self.y = self.kpy
                        //self.isAnimation = false
                        self.isAnimation.toggle()
                        self.x2 = (self.x + self.bfx)/2
                        self.y2 = (self.y + self.bfy)/2
                        if(self.rotact == 1){
                            //self.isAnimation2.toggle()
                            self.rota1 = self.rota2
                            self.rota2 = self.rota1 - 360
                        }else if(self.rotact == 2){
                            //self.isAnimation3.toggle()
                            self.rota1 = self.rota2
                            self.rota2 = self.rota1 + 360
                        }
                        if(self.count == 0){
                            self.beforx[0] = self.bfx
                            self.befory[0] = self.bfy
                            self.nowx[0] = self.x
                            self.nowy[0] = self.y
                            self.posx[0] = self.x2
                            self.posy[0] = self.y2
                        }else{
                            self.beforx.append(self.bfx)
                            self.befory.append(self.bfy)
                            self.nowx.append(self.x)
                            self.nowy.append(self.y)
                            self.posx.append(self.x2)
                            self.posy.append(self.y2)
                        }
                        self.count = self.count + 1

                        
                    }) {
                    Text("確定")
                        .frame(width:160, height:50)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .shadow(radius: 5)
                        .font(.system(size: 30, weight: .black, design: .default))
                    }
                    
                    Button(action: {
                        if(self.count2 == 0){
                            self.count2 = 1
                        }else if(self.count2 == 1){
                            self.count2 = 0
                        }
                    }) {
                    Text("履歴")
                        .frame(width:160, height:50)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .shadow(radius: 5)
                        .font(.system(size: 30, weight: .black, design: .default))
                    }
                }
                
                HStack{
                    Button(action: {
                        self.rotact = 1
                    }) {
                    Text("左回転")
                        .frame(width:160, height:50)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .shadow(radius: 5)
                        .font(.system(size: 30, weight: .black, design: .default))
                    }
                    .frame(width:165, height:70)
                    Button(action: {
                        self.rotact = 2
                    }) {
                    Text("右回転")
                        .frame(width:160, height:50)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .shadow(radius: 5)
                        .font(.system(size: 30, weight: .black, design: .default))
                    }
                    .frame(width:165, height:70)
                    Button(action: {
                        self.rotact = 3
                    }) {
                    Text("縦回転")
                        .frame(width:160, height:50)
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                        .shadow(radius: 5)
                        .font(.system(size: 30, weight: .black, design: .default))
                    }
                    .frame(width:165, height:70)
                }
                
            }
            VStack{
                //外枠
                Rectangle()
                    .stroke(lineWidth: 3)
                    .foregroundColor(.black)
                    .frame(width:410, height:845)
                Rectangle()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 200)
                    .opacity(0)
            }.rotation3DEffect(.degrees(20), axis: (x: 1, y: 0,z: 0))
            
            VStack{
                HStack{
                    Color(hue: 0.6, saturation: 0.7, brightness: 1, opacity: 1.0)
                    .frame(width: 200, height: 840)
                    Color(hue: 0.6, saturation: 0.7, brightness: 1, opacity: 1.0)
                    .frame(width: 200, height: 840)
                    
                }
                Rectangle()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 200)
                    .opacity(0)
            }.rotation3DEffect(.degrees(20), axis: (x: 1, y: 0,z: 0))
            //台
            
            //盤面上のボタンやネット配置
            VStack{
                ForEach(0..<3) {y in
                    HStack{
                        ForEach(0..<3) {x in
                            GeometryReader { a in
                                Button(action: {
                                    //self.isAnimation = false
                                    self.isAnimation.toggle()
                                    self.w = Double(Int((a.frame(in: .global).width)))
                                    self.h = Double(Int((a.frame(in: .global).height)))
                                    self.herfw = w/2
                                    self.herfh = h/2
                                    self.kpx = Double(Int((a.frame(in: .global).origin.x)))
                                    self.kpy = Double(Int((a.frame(in: .global).origin.y)))
                                    self.bfx = self.x
                                    self.bfy = self.y
                                    self.id = [[false,false,false],[false,false,false],[false,false,false],[false,false,false],[false,false,false],[false,false,false],]
                                    self.id[x][y] = true
                                }) {
                                    Text("X: \(a.frame(in: .global).origin.x) Y: \(a.frame(in: .global).origin.y)")
                                        .frame(width:115, height:115)
                                }.foregroundColor(.white)
                                .frame(width:120, height:120)
                                .background(self.id[x][y] ? Color.black : Color.white)
                                .opacity(0.5)
                            }.frame(width:120, height:120)
                        }

                    }
                }
                
                Image("ネット画像")
                    .resizable()
                    .frame(width:450, height:60)
                    .opacity(0.7)
                    .rotation3DEffect(.degrees(-20), axis: (x: 1, y: 0,z: 0))
                
                ForEach(0..<3) {y in
                    HStack{
                        ForEach(3..<6) {x in
                            GeometryReader { a in
                                Button(action: {
                                    //self.isAnimation = false
                                    self.isAnimation.toggle()
                                    //self.isAnimation = false
                                    self.kpx = Double(Int((a.frame(in: .global).origin.x)))
                                    self.kpy = Double(Int((a.frame(in: .global).origin.y)))
                                    self.bfx = self.x
                                    self.bfy = self.y
                                    self.id = [[false,false,false],[false,false,false],[false,false,false],[false,false,false],[false,false,false],[false,false,false]]
                                    self.id[x][y] = true
                                }) {
                                    Text("X: \(a.frame(in: .global).origin.x) Y: \(a.frame(in: .global).origin.y) width: \(a.frame(in: .global).width) height: \(a.frame(in: .global).height)")
                                        .frame(width:115, height:115)
                                }.foregroundColor(.white)
                                .frame(width:120, height:120)
                                .background(self.id[x][y] ? Color.black : Color.white)
                                .opacity(0.5)
                            }.frame(width:120, height:120)
                        }
                    }
                }
                Rectangle()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 200)
                    .opacity(0)

                
            }
            .rotation3DEffect(.degrees(20), axis: (x: 1, y: 0,z: 0))
            
//            ボタンにIDを付与する、1,2,3...
//            配列に@State private var flag = [false,false,false]
//            var tapButtonId = 0 //押されたらボタンのIDを代入
//            if(flag[tapButtonId]){
//            Circle()
//            .foregroundColor(.white)
//            .frame(width: 50, height: 50)
            //ここだけ変えてね↓
//            .position(x:Button.x, y:Button.y)
//            .animation(.default)
//            }
//            Image("せん")
//                .resizable()
//                .frame(width: 100, height: 700)

            //使う予定のコード
            if(self.count2 == 1){
                ForEach(1..<self.count){ x in
                    if(self.rotact == 3){
                        Rectangle()
                            .frame(width: 5, height: CGFloat(distance(a: Point(x: self.beforx[x], y: self.befory[x]), b: Point(x: self.nowx[x], y: self.nowy[x]))))
                            .rotation3DEffect(.degrees(angle(a: Point(x: self.beforx[x], y: self.befory[x]), b: Point(x: self.nowx[x], y: self.nowy[x]))-90), axis: (x: 0, y: 0,z: 1))
                            .position(x: CGFloat(self.posx[x] + self.herfw), y: CGFloat(self.posy[x] + self.herfh))
                    }else{
                        Image("せん")
                            .resizable()
                            .frame(width: 50, height: CGFloat(distance(a: Point(x: self.beforx[x], y: self.befory[x]), b: Point(x: self.nowx[x], y: self.nowy[x]))))
                            .rotation3DEffect(.degrees(angle(a: Point(x: self.beforx[x], y: self.befory[x]), b: Point(x: self.nowx[x], y: self.nowy[x]))-90), axis: (x: 0, y: 0,z: 1))
                            .position(x: CGFloat(self.posx[x] + self.herfw), y: CGFloat(self.posy[x] + self.herfh))
                    }
                }
            }
            
//            Image("せん")
//                .resizable()
//                .frame(width: 50, height: CGFloat(distance(a: Point(x: self.beforx[self.count], y: self.befory[self.count]), b: Point(x: self.nowx[self.count], y: self.nowy[self.count]))))
//                .rotation3DEffect(.degrees(angle(a: Point(x: self.beforx[self.count], y: self.befory[self.count]), b: Point(x: self.nowx[self.count], y: self.nowy[self.count]))-90), axis: (x: 0, y: 0,z: 1))
//                .position(x: CGFloat(self.posx[self.count] + self.herfw), y: CGFloat(self.posy[self.count] + self.herfh))
            
            //卓球ボール
            
            if(self.rotact == 2){
                Image("rightrota")
                    .resizable()
                    .frame(width: 110, height: 110)
                    .rotationEffect(Angle(degrees: Double(self.isAnimation2 ? self.rota1 : self.rota2)))
                    .rotationEffect(Angle(degrees: Double(self.isAnimation3 ? self.rota1 : self.rota2)))
                    .offset(x: CGFloat(self.isAnimation ? self.bfx-360 : self.x - 360))
                    .offset(y: CGFloat(self.isAnimation ? self.bfy-550 : self.y - 550))
                    .animation(Animation.default
                        .speed(0.5)
                    )
            }else if(self.rotact == 1){
                Image("leftrota")
                    .resizable()
                    .frame(width: 110, height: 110)
                    .rotationEffect(Angle(degrees: Double(self.isAnimation2 ? self.rota1 : self.rota2)))
                    .rotationEffect(Angle(degrees: Double(self.isAnimation3 ? self.rota1 : self.rota2)))
                    .offset(x: CGFloat(self.isAnimation ? self.bfx-360 : self.x - 360))
                    .offset(y: CGFloat(self.isAnimation ? self.bfy-550 : self.y - 550))
                    .animation(Animation.default
                        .speed(0.5)
                    )
            }else{
                Image("アセット 1")
                    .resizable()
                    .frame(width: 110, height: 110)
                    .rotationEffect(Angle(degrees: Double(self.isAnimation2 ? self.rota1 : self.rota2)))
                    .rotationEffect(Angle(degrees: Double(self.isAnimation3 ? self.rota1 : self.rota2)))
                    .offset(x: CGFloat(self.isAnimation ? self.bfx-360 : self.x - 360))
                    .offset(y: CGFloat(self.isAnimation ? self.bfy-550 : self.y - 550))
                    .animation(Animation.default
                        .speed(0.5)
                    )
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}





//CGFloat(distance(a: Point(x: self.bfx, y: self.bfy), b: Point(x: self.x, y: self.y)))
