import SwiftUI

struct RatingView: View {
    @Binding var generalRating: Int
    @Binding var teachersRating: Int
    @Binding var staff: Int
    @State private var reviewText = ""
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                VStack {
                    HStack {
                        ForEach(1..<6) { index in
                            Image(systemName: index <= teachersRating ? "star.fill" : "star")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                                .foregroundColor(index <= teachersRating ? .yellow : .blue)
                                .onTapGesture {
                                    teachersRating = index
                                }
                                .gesture(
                                    DragGesture()
                                        .onChanged { value in
                                            let starWidth: CGFloat = 25
                                            let newRating = Int(value.location.x / starWidth) + 1
                                            teachersRating = min(max(newRating, 1), 5)
                                        }
                                )
                        }
                        Text("Corps enseignant")
                        Spacer()
                    }
                    
                    HStack {
                        ForEach(1..<6) { index in
                            Image(systemName: index <= staff ? "star.fill" : "star")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                                .foregroundColor(index <= staff ? .yellow : .blue)
                                .onTapGesture {
                                    staff = index
                                }
                                .gesture(
                                    DragGesture()
                                        .onChanged { value in
                                            let starWidth: CGFloat = 25
                                            let newRating = Int(value.location.x / starWidth) + 1
                                            staff = min(max(newRating, 1), 5)
                                        }
                                )
                        }
                        Text("Personnel")
                        Spacer()
                    }
                    
                    HStack {
                        ForEach(1..<6) { index in
                            Image(systemName: index <= generalRating ? "star.fill" : "star")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                                .foregroundColor(index <= generalRating ? .yellow : .blue)
                                .onTapGesture {
                                    generalRating = index
                                }
                                .gesture(
                                    DragGesture()
                                        .onChanged { value in
                                            let starWidth: CGFloat = 25
                                            let newRating = Int(value.location.x / starWidth) + 1
                                            generalRating = min(max(newRating, 1), 5)
                                        }
                                )
                        }
                        
                        Text("Général")
                        Spacer()
                        
                        Button("Publier") {
                        }
                        .foregroundColor(.blue)
                        .font(.system(size: 20))
                        .frame(maxWidth: .infinity, alignment: .topTrailing)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 50)
                
                ZStack(alignment: .topLeading) {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.gray, lineWidth: 2)
                        .frame(width: geometry.size.width * 0.92, height: geometry.size.height * 0.89)
                    
                    TextEditor(text: $reviewText)
                        .font(.system(size: 21))
                        .padding()
                    
                    var color: Color? {
                        if reviewText.count > 500 {
                            return .red
                        } else if reviewText.count == 500 {
                            return .orange
                        } else {
                            return nil
                        }
                    }
                    
                    Text("\(reviewText.count)/500")
                        .font(.system(size: 13))
                        .foregroundColor(color)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                        .padding()
                }
                .padding(.bottom, 10)
                .padding(.horizontal)
            }
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(generalRating: .constant(1), teachersRating: .constant(1), staff: .constant(1))
    }
}
