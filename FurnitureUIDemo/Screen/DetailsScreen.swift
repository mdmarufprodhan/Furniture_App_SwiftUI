//
//  DetailsScreen.swift
//  FurnitureUIDemo
//
//  Created by Md Maruf Prodhan on 10/9/22.
//

import SwiftUI

struct DetailsScreen: View {
    var body: some View {
        ZStack{
            Color("Bg")
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                Image("chair_1")
                    .resizable()
                    .aspectRatio( contentMode: .fit)
                    .edgesIgnoringSafeArea(.top)
                
                DescriptionView()
                    .offset(y:-40)
            }
            HStack{
                Text("$122")
                    .font(.title)
                    .foregroundColor(.white)
                
                Spacer()
                
                Button {
                    print("")
                } label: {
                    Text("Add to cart")
                        .padding()
                        .padding(.horizontal)
                        .background(Color.white)
                        .cornerRadius(10.0)
                        .foregroundColor(Color("Primary"))
                }
                
            }
            .padding()
            .padding(.horizontal)
            .background(Color("Primary"))
            .cornerRadius(70.0, corners: .topLeft)
            .frame(maxHeight:.infinity, alignment: .bottom)
            
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}
struct DescriptionView: View {
    var body: some View {
        VStack(alignment:.leading){
            Text("Luxery Swedia \nChair")
                .font(.title)
                .bold()
            
            HStack(spacing: 4){
                ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                    Image("star")
                }
                Text("(4.9)")
                    .opacity(0.5)
                    .padding(.leading, 8)
                Spacer()
            }
            
            Text("Description")
                .fontWeight(.medium)
                .padding(.vertical,8)
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy.")
            
                .lineSpacing(8.0)
                .opacity(0.6)
            
            HStack(alignment : .top){
                VStack(alignment:.leading){
                    Text("Size")
                        .fontWeight(.semibold)
                        .padding(.bottom,4)
                    Text("Height : 120 cm")
                        .opacity(0.6)
                    Text("Wide : 80 cm")
                        .opacity(0.6)
                    Text("Diameter: 72 cm")
                        .opacity(0.6)
                    
                }
                .frame(maxWidth:.infinity, alignment: .leading)
                
                VStack(alignment:.leading){
                    Text("Treatment")
                        .fontWeight(.semibold)
                        .padding(.bottom,4)
                    Text("Jati wood, Canvas,\nAmazing Love")
                        .opacity(0.6)
                }
                .frame(maxWidth:.infinity, alignment: .leading)
            }
            .padding(.vertical)
            
            HStack{
                VStack{
                    Text("Colors")
                        .fontWeight(.semibold)
                    HStack{
                        ColorDotView(color: Color.white)
                        ColorDotView(color: .black)
                        ColorDotView(color: .green)
                    }
                }
                Spacer()
                
                VStack(alignment: .leading){
                    Text("Quantity")
                        .fontWeight(.semibold)
                    
                    HStack{
                        Button {
                            print("")
                        } label: {
                            HStack{
                                Image(systemName: "minus")
                                    .padding(.all, 8)
                                
                            }
                            .frame(width: 30, height: 30)
                            .overlay(RoundedRectangle(cornerRadius: 50).stroke())
                            .foregroundColor(.black)
                        }
                            Text("1")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .padding(.horizontal)
                            
                            Button {
                                print("")
                            } label: {
                                HStack{
                                    Image(systemName: "plus")
                                        .padding(.all, 8)
                                    
                                }
                             //   .frame(width: 30, height: 30)
                            //    .overlay(RoundedRectangle(cornerRadius: 50).stroke())
                                .background(Color("Primary"))
                                .clipShape(Circle())
                                .foregroundColor(.white)
                            }
                        
                    }
                }
                
                
                
            }
            .padding()
            .padding(.top)
            .background(Color("Bg"))
            .cornerRadius(40)
        }
    }
    
    
    struct ColorDotView: View {
        let color : Color
        var body: some View {
            
            color
                .frame(width:24, height: 24)
                .clipShape(Circle())
        }
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct DetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailsScreen()
    }
}
