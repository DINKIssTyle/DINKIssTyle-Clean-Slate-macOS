import AppKit

class ColorManager {
    static let shared = ColorManager()
    
    private let colorKey = "selectedBackgroundColor"
    
    var currentColor: NSColor {
        get {
            if let colorData = UserDefaults.standard.data(forKey: colorKey),
               let color = try? NSKeyedUnarchiver.unarchivedObject(ofClass: NSColor.self, from: colorData) {
                return color
            }
            return NSColor(calibratedRed: 0.1, green: 0.1, blue: 0.1, alpha: 1.0) // Default dark gray
        }
        set {
            if let colorData = try? NSKeyedArchiver.archivedData(withRootObject: newValue, requiringSecureCoding: false) {
                UserDefaults.standard.set(colorData, forKey: colorKey)
                NotificationCenter.default.post(name: .colorDidChange, object: nil)
            }
        }
    }
}

extension Notification.Name {
    static let colorDidChange = Notification.Name("colorDidChange")
}
