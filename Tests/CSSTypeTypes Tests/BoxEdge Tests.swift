//
//  BoxEdge Tests.swift
//  
//
//  Created on 03/26/2025.
//

import CSSTypeTypes
import Testing

@Suite("BoxEdge Tests")
struct BoxEdgeTests {
    
    @Test("Main BoxEdge values render correctly")
    func testMainBoxEdgeValues() {
        #expect(BoxEdge.contentBox.description == "content-box")
        #expect(BoxEdge.paddingBox.description == "padding-box")
        #expect(BoxEdge.borderBox.description == "border-box")
        #expect(BoxEdge.marginBox.description == "margin-box")
        #expect(BoxEdge.fillBox.description == "fill-box")
        #expect(BoxEdge.strokeBox.description == "stroke-box")
        #expect(BoxEdge.viewBox.description == "view-box")
    }
    
    @Test("BoxEdge.Visual values render correctly")
    func testVisualBoxEdgeValues() {
        #expect(BoxEdge.Visual.contentBox.description == "content-box")
        #expect(BoxEdge.Visual.paddingBox.description == "padding-box")
        #expect(BoxEdge.Visual.borderBox.description == "border-box")
    }
    
    @Test("BoxEdge.Layout values render correctly")
    func testLayoutBoxEdgeValues() {
        #expect(BoxEdge.Layout.contentBox.description == "content-box")
        #expect(BoxEdge.Layout.paddingBox.description == "padding-box")
        #expect(BoxEdge.Layout.borderBox.description == "border-box")
        #expect(BoxEdge.Layout.marginBox.description == "margin-box")
    }
    
    @Test("BoxEdge.Paint values render correctly")
    func testPaintBoxEdgeValues() {
        #expect(BoxEdge.Paint.contentBox.description == "content-box")
        #expect(BoxEdge.Paint.paddingBox.description == "padding-box")
        #expect(BoxEdge.Paint.borderBox.description == "border-box")
        #expect(BoxEdge.Paint.fillBox.description == "fill-box")
        #expect(BoxEdge.Paint.strokeBox.description == "stroke-box")
    }
    
    @Test("BoxEdge.Coordinate values render correctly")
    func testCoordinateBoxEdgeValues() {
        #expect(BoxEdge.Coordinate.contentBox.description == "content-box")
        #expect(BoxEdge.Coordinate.paddingBox.description == "padding-box")
        #expect(BoxEdge.Coordinate.borderBox.description == "border-box")
        #expect(BoxEdge.Coordinate.fillBox.description == "fill-box")
        #expect(BoxEdge.Coordinate.strokeBox.description == "stroke-box")
        #expect(BoxEdge.Coordinate.viewBox.description == "view-box")
    }
    
    @Test("BoxEdge.Geometry values render correctly")
    func testGeometryBoxEdgeValues() {
        #expect(BoxEdge.Geometry.contentBox.description == "content-box")
        #expect(BoxEdge.Geometry.paddingBox.description == "padding-box")
        #expect(BoxEdge.Geometry.borderBox.description == "border-box")
        #expect(BoxEdge.Geometry.marginBox.description == "margin-box")
        #expect(BoxEdge.Geometry.fillBox.description == "fill-box")
        #expect(BoxEdge.Geometry.strokeBox.description == "stroke-box")
        #expect(BoxEdge.Geometry.viewBox.description == "view-box")
    }
    
    @Test("BoxEdge raw values are correct")
    func testMainRawValues() {
        #expect(BoxEdge.contentBox.rawValue == "content-box")
        #expect(BoxEdge.borderBox.rawValue == "border-box")
        #expect(BoxEdge.viewBox.rawValue == "view-box")
    }
    
    @Test("BoxEdge initialization from raw value works correctly")
    func testRawValueInitializer() {
        let contentBox = BoxEdge(rawValue: "content-box")
        #expect(contentBox == BoxEdge.contentBox)
        
        let borderBox = BoxEdge(rawValue: "border-box")
        #expect(borderBox == BoxEdge.borderBox)
        
        // Invalid raw value
        let invalid = BoxEdge(rawValue: "invalid-box")
        #expect(invalid == nil)
    }
    
    @Test("BoxEdge subtype initialization from raw value works correctly")
    func testSubtypeRawValueInitializer() {
        let visualContentBox = BoxEdge.Visual(rawValue: "content-box")
        #expect(visualContentBox == BoxEdge.Visual.contentBox)
        
        let layoutMarginBox = BoxEdge.Layout(rawValue: "margin-box")
        #expect(layoutMarginBox == BoxEdge.Layout.marginBox)
        
        // Invalid raw value for a specific subtype
        let invalidGeometry = BoxEdge.Paint(rawValue: "view-box")
        #expect(invalidGeometry == nil) // "view-box" is not a valid Paint value
    }
    
    @Test("BoxEdge conforms to Equatable")
    func testMainEquatable() {
        let contentBox1 = BoxEdge.contentBox
        let contentBox2 = BoxEdge.contentBox
        let borderBox = BoxEdge.borderBox
        
        #expect(contentBox1 == contentBox2)
        #expect(contentBox1 != borderBox)
    }
    
    @Test("BoxEdge subtypes conform to Equatable")
    func testSubtypeEquatable() {
        let visualContentBox1 = BoxEdge.Visual.contentBox
        let visualContentBox2 = BoxEdge.Visual.contentBox
        let visualBorderBox = BoxEdge.Visual.borderBox
        
        #expect(visualContentBox1 == visualContentBox2)
        #expect(visualContentBox1 != visualBorderBox)
        
        // Different subtypes are not comparable
        let layoutContentBox = BoxEdge.Layout.contentBox
        
        // This should not compile if tried:
        // #expect(visualContentBox1 != layoutContentBox)
    }
}
