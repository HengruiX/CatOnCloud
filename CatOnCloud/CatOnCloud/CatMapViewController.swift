import UIKit
import MapKit
import Alamofire

class CatMapViewController: UIViewController{
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var nameDescription: UILabel!
    
    
    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            
        }
   
    let picker = UIImagePickerController()
    var im_id :[Int]=[]
    var image = UIImage()
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        let helper = ImageHelper()
        helper.uploadImage(image: chosenImage) { (i) in
            self.image = chosenImage
            self.im_id.insert(i, at: 0)
        }
        dismiss(animated:true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func upload(){
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        present(picker, animated: true, completion: nil)
    }
    
    
    func submit(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let baseURL = appDelegate.baseURL
        let parameters: [String: AnyObject] = [
            "name" : nameLabel as AnyObject,
            "description": nameDescription as AnyObject,
            "image_ids": im_id as AnyObject
        ]
        Alamofire.request("\(baseURL)/posts/create",method:.post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            
            self.navigationController?.popViewController(animated: true)
        }
    }

    @IBAction func uploadPicture(_ sender: UIButton) {
        upload()
    }
    
    @IBAction func submitCat(_ sender: UIButton) {
        submit()
    }
    
    
}
