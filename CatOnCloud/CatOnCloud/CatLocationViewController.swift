import UIKit
import MapKit
import Alamofire

class CatLocationViewController: UIViewController, CLLocationManagerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var theMap: MKMapView!
    
    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (CLLocationManager.locationServicesEnabled()){
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
            
        }
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!){
        let location = locations.last as! CLLocation
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        self.theMap.setRegion(region, animated:true)
        
        
    }
    
    func submit(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let baseURL = appDelegate.baseURL
        let parameters: [String: AnyObject] = [  :      ]
        Alamofire.request("\(baseURL)/posts/create",method:.post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func uploadLocation(_ sender: UIButton) {
        submit()
    }
    
    
}
