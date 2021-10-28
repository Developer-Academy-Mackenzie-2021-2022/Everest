import SwiftUI

public struct AreaGraph: View {
    public var datas: [[CGFloat]]
    public var titulo: String
    public var legendas: [String]
    public var nomesEixoX: [String]
    public var colors: [Color] = [Color.red]
    
    public init(datas: [[CGFloat]] = [[10.0,13.0,15.0]], titulo: String = "Title", legendas: [String] = ["legenda"], nomeseixoX: [String] = ["nome"]) {
        self.datas = datas
        self.titulo = titulo
        self.legendas = legendas
        self.nomesEixoX = nomeseixoX
    }
    public var body: some View {
        Text("\(datas[0][0])")
    }
}

struct AreaGraph_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            AreaGraph()
        }
    }
}
