![Banner](https://github.com/Developer-Academy-Mackenzie-2021-2022/NC4/blob/feature/README/ReadMeFiles/Banner.png)

# Everest

## Status do projeto

O projeto se encontra em desenvolvimento pela turma 2021 da Developer Academy | Mackenzie.

## Features e explicação geral

Esse framework foi desenvolvido para facilitar a criação de gráficos utilizando SwiftUI. Com ele se podem criar os seguintes gráficos:

- [Áreas](https://github.com/Developer-Academy-Mackenzie-2021-2022/AreaExample)
    
    ![Gráfico de área](https://github.com/Developer-Academy-Mackenzie-2021-2022/NC4/blob/feature/README/ReadMeFiles/AreaChart.png)
    
- Barras
- [Dispersão](https://github.com/Developer-Academy-Mackenzie-2021-2022/DispersionExample)
    
    ![Gráfico de disperção](https://github.com/Developer-Academy-Mackenzie-2021-2022/NC4/blob/feature/README/ReadMeFiles/DispersionChart.png)
    
- Fluxo de Caixa
- HeatMap
- Histograma
- Radar
- [Linhas](https://github.com/Developer-Academy-Mackenzie-2021-2022/LinesExample)
    
    ![Gráfico de linhas](https://github.com/Developer-Academy-Mackenzie-2021-2022/NC4/blob/feature/README/ReadMeFiles/LineChart.png)
    
- [Setores](https://github.com/Developer-Academy-Mackenzie-2021-2022/SectorExample)
    
    ![Gráfico de setores](https://github.com/Developer-Academy-Mackenzie-2021-2022/NC4/blob/feature/README/ReadMeFiles/SectorChart.png)
    
- [Velas](https://github.com/Developer-Academy-Mackenzie-2021-2022/CandleSticksExample)
    
    ![Gráfico de velas](https://github.com/Developer-Academy-Mackenzie-2021-2022/NC4/blob/feature/README/ReadMeFiles/CandleChart.png)
    

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
