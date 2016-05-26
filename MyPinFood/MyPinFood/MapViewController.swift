//
//  MapViewController.swift
//  MyPinFood
//
//  Created by chetaofeng on 16/5/26.
//  Copyright © 2016年 gsunis. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
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

}
