import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageAnimation: UIImageView!
    
    var character: Model.Animation?
    
    override func viewWillAppear(_ animated: Bool) { // ?????
        super.viewWillAppear(animated)
        reloadInputViews()
        
        guard let character = character else { return }
        let cells = Model.shared.cells(for: character)
        imageAnimation.animationImages = cells
        imageAnimation.animationRepeatCount = 0
        imageAnimation.animationDuration = 4.0 // FIGURE THIS PART OUT
        imageAnimation.startAnimating()
        label.text = character.rawValue
    }
}
