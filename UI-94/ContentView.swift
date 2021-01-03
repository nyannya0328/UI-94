//
//  ContentView.swift
//  UI-94
//
//  Created by にゃんにゃん丸 on 2021/01/03.
//

import SwiftUI

struct ContentView: View {
    @State var gotohome = false
    var body: some View {
        ZStack{
            if gotohome{
                
                Image("p1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    
                
                
            }
            else{
                Home()
                
            }
        }
  
    .onReceive(NotificationCenter.default.publisher(for: Notification.Name("Succeess")), perform: { _ in
                      self.gotohome = true
                  })
        
        
       
        
        
        
       
        
        
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View {
    @State var width = UIScreen.main.bounds.width - 100
    
    @State var offset : CGFloat = 0
    var body: some View{
        
        ZStack{
            
            
            Color("bg").ignoresSafeArea(.all, edges: .all)
            
            VStack{
                
                Spacer(minLength: 0)
                Text("King Login")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                
                
                Text("Lion")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding()
                    .padding(.bottom)
                
                Image("p1")
                    .resizable()
                
                Spacer(minLength: 0)
                
                
                ZStack{
                    Capsule()
                        .fill(Color.white.opacity(0.3))
                    
                    Text("Swipe to Start")
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    
                    HStack{
                        
                        Capsule()
                            .fill(Color.red)
                            .frame(width: calucutatewidth() + 55)
                        
                        Spacer()
                    }
                        
                    
                    HStack{
                        
                        
                        
                        ZStack{
                            
                          
                            
                            Image(systemName: "chevron.right")
                            Image(systemName: "chevron.right")
                            .offset(x:-10)
                            
                            
                                
                           
                                
                          
                            
                            
                        }
                        .offset(x:+5)
                        
                        .foregroundColor(.white)
                        .frame(width: 65, height: 65)
                        .background(Color.red)
                        .clipShape(Circle())
                        .offset(x: offset)
                        .gesture(DragGesture().onChanged(onchaged(value:)).onEnded(onEnd(value:)))
                        
                        
                        
                        Spacer()
                       
                        
                        
                        
                        
                        
                    }
                        
                    
                    
                }
                .frame(width: width, height: 65)
                .padding()
                
                
            }
            
        }
        
    }
    func onchaged(value:DragGesture.Value){
        
        if value.translation.width > 0 && offset <= width - 65{
            
            offset = value.translation.width
            
        }
        
        
    
        
        
    }
    
    func onEnd(value:DragGesture.Value){
        
        withAnimation(Animation.easeOut(duration: 0.3)){
            
            if offset > 180{
                
                offset = width - 65
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.35){
                    
                    NotificationCenter.default.post(name: Notification.Name("Succeess"), object: nil)
                    
                }
            
                
                
            }
            else{
                
                offset = 0
            }
           
        }
        
    }
    
    func calucutatewidth() -> CGFloat{
        
        
        let parcent = offset / width
        
        return parcent * width
        
        
    }
}
