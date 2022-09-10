//
//  HomeScreen.swift
//  FurnitureUIDemo
//
//  Created by Md Maruf Prodhan on 9/9/22.
//

import SwiftUI

struct HomeScreen: View {
    @State var selectedIndex : Int = 0
    private let catagoris = ["All", "Chair", "Sofa", "Lamp","Kitchen", "Table"]
    var body: some View {
        NavigationView {
            ZStack {
                Color("Bg")
                    .edgesIgnoringSafeArea(.all)
                ScrollView{
                    VStack(alignment:.leading){
                        AppBarView()
                        TagLineView()
                            .padding()
                        SearchAndScanView()
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack{
                                ForEach(0..<catagoris.count) { i in
                                    CatagoryView(isActive: i==selectedIndex, text: catagoris[i])
                                        .onTapGesture {
                                            selectedIndex = i
                                        }
                                }
                            }
                            .padding()
                        }
                        Text("Popular")
                            .font(.custom("PlayfairDisplay-Bold.ttf", size: 24))
                            .padding(.horizontal)
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack{
                                ForEach(0 ..< 10) { item in
                                    NavigationLink {
                                        DetailsScreen()
                                    } label: {
                                        ProductCardView(image: Image("chair_\(item+1)"), size: 210)}
                                    .navigationBarHidden(true)
                                    .foregroundColor(.black)
                                    

                                }
                                .padding(.trailing)
                            }
                            
                            .padding(.leading)
                            
                        }
                        
                        Text("Best")
                            .font(.custom("PlayfairDisplay-Bold.ttf", size: 24))
                            .padding(.horizontal)
                            .padding(.top)
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack{
                                ForEach(0 ..< 10) { item in
                                    ProductCardView(image: Image("chair_\(item+1)"), size: 180)
                                }
                                .padding(.trailing)
                            }
                            
                            .padding(.leading)
                            
                        }
                        
                    }
                }
                //Custom Bottom NavBar
                HStack{
                    BottomNavBarItem(image: Image(systemName: "house")) {}
                    BottomNavBarItem(image: Image(systemName: "heart")) {}
                    BottomNavBarItem(image: Image(systemName: "cart")) {}
                    BottomNavBarItem(image: Image(systemName: "person")) {}
                    
                    
                }
                .padding()
                .background(.white)
                .clipShape(Capsule())
                .padding(.horizontal)
                .shadow(color: Color.black.opacity(0.15), radius: 8, x: 2, y: 6)
                .frame(maxHeight: .infinity, alignment: .bottom)
                
                
            }
        }
    }
}

struct AppBarView: View {
    var body: some View {
        HStack{
            Button {
                print("men")
            } label: {
                Image("menu")
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10.0)
            }
            Spacer()
            Button {
                print("profile")
            } label: {
                Image("Profile")
                    .resizable()
                    .frame(width: 42, height: 42)
                    .cornerRadius(10.0)
            }
            
            
        }
        .padding(.horizontal)
    }
}

struct TagLineView: View {
    var body: some View {
        Text("Find The \nBest ")
            .font(.custom("PlayfairDisplay-Regular.ttf", size: 28))
            .foregroundColor(Color("Primary"))
        + Text("Furniture!")
            .font(.custom("PlayfairDisplay-Bold.ttf", size: 28))
            .foregroundColor(Color("Primary"))
    }
}

struct SearchAndScanView: View {
    @State var search : String = ""
    var body: some View {
        HStack{
            HStack{
                Image("Search")
                    .padding(.trailing, 8)
                TextField("Search Furniture", text: $search)
            }
            
            .padding(.all,16)
            .background(Color.gray)
            .cornerRadius(10.0)
            
            Button {
                print("Scan")
            } label: {
                Image(systemName: "barcode.viewfinder")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.gray)
                    .cornerRadius(10.0)
            }
            
            
        }
        .padding(.horizontal)
    }
}

struct CatagoryView: View{
    let isActive : Bool
    let text : String
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Text(text)
                .font(.system(size: 15))
                .fontWeight(.medium)
                .foregroundColor(isActive ? Color("Primary"): Color.black.opacity(0.5))
            
            
            if(isActive){
                Color("Primary")
                    .frame(width: 15, height: 2)
                    .clipShape(Capsule())
            }
            
        }
        .padding(.trailing)
    }
}


struct ProductCardView: View {
    let image : Image
    let size : CGFloat
    var body: some View {
        VStack{
            image
                .resizable()
                .frame(width: size, height: 200*(size/210))
                .cornerRadius(20.0)
            
            Text("Luxery swedian chair")
                .font(.title3)
                .bold()
            HStack(spacing: 2){
                ForEach(0..<5){ i in
                    Image("star")
                }
                Spacer()
                Text("$1299")
                    .font(.title3)
                    .bold()
                
            }
            
        }
        .frame(width: size)
        .padding()
        .background(.white)
        .cornerRadius(20.0)
        
        
        
    }
}

struct BottomNavBarItem: View {
    let image : Image
    let action : ()->Void
    var body: some View {
        Button(
            action: action,
            label: {
                image
                    .frame(maxWidth:.infinity)
            })
    }
}




struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
