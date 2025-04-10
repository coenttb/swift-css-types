//
//  DisplayListitem Tests.swift
//  
//
//  Created on 04/02/2025.
//

import CSSTypeTypes
import Testing

@Suite("DisplayListitem Tests")
struct DisplayListitemTests {
    
    @Test("DisplayListitem enum has correct cases and raw values")
    func testEnumCases() {
        #expect(DisplayListitem.listItem.rawValue == "list-item")
        #expect(DisplayListitem.blockFlowListItem.rawValue == "block flow list-item")
        #expect(DisplayListitem.blockFlowRootListItem.rawValue == "block flow-root list-item")
        #expect(DisplayListitem.inlineFlowListItem.rawValue == "inline flow list-item")
        #expect(DisplayListitem.inlineFlowRootListItem.rawValue == "inline flow-root list-item")
    }
    
    @Test("DisplayListitem description returns raw value")
    func testDescription() {
        #expect(DisplayListitem.listItem.description == "list-item")
        #expect(DisplayListitem.blockFlowListItem.description == "block flow list-item")
        #expect(DisplayListitem.blockFlowRootListItem.description == "block flow-root list-item")
        #expect(DisplayListitem.inlineFlowListItem.description == "inline flow list-item")
        #expect(DisplayListitem.inlineFlowRootListItem.description == "inline flow-root list-item")
    }
    
    @Test("DisplayListitem conforms to Equatable")
    func testEquatable() {
        // Same cases should be equal
        let display1 = DisplayListitem.listItem
        let display2 = DisplayListitem.listItem
        #expect(display1 == display2)
        
        // Different cases should not be equal
        let display3 = DisplayListitem.blockFlowListItem
        #expect(display1 != display3)
    }
    
    @Test("DisplayListitem can be created from raw values")
    func testRawValueInitialization() {
        #expect(DisplayListitem(rawValue: "list-item") == DisplayListitem.listItem)
        #expect(DisplayListitem(rawValue: "block flow list-item") == DisplayListitem.blockFlowListItem)
        #expect(DisplayListitem(rawValue: "block flow-root list-item") == DisplayListitem.blockFlowRootListItem)
        #expect(DisplayListitem(rawValue: "inline flow list-item") == DisplayListitem.inlineFlowListItem)
        #expect(DisplayListitem(rawValue: "inline flow-root list-item") == DisplayListitem.inlineFlowRootListItem)
        #expect(DisplayListitem(rawValue: "invalid") == nil)
    }
    
    @Test("DisplayListitem is used correctly in CSS display property")
    func testUsageInContext() {
        // Used in display property
        let displayListItem = "display: \(DisplayListitem.listItem)"
        #expect(displayListItem == "display: list-item")
        
        let displayBlockFlowListItem = "display: \(DisplayListitem.blockFlowListItem)"
        #expect(displayBlockFlowListItem == "display: block flow list-item")
    }
    
    @Test("DisplayListitemFactory creates correct combinations")
    func testFactoryMethod() {
        // Test block + flow
        let blockFlow = DisplayListitemFactory.create(outer: .block, inner: .flow)
        #expect(blockFlow == DisplayListitem.blockFlowListItem)
        #expect(blockFlow.description == "block flow list-item")
        
        // Test block + flowRoot
        let blockFlowRoot = DisplayListitemFactory.create(outer: .block, inner: .flowRoot)
        #expect(blockFlowRoot == DisplayListitem.blockFlowRootListItem)
        #expect(blockFlowRoot.description == "block flow-root list-item")
        
        // Test inline + flow
        let inlineFlow = DisplayListitemFactory.create(outer: .inline, inner: .flow)
        #expect(inlineFlow == DisplayListitem.inlineFlowListItem)
        #expect(inlineFlow.description == "inline flow list-item")
        
        // Test inline + flowRoot
        let inlineFlowRoot = DisplayListitemFactory.create(outer: .inline, inner: .flowRoot)
        #expect(inlineFlowRoot == DisplayListitem.inlineFlowRootListItem)
        #expect(inlineFlowRoot.description == "inline flow-root list-item")
        
        // Test unsupported combination falls back to list-item
        let unsupported = DisplayListitemFactory.create(outer: .block, inner: .flex)
        #expect(unsupported == DisplayListitem.listItem)
    }
    
    @Test("DisplayListitem cases match CSS specification")
    func testCSSSpecification() {
        // Test that we have all the important spec-defined values for display-listitem
        #expect(DisplayListitem.listItem.description == "list-item") // Simple list item
        #expect(DisplayListitem.blockFlowListItem.description == "block flow list-item") // Block flow list item
        #expect(DisplayListitem.blockFlowRootListItem.description == "block flow-root list-item") // Block flow-root list item
        #expect(DisplayListitem.inlineFlowListItem.description == "inline flow list-item") // Inline flow list item
        #expect(DisplayListitem.inlineFlowRootListItem.description == "inline flow-root list-item") // Inline flow-root list item
    }
}
