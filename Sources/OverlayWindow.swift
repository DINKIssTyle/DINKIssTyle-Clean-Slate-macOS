import AppKit

class OverlayWindow: NSWindow {
    
    init(screen: NSScreen) {
        let contentRect = screen.frame
        super.init(contentRect: contentRect,
                   styleMask: [.borderless],
                   backing: .buffered,
                   defer: false)
        
        self.backgroundColor = ColorManager.shared.currentColor
        self.level = NSWindow.Level(Int(CGWindowLevelForKey(.desktopIconWindow)) + 1)
        self.collectionBehavior = [.canJoinAllSpaces, .stationary, .ignoresCycle]
        self.ignoresMouseEvents = true // Let clicks pass through if needed, though usually we want to block interaction with desktop icons. 
        // Wait, if it's a "screen cleaner", maybe we just want to hide visual clutter for screenshots.
        // User said: "background color... unneccessary apps, tools, icons... invisible".
        // Usually these apps prevent clicking through to desktop artifacts, but allow clicking other windows on top.
        // If ignoresMouseEvents is true, we click through to the messy desktop. Let's keep it false (default) or explicitly false to "cover" them interactively too?
        // Actually, if we want to "hide" icons, simply drawing over them is enough visually.
        // If strictly for screenshots, blocking clicks is fine.
        self.ignoresMouseEvents = false 
        
        NotificationCenter.default.addObserver(self, selector: #selector(colorDidChange), name: .colorDidChange, object: nil)
    }
    
    @objc private func colorDidChange() {
        self.backgroundColor = ColorManager.shared.currentColor
    }
    
    override func constrainFrameRect(_ frameRect: NSRect, to screen: NSScreen?) -> NSRect {
        return frameRect // Prevent resizing or moving
    }
    
    // Ensure we don't become key
    override var canBecomeKey: Bool {
        return false
    }
    
    override var canBecomeMain: Bool {
        return false
    }
}
