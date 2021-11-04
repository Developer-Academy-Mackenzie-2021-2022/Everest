import SwiftUI
struct CashFlowView: View {
    // let data = [25.3, 30, 6, 7.4, 12.34]
    // let years = [2017, 2018, 2019, 2020, 2021]
    var data: [Float] = []
    var years: [String] = []
    var body: some View {
        GeometryReader { bounds in
            ZStack {
                VStack{
                    HStack(alignment: .bottom){
                        ForEach(0..<data.count) { index in
                            VStack {
                                Text(String(format: "%.2f", data[index]))
                                    .font(.caption)
                                LinearGradient(gradient: Gradient(colors: [Color(red: 0x4D / 255, green: 0xA8 / 255, blue: 0x8D / 255)]), startPoint:
                                    .topLeading, endPoint: .bottomTrailing)
                                    .frame(height: CGFloat(data[index])*5)
                                    .clipShape(Rectangle())
                                    .padding(.horizontal, 5)
                                HStack{
                                    Text(String(years[index]))
                                        .font(.caption)
                                }
                            }
                        }
                    }
                    .padding()
                }
                .background(
                    Color.white
                        .cornerRadius(25.0)
                        .opacity(0.3)
                )
            }
        }
    }
}
struct CashFlowChartView_Previews: PreviewProvider {
    static var previews: some View {
        CashFlowView(data: [25.3, 30.0, 6.0, 7.4, 12.34], years: ["2017", "2018", "2019", "2020", "2021"])
            .previewLayout(.fixed(width: 400, height: 400))
    }
}
