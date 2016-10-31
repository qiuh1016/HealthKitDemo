//
//  DashboardViewController.swift
//  HealthKitDemo
//
//  Created by qiuhong on 19/10/2016.
//  Copyright © 2016 CETCME. All rights reserved.
//

import UIKit
import SwiftCharts

class DashboardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        initPointView()
//        initBarChart()
        initMutiplayChart()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func initPointView() {
        let pointView = PointerView(frame: CGRect(x: 0, y: 0, width: 200, height: 200), radius: 50, progress: 20, color: UIColor.red.cgColor)
        self.view.addSubview(pointView)
    }
    
    func initBarChart() {
        let chartConfig = BarsChartConfig(
            valsAxisConfig: ChartAxisConfig(from: 0, to: 8, by: 2)
        )
        
        let chart = BarsChart(
            frame: CGRect(x: 0, y: 70, width: 300, height: 500),
            chartConfig: chartConfig,
            xTitle: "X axis",
            yTitle: "Y axis",
            bars: [
                ("A", 2),
                ("B", 4.5),
                ("C", 3),
                ("D", 5.4),
                ("E", 6.8),
                ("F", 0.5)
            ],
            color: UIColor.red,
            barWidth: 20
        )
        
        self.view.addSubview(chart.view)
    }
    
    func initMutiplayChart() {
        let chartPoints: [ChartPoint] = [(2, 2), (4, 4), (6, 6), (8, 10), (12, 14)].map{ChartPoint(x: ChartAxisValueInt($0.0), y: ChartAxisValueInt($0.1))}
        
        let xValues = stride(from: 0, to: 16, by: 2).map {ChartAxisValueInt($0)}
        let yValues = stride(from: 0, to: 16, by: 2).map {ChartAxisValueInt($0)}
        
        let labelSettings = ChartLabelSettings(font: UIFont.systemFont(ofSize: 14))
        
        // create axis models with axis values and axis title
        let xModel = ChartAxisModel(axisValues: xValues, axisTitleLabel: ChartAxisLabel(text: "Axis title", settings: labelSettings))
        let yModel = ChartAxisModel(axisValues: yValues, axisTitleLabel: ChartAxisLabel(text: "Axis title", settings: labelSettings.defaultVertical()))
        
        let chartFrame = CGRect(x:20, y:100, width:300, height:400)
        
        let chartSettings = ChartSettings()
        chartSettings.axisStrokeWidth = 0.2
        chartSettings.top = 20
        chartSettings.trailing = 20
        // ...
        
        let coordsSpace = ChartCoordsSpaceLeftBottomSingleAxis(chartSettings: chartSettings, chartFrame: chartFrame, xModel: xModel, yModel: yModel)
        let (xAxis, yAxis, innerFrame) = (coordsSpace.xAxis, coordsSpace.yAxis, coordsSpace.chartInnerFrame)
        
        // create layer with line
        let lineModel = ChartLineModel(chartPoints: chartPoints, lineColor: UIColor(red: 0.4, green: 0.4, blue: 1, alpha: 0.2), lineWidth: 3, animDuration: 0.7, animDelay: 0)
        let chartPointsLineLayer = ChartPointsLineLayer(xAxis: xAxis, yAxis: yAxis, innerFrame: innerFrame, lineModels: [lineModel])
        
        // creates custom view for each chartpoint
        let myCustomViewGenerator = {(chartPointModel: ChartPointLayerModel, layer: ChartPointsLayer, chart: Chart) -> UIView? in
            let center = chartPointModel.screenLoc
            let label = UILabel(frame: CGRect(x:center.x - 20, y:center.y - 10, width:40, height:20))
            label.backgroundColor = UIColor.green
            label.textAlignment = NSTextAlignment.center
            label.text = chartPointModel.chartPoint.description
            label.font = UIFont(name: "Arial", size: 14)
            return label
        }
        
        // create layer that uses the view generator
        let myCustomViewLayer = ChartPointsViewsLayer(xAxis: xAxis, yAxis: yAxis, innerFrame: innerFrame, chartPoints: chartPoints, viewGenerator: myCustomViewGenerator, displayDelay: 0, delayBetweenItems: 0.05)
        
        
        // create layer with guidelines
        let settings = ChartGuideLinesDottedLayerSettings(linesColor: UIColor.black, linesWidth: 5)
        let guidelinesLayer = ChartGuideLinesDottedLayer(xAxis: xAxis, yAxis: yAxis, innerFrame: innerFrame, settings: settings)
        
        let chart = Chart(
            frame: chartFrame,
            layers: [
                xAxis,
                yAxis,
                guidelinesLayer,
                chartPointsLineLayer,
                myCustomViewLayer
            ]
        )
        
        self.view.addSubview(chart.view)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
