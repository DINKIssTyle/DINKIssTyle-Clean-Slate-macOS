import AppKit

class AppDelegate: NSObject, NSApplicationDelegate {
    
    var statusItem: NSStatusItem!
    var overlayWindows: [OverlayWindow] = []
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        setupStatusMenu()
        setupOverlays()
        
        NSApplication.shared.setActivationPolicy(.accessory)
        
        // Handle screen changes
        NotificationCenter.default.addObserver(self, selector: #selector(screenConfigurationChanged), name: NSApplication.didChangeScreenParametersNotification, object: nil)
    }
    
    func setupStatusMenu() {
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        if let button = statusItem.button {
        button.image = NSImage(systemSymbolName: "square.fill.on.square.fill", accessibilityDescription: "Clean Slate")
        }
        
        let menu = NSMenu()
        menu.addItem(withTitle: "About Clean Slate", action: #selector(openAbout), keyEquivalent: "")
        menu.addItem(NSMenuItem.separator())
        
        menu.addItem(withTitle: "Pick Color...", action: #selector(pickColor), keyEquivalent: "")
        menu.addItem(withTitle: "Toggle Show/Hide", action: #selector(toggleVisibility), keyEquivalent: "")
        menu.addItem(NSMenuItem.separator())
        menu.addItem(withTitle: "Quit", action: #selector(quitApp), keyEquivalent: "")
        
        statusItem.menu = menu
    }
    
    @objc func openAbout() {
        NSApplication.shared.activate(ignoringOtherApps: true)
        if aboutWindowController == nil {
             aboutWindowController = AboutWindow()
        }
        aboutWindowController?.makeKeyAndOrderFront(nil)
    }
    
    var aboutWindowController: NSWindow?
    
    @objc func pickColor() {
        let colorPanel = NSColorPanel.shared
        colorPanel.color = ColorManager.shared.currentColor
        colorPanel.setTarget(self)
        colorPanel.setAction(#selector(colorPanelAction(_:)))
        colorPanel.orderFront(nil)
        NSApplication.shared.activate(ignoringOtherApps: true)
    }
    
    @objc func colorPanelAction(_ sender: NSColorPanel) {
        ColorManager.shared.currentColor = sender.color
    }
    
    @objc func toggleVisibility() {
        for window in overlayWindows {
            if window.isVisible {
                window.orderOut(nil)
            } else {
                window.orderFront(nil)
            }
        }
    }
    
    @objc func quitApp() {
        NSApplication.shared.terminate(nil)
    }
    
    @objc func screenConfigurationChanged() {
        // Re-setup windows when screens change
        setupOverlays()
    }
    
    func setupOverlays() {
        // Close existing
        for window in overlayWindows {
            window.close()
        }
        overlayWindows.removeAll()
        
        // create for each screen
        for screen in NSScreen.screens {
            let win = OverlayWindow(screen: screen)
            win.orderFront(nil)
            overlayWindows.append(win)
        }
    }
}
