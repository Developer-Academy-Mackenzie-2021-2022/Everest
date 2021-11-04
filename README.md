![Banner](https://github.com/Developer-Academy-Mackenzie-2021-2022/NC4/blob/feature/README/ReadMeFiles/Banner.png)

# Everest

## Status do projeto

O projeto se encontra em desenvolvimento pela turma 2021 da Developer Academy | Mackenzie.

## Features e explicação geral

Esse framework foi desenvolvido para facilitar a criação de gráficos utilizando SwiftUI. Com ele se podem criar os seguintes gráficos:

- [Áreas](https://github.com/Developer-Academy-Mackenzie-2021-2022/AreaExample)
    
    <img src="https://github.com/Developer-Academy-Mackenzie-2021-2022/NC4/blob/feature/README/ReadMeFiles/AreaChart.png" height="400" />
    
- Barras
- [Dispersão](https://github.com/Developer-Academy-Mackenzie-2021-2022/DispersionExample)
    
    <img src="https://github.com/Developer-Academy-Mackenzie-2021-2022/NC4/blob/feature/README/ReadMeFiles/DispersionChart.png" height="400" />
    
- Fluxo de Caixa
- HeatMap
- Histograma
- Radar
- [Linhas](https://github.com/Developer-Academy-Mackenzie-2021-2022/LinesExample)
        
    <img src="https://github.com/Developer-Academy-Mackenzie-2021-2022/NC4/blob/feature/README/ReadMeFiles/LineChart.png" height="400" />
    
- [Setores](https://github.com/Developer-Academy-Mackenzie-2021-2022/SectorExample)
    
    <img src="https://github.com/Developer-Academy-Mackenzie-2021-2022/NC4/blob/feature/README/ReadMeFiles/SectorChart.png" height="400" />
    
- [Velas](https://github.com/Developer-Academy-Mackenzie-2021-2022/CandleSticksExample)
    
    <img src="https://github.com/Developer-Academy-Mackenzie-2021-2022/NC4/blob/feature/README/ReadMeFiles/CandleChart.png" height="400" />
    

## Requisitos mínimos

- iOS 13.0+
- MacOS 10.15+
- Xcode 11+

## Como Instalar

### Importando através do Xcode

1. Dentro de um projeto, clique em "File"
2. Clique em "Add Packages..."
3. Dentro da janela de seleção copie a URL "[https://github.com/Developer-Academy-Mackenzie-2021-2022/NC4](https://github.com/Developer-Academy-Mackenzie-2021-2022/NC4)"
4. Configure a "Dependency Rule" para "Up to the next major" e coloque a versão 1.0.0

Após isso é possível ir em "Packages" e selecionar "Update Package Versions".

### Importando através do Package.swift

Caso você não possua um arquivo `Package.swift` , crie um e adicione o `.package` a URL seguir.

`import PackageDescription

let package = Package(
    ...
    dependencies: [
        .package(url: "https://github.com/Developer-Academy-Mackenzie-2021-2022/NC4", "1.0.0")
    ],
    ...
)`

## Licença

MIT
