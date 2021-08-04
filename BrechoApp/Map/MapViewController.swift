//
//  MapViewController.swift
//  BrechoApp
//
//  Created by Gabriele Namie on 24/07/21.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
   // var myView = MapView()

    @IBOutlet weak var Map: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let annotation = MKPointAnnotation()
        annotation.subtitle = "I Need Brechó"
        annotation.coordinate = CLLocationCoordinate2D(latitude: -23.558904, longitude: -46.6829848)
        Map.addAnnotation(annotation)

        let annotation2 = MKPointAnnotation()
        annotation2.subtitle = "Brechó Gato Preto"
        annotation2.coordinate = CLLocationCoordinate2D(latitude: -23.55590, longitude: -46.65658)
        Map.addAnnotation(annotation2)
        
        let annotation3 = MKPointAnnotation()
        annotation3.subtitle = "Rua da Saudade Brechó"
        annotation3.coordinate = CLLocationCoordinate2D(latitude: -23.5334736, longitude:  -46.7804437)
        Map.addAnnotation(annotation3)
        
        let annotation4 = MKPointAnnotation()
        annotation4.subtitle = "Luz da Villa"
        annotation4.coordinate = CLLocationCoordinate2D(latitude: -23.5880026, longitude: -46.6452266)
        Map.addAnnotation(annotation4)
        
        let annotation5 = MKPointAnnotation()
        annotation5.subtitle = "Brechó Vó Judith"
        annotation5.coordinate = CLLocationCoordinate2D(latitude: -23.546658119625764, longitude: -46.689555644989014)
        Map.addAnnotation(annotation5)
        
        let annotation6 = MKPointAnnotation()
        annotation6.subtitle = "Asa Brechó"
        annotation6.coordinate = CLLocationCoordinate2D(latitude: -23.5673562, longitude: -46.6872085)
        Map.addAnnotation(annotation6)
        
        let annotation7 = MKPointAnnotation()
        annotation7.subtitle = "Brechollé"
        annotation7.coordinate = CLLocationCoordinate2D(latitude: -23.4926926, longitude: -46.6185053)
        Map.addAnnotation(annotation7)
        
        let annotation8 = MKPointAnnotation()
        annotation8.subtitle = "Brechó Colmeia"
        annotation8.coordinate = CLLocationCoordinate2D(latitude: -23.5414187, longitude: -46.6464735)
        Map.addAnnotation(annotation8)
        
        let annotation9 = MKPointAnnotation()
        annotation9.subtitle = "B.Luxo"
        annotation9.coordinate = CLLocationCoordinate2D(latitude: -23.5617576, longitude: -46.664126)
        Map.addAnnotation(annotation9)

        let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 10000, longitudinalMeters: 20000)
        Map.setRegion(region, animated: true)
        
    }
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        guard annotation is MKMapPoint else {return nil}
//        let identi
//    }
}
