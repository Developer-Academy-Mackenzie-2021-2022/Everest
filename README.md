![Banner](https://github.com/Developer-Academy-Mackenzie-2021-2022/NC4/blob/feature/README/ReadMeFiles/Banner.png)

# Everest

## Status do projeto

O projeto se encontra em desenvolvimento pela turma 2021 da Developer Academy | Mackenzie.

## Features e explicação geral

Esse framework foi desenvolvido para facilitar a criação de gráficos utilizando SwiftUI. Com ele se podem criar os seguintes gráficos:

- [Áreas](https://github.com/Developer-Academy-Mackenzie-2021-2022/AreaExample)
    
    ![Area Chart](https://github.com/Developer-Academy-Mackenzie-2021-2022/NC4/blob/feature/README/ReadMeFiles/AreaChart.png | width=250)
    
- Barras
- [Dispersão](https://github.com/Developer-Academy-Mackenzie-2021-2022/DispersionExample)
    
    ![Gráfico de disperção](https://github.com/Developer-Academy-Mackenzie-2021-2022/NC4/blob/feature/README/ReadMeFiles/DispersionChart.png | width=250)
    
- Fluxo de Caixa
- HeatMap
- Histograma
- Radar
- [Linhas](https://github.com/Developer-Academy-Mackenzie-2021-2022/LinesExample)
    
    ![simulator_screenshot_9B396787-16DF-4FC0-A8C6-DDC50E38F65B.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/1cf20ee3-e936-45f2-95a0-2d86cfab865d/simulator_screenshot_9B396787-16DF-4FC0-A8C6-DDC50E38F65B.png)
    
- [Setores](https://github.com/Developer-Academy-Mackenzie-2021-2022/SectorExample)
    
    ![Simulator Screen Shot - iPhone 12 - 2021-11-04 at 16.11.56.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/e7ed0302-1d17-4edf-b356-658a6cf6e54a/Simulator_Screen_Shot_-_iPhone_12_-_2021-11-04_at_16.11.56.png)
    
- [Velas](https://github.com/Developer-Academy-Mackenzie-2021-2022/CandleSticksExample)
    
    ![Simulator Screen Shot - iPhone 12 - 2021-11-04 at 16.05.59.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/0f81967f-1ada-4d59-97e2-d9c44d7b0529/Simulator_Screen_Shot_-_iPhone_12_-_2021-11-04_at_16.05.59.png)
    

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
