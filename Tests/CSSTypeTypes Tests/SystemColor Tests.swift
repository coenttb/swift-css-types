//
//  SystemColor Tests.swift
//  
//
//  Created on 03/26/2025.
//

import CSSTypeTypes
import Testing

@Suite("SystemColor Tests")
struct SystemColorTests {

    @Test("Basic system colors render correctly")
    func testBasicSystemColors() {
        #expect(SystemColor.canvas.description == "Canvas")
        #expect(SystemColor.canvasText.description == "CanvasText")
        #expect(SystemColor.buttonBorder.description == "ButtonBorder")
        #expect(SystemColor.buttonFace.description == "ButtonFace")
        #expect(SystemColor.buttonText.description == "ButtonText")
    }

    @Test("Highlight and selection system colors render correctly")
    func testHighlightSystemColors() {
        #expect(SystemColor.highlight.description == "Highlight")
        #expect(SystemColor.highlightText.description == "HighlightText")
        #expect(SystemColor.selectedItem.description == "SelectedItem")
        #expect(SystemColor.selectedItemText.description == "SelectedItemText")
    }

    @Test("Link and text system colors render correctly")
    func testLinkSystemColors() {
        #expect(SystemColor.linkText.description == "LinkText")
        #expect(SystemColor.activeText.description == "ActiveText")
        #expect(SystemColor.visitedText.description == "VisitedText")
    }

    @Test("Input field system colors render correctly")
    func testFieldSystemColors() {
        #expect(SystemColor.field.description == "Field")
        #expect(SystemColor.fieldText.description == "FieldText")
    }

    @Test("Accent system colors render correctly")
    func testAccentSystemColors() {
        #expect(SystemColor.accentColor.description == "AccentColor")
        #expect(SystemColor.accentColorText.description == "AccentColorText")
    }

    @Test("Mark system colors render correctly")
    func testMarkSystemColors() {
        #expect(SystemColor.mark.description == "Mark")
        #expect(SystemColor.markText.description == "MarkText")
    }

    @Test("Deprecated system colors render correctly")
    func testDeprecatedSystemColors() {
        #expect(SystemColor.activeBorder.description == "ActiveBorder")
        #expect(SystemColor.activeCaption.description == "ActiveCaption")
        #expect(SystemColor.appWorkspace.description == "AppWorkspace")
        #expect(SystemColor.background.description == "Background")
        #expect(SystemColor.buttonHighlight.description == "ButtonHighlight")
        #expect(SystemColor.buttonShadow.description == "ButtonShadow")
        #expect(SystemColor.captionText.description == "CaptionText")
    }

    @Test("SystemColor initialization from raw value works correctly")
    func testRawValueInitializer() {
        let canvas = SystemColor(rawValue: "Canvas")
        #expect(canvas.rawValue == "Canvas")
        #expect(canvas.description == "Canvas")

        // Custom system color
        let customColor = SystemColor(rawValue: "CustomColor")
        #expect(customColor.rawValue == "CustomColor")
        #expect(customColor.description == "CustomColor")
    }

    @Test("SystemColor conforms to Hashable")
    func testHashable() {
        let canvas1 = SystemColor.canvas
        let canvas2 = SystemColor.canvas
        let field = SystemColor.field

        #expect(canvas1 == canvas2)
        #expect(canvas1 != field)
        #expect(SystemColor.mark != SystemColor.markText)
    }
}
