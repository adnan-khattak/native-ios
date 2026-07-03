import UIKit
import AVFoundation

class ViewController: UIViewController {

    var audioPlayer: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func playSound(soundName: String) {

        guard let url = Bundle.main.url(forResource: soundName, withExtension: "wav") else {
            print("❌ File not found: \(soundName).wav")
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Error: \(error)")
        }
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1.0
        }
        guard let soundName = sender.currentTitle else { return }

        playSound(soundName: soundName)
    }
}
