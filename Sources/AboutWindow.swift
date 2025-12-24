import AppKit

class AboutWindow: NSWindow {
    
    init() {
        let width: CGFloat = 300
        let height: CGFloat = 320
        let rect = NSRect(x: 0, y: 0, width: width, height: height)
        
        super.init(contentRect: rect,
                   styleMask: [.titled, .closable, .fullSizeContentView],
                   backing: .buffered,
                   defer: false)
        
        self.titlebarAppearsTransparent = true
        self.title = ""
        self.isMovableByWindowBackground = true
        self.isReleasedWhenClosed = false 
        self.center()
        
        let visualEffect = NSVisualEffectView(frame: rect)
        visualEffect.material = .hudWindow
        visualEffect.state = .active
        visualEffect.autoresizingMask = [.width, .height]
        self.contentView = visualEffect
        
        setupUI(in: visualEffect)
    }
    
    private func setupUI(in view: NSView) {
        let stack = NSStackView()
        stack.orientation = .vertical
        stack.alignment = .centerX
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)
        
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        // Icon - Use app icon from bundle or fallback to SF Symbol
        var iconImg: NSImage? = NSApp.applicationIconImage
        if iconImg == nil {
            iconImg = NSImage(systemSymbolName: "app.fill", accessibilityDescription: "App Icon")
        }
        
        let iconView = NSImageView()
        iconView.image = iconImg
        iconView.imageScaling = .scaleProportionallyUpOrDown
        iconView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iconView.widthAnchor.constraint(equalToConstant: 96),
            iconView.heightAnchor.constraint(equalToConstant: 96)
        ])
        stack.addArrangedSubview(iconView)
        
        // App Name
        let nameLabel = NSTextField(labelWithString: "Clean Slate")
        nameLabel.font = NSFont.systemFont(ofSize: 24, weight: .bold)
        nameLabel.textColor = .labelColor
        stack.addArrangedSubview(nameLabel)
        
        // Build Date
        let dateKey = "BuildDate"
        let dateString = Bundle.main.object(forInfoDictionaryKey: dateKey) as? String ?? "Unknown"
        let dateLabel = NSTextField(labelWithString: "Build \(dateString)")
        dateLabel.font = NSFont.systemFont(ofSize: 13, weight: .medium)
        dateLabel.textColor = .secondaryLabelColor
        stack.addArrangedSubview(dateLabel)
        
        // Copyright
        let copyLabel = NSTextField(labelWithString: "(C) 2025 DINKI'ssTyle")
        copyLabel.font = NSFont.systemFont(ofSize: 11, weight: .regular)
        copyLabel.textColor = .tertiaryLabelColor
        stack.addArrangedSubview(copyLabel)
    }
}
