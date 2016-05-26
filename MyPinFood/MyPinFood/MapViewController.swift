//
//  MapViewController.swift
//  MyPinFood
//
//  Created by chetaofeng on 16/5/26.
//  Copyright © 2016年 gsunis. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController ,MKMapViewDelegate{
    
    var resturantStruct:ResutrantStruct!
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //地址转换
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(resturantStruct.location) { (placeMarks, error) in
            if error != nil{
                print(error)
            }else{
                if let placeMarks = placeMarks {
                    let placeMark = placeMarks[0]
                    
                    let annotation = MKPointAnnotation()
                    annotation.title = self.resturantStruct.name
                    annotation.subtitle = self.resturantStruct.type
                    
                    if let location = placeMark.location {
                        annotation.coordinate = location.coordinate
                        self.mapView.showAnnotations([annotation], animated: true)      //添加标注
                        self.mapView.selectAnnotation(annotation,animated: true)        //选中标注
                    }
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //自定义地图的标注
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let id = "我的图钉"
        
        if annotation is MKUserLocation {   //用户位置视图也是一个标注视图，排除对其的定制
            return nil
        }
        
        //为性能考虑，重用一个已存在的标注视图，如果不存在，则创建
        var annotationView = self.mapView.dequeueReusableAnnotationViewWithIdentifier(id) as? MKPinAnnotationView
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: id)
            annotationView?.canShowCallout = true //启用气球提示方式
        }
        
        //添加缩略图
        let leftIconView = UIImageView(frame: CGRectMake(0, 0, 53, 53))
        leftIconView.image = UIImage(named: self.resturantStruct.image)
        annotationView?.leftCalloutAccessoryView = leftIconView
        
        return annotationView
    }
}
