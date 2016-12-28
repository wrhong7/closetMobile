import UIKit
import Foundation

var indexCount = 0

//Loading Blogpost Here
var posts = [String]()

//File Goes Here
let file = "file_DEV_3.txt"

//URL string of the post that the user is currently viewing
var currentURL = String()

class ViewController: UIViewController {
    
    @IBOutlet var imageView:UIImageView?
    @IBOutlet var closetImageView:UIImageView?
    @IBOutlet var changeImageButtonNext:UIButton?
    @IBOutlet var changeImageButtonPrev:UIButton?
    @IBOutlet var addToClosetButton:UIButton?
    @IBOutlet var moveToClosetButton:UIButton?
    
    
    @IBAction func changeImageViewNext(sender: UIButton) {
        changeImageToNext()
    }
    
    @IBAction func changeImageViewNext(gesture: UIGestureRecognizer) {
        changeImageToNext()
    }
    
    @IBAction func imageTappedToAddImageToCloset(gesture: UITapGestureRecognizer) {
        addToClosetFunction()
    }
    
    @IBAction func changeImageViewPrev(sender: UIButton) {
        changeImageToPrev()
    }
    
    @IBAction func changeImageViewPrev(gesture: UIGestureRecognizer) {
        changeImageToPrev()
    }
    
    @IBAction func saveToCloset(sender: UIButton) {
        addToClosetFunction()
    }
    
    func changeImageToNext() {
        
        indexCount += 1
        
        currentURL = posts[indexCount]
        
        let url = URL(string: posts[indexCount] )
        
        let data = try? Data(contentsOf: url!)
        
        imageView?.image = UIImage(data: data!)
        
        if (indexCount % 19 == 0) {
            
            fetchTumblrPostForSurfView (startsAt: "\(indexCount / 19 * 20)")
            
        }
    }
    
    func changeImageToPrev() {
        indexCount = indexCount - 1
        
        currentURL = posts[indexCount]
        
        let url = URL(string: posts[indexCount] )
        
        let data = try? Data(contentsOf: url!)
        
        imageView?.image = UIImage(data: data!)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //Fetche images here. Deploy images to the surf controller.
        
        fetchTumblrPostForSurfView (startsAt: "0")
        
        //Loading from the locally saved closet file
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let path = dir.appendingPathComponent(file)
            
            do {
                let stringJSONText = try String (contentsOf: path, encoding: String.Encoding.utf8)
                
                var JSONElements = stringJSONText.components(separatedBy: "\n")
                let arrayLength = JSONElements.count
                
                JSONElements.remove(at: arrayLength - 1)
                JSONElements.remove(at: 0)
                
                for element in JSONElements {
                    let elementWithoutSpace = element.replacingOccurrences(of: " ", with: "")
                    let elementWithoutComma = elementWithoutSpace.replacingOccurrences(of: ",", with: "")
                    let elementWithoutQuotation = elementWithoutComma.replacingOccurrences(of: "\"", with: "")
                    let elementWihtoutBackslash = elementWithoutQuotation.replacingOccurrences(of: "\\", with: "")
                    closetArray.append(elementWihtoutBackslash)
                }
            }
            
            catch {
                print("Error has been occured while accessing to the local file. Please debug.")
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

