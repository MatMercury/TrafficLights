
import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet var redLightView: UIView!
    @IBOutlet var yellowLightView: UIView!
    @IBOutlet var greenLightView: UIView!
    
    @IBOutlet var changeLightButton: UIButton!
    
    private var currentLight = CurrentLight.red
    private var lightIsOn = 1.0
    private var lightIsOff = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeLightButton.layer.cornerRadius = 15

    }
    
    override func viewWillLayoutSubviews() {
        redLightView.layer.cornerRadius = redLightView.frame.width / 2
        yellowLightView.layer.cornerRadius = yellowLightView.frame.width / 2
        greenLightView.layer.cornerRadius = greenLightView.frame.height / 2
    }
    
    @IBAction func changeLightButtonPressed() {
        if changeLightButton.currentTitle == "Change Light" {
            changeLightButton.setTitle("Next light", for: .normal)
        }
        
        switch currentLight {
        case .red:
            greenLightView.alpha = lightIsOff
            redLightView.alpha = lightIsOn
            currentLight = .yellow
        case .yellow:
            redLightView.alpha = lightIsOff
            yellowLightView.alpha = lightIsOn
            currentLight = .green
        case .green:
            yellowLightView.alpha = lightIsOff
            greenLightView.alpha = lightIsOn
            currentLight = .red
        }
    }
}

// MARK: CurrentLight
extension ViewController {
    private enum CurrentLight {
        case red, yellow, green
    }
}
