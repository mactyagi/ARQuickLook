

import UIKit
import QuickLook

class ViewController: UIViewController,
                      UITableViewDataSource, UITableViewDelegate, QLPreviewControllerDelegate, QLPreviewControllerDataSource {
 
  
  
  @IBOutlet var tableView: UITableView!

  let modelNames = ["Teapot", "Gramophone", "Pig"]
  var modelImages = [UIImage]()
  var modelIndex = 0;
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    // Store Images
    for modelName in modelNames {
      if let modelImage = UIImage(named: "\(modelName).jpg") {
        modelImages.append(modelImage)
      }
    }
    
    tableView.dataSource = self
    tableView.delegate = self
    tableView.reloadData()
  }
  
  // MARK: - UITableViewDataSource
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return modelNames.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "GalleryReusableCell")! as! GalleryTableViewCell
    
    cell.modelImage.image = modelImages[indexPath.row]
    cell.modelName.text = modelNames[indexPath.row]

    return cell
  }
  
  // MARK: - UITableViewDelegate
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    modelIndex = indexPath.row
  }
  
  // MARK: - QLPreviewControllerDataSource
 
  func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
    1
  }
  
  func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> any QLPreviewItem {
    let url = Bundle.main.url(forResource: modelNames[modelIndex], withExtension: "usdz")!
    return url as QLPreviewItem
  }
  
}

