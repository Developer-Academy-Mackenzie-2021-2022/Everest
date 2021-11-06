![Banner](https://user-images.githubusercontent.com/47531288/140594295-4eca1e1a-1f77-402a-a8f7-1aa408dc099f.png)

# Everest

## Status do projeto

O projeto se encontra em desenvolvimento pela turma 2021 da Developer Academy | Mackenzie.

## Features e explicação geral

Esse framework foi desenvolvido para facilitar a criação de gráficos utilizando SwiftUI. Com ele se podem criar os seguintes gráficos:

- [Áreas](https://github.com/Developer-Academy-Mackenzie-2021-2022/AreaExample)

    <img src="https://user-images.githubusercontent.com/47531288/140594305-90ac464b-063c-4923-bf3d-72e840f69955.png" height="400" />
    
- [Barras](https://github.com/Developer-Academy-Mackenzie-2021-2022/BarChartExemple)

    <img src="https://user-images.githubusercontent.com/47531288/140594343-5bc8ce67-c897-423f-b197-b878ad6751a8.png" height="400" />
    
- [Dispersão](https://github.com/Developer-Academy-Mackenzie-2021-2022/DispersionExample)

    <img src="https://user-images.githubusercontent.com/47531288/140594312-77f3e1db-9d7e-45f8-83d0-dbffa83fca62.png" height="400" />
    
- [Fluxo de Caixa](https://github.com/Developer-Academy-Mackenzie-2021-2022/CashFlowExample)

    <img src="https://user-images.githubusercontent.com/47531288/140594314-8dc06f7f-c5da-45cb-9b8f-015058d67c99.png" height="400" />

- [Heatmap](https://github.com/Developer-Academy-Mackenzie-2021-2022/HeatmapExample)

    <img src="https://user-images.githubusercontent.com/47531288/140594319-2bd27413-567e-4698-bddf-40f475670562.png" height="400" />
    
- [Histograma](https://github.com/Developer-Academy-Mackenzie-2021-2022/HistogramExample)

    <img src="https://user-images.githubusercontent.com/47531288/140594324-271e7969-8513-4869-b965-51cf8724b194.png" height="400" />    

- [Radar](https://github.com/Developer-Academy-Mackenzie-2021-2022/RadarExample)

    <img src="https://user-images.githubusercontent.com/47531288/140594325-720e789f-d445-4b6f-8538-91668ad5dbbf.png" height="400" />

- [Linhas](https://github.com/Developer-Academy-Mackenzie-2021-2022/LinesExample)

    <img src="https://user-images.githubusercontent.com/47531288/140594327-825d8da4-b6eb-4fa8-bed4-d87668df6f7f.png" height="400" />
    
- [Setores](https://github.com/Developer-Academy-Mackenzie-2021-2022/SectorExample)

    <img src="https://user-images.githubusercontent.com/47531288/140594331-bfe3fd95-6a76-42e1-a2ef-f3ebebac8073.png" height="400" />
    
- [Velas](https://github.com/Developer-Academy-Mackenzie-2021-2022/CandleSticksExample)

    <img src="https://user-images.githubusercontent.com/47531288/140594335-3d424d99-3635-468d-90a1-c3ff18ec9bfa.png" height="400" />
    

## Requisitos mínimos

- iOS 13.0+
- MacOS 10.15+
- Xcode 11+

## Como Instalar

### Importando através do Xcode

1. Dentro de um projeto, clique em "File"
2. Clique em "Add Packages..."
3. Dentro da janela de seleção copie a URL "[https://github.com/Developer-Academy-Mackenzie-2021-2022/Everest](https://github.com/Developer-Academy-Mackenzie-2021-2022/Everest)"
4. Configure a "Dependency Rule" para "Up to the next major" e coloque a versão 1.0.0

Após isso é possível ir em "Packages" e selecionar "Update Package Versions".

### Importando através do Package.swift

Caso você não possua um arquivo `Package.swift` , crie um e adicione o `.package` a URL seguir.

```swift 
import PackageDescription

let package = Package(
    ...
    dependencies: [
        .package(url: "https://github.com/Developer-Academy-Mackenzie-2021-2022/NC4", "1.0.0")
    ],
    ...
)
```

## Licença

MIT License
