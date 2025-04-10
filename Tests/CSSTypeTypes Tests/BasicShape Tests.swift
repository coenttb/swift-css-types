//
//  BasicShape Tests.swift
//  
//
//  Created on 03/26/2025.
//

import CSSTypeTypes
import Testing

@Suite("BasicShape Tests")
struct BasicShapeTests {
    
    @Test("Inset shape renders correctly")
    func testInsetShape() {
        let inset = BasicShape.inset(top: .px(20), right: .px(50), bottom: .px(10), left: .px(30), borderRadius: nil)
        #expect(inset.description == "inset(20px 50px 10px 30px)")
        
        let insetWithRadius = BasicShape.inset(top: .px(20), right: .px(50), bottom: .px(10), left: .px(30), borderRadius: "10px")
        #expect(insetWithRadius.description == "inset(20px 50px 10px 30px round 10px)")
        
        let insetWithPercentages = BasicShape.inset(top: .percentage(10), right: .percentage(20), bottom: .percentage(10), left: .percentage(20), borderRadius: nil)
        #expect(insetWithPercentages.description == "inset(10% 20% 10% 20%)")
    }
    
    @Test("XYWH shape renders correctly")
    func testXYWHShape() {
        let xywh = BasicShape.xywh(x: .px(10), y: .px(20), width: .px(200), height: .px(100), borderRadius: nil)
        #expect(xywh.description == "xywh(10px 20px 200px 100px)")
        
        let xywhWithRadius = BasicShape.xywh(x: .px(10), y: .px(20), width: .px(200), height: .px(100), borderRadius: "5px")
        #expect(xywhWithRadius.description == "xywh(10px 20px 200px 100px round 5px)")
    }
    
    @Test("Rect shape renders correctly")
    func testRectShape() {
        let rect = BasicShape.rect(top: .px(10), right: .px(210), bottom: .px(110), left: .px(20), borderRadius: nil)
        #expect(rect.description == "rect(10px 210px 110px 20px)")
        
        let rectWithRadius = BasicShape.rect(top: .px(10), right: .px(210), bottom: .px(110), left: .px(20), borderRadius: "8px")
        #expect(rectWithRadius.description == "rect(10px 210px 110px 20px round 8px)")
    }
    
    @Test("Circle shape renders correctly")
    func testCircleShape() {
        let circle = BasicShape.circle(radius: .length(.px(50)), at: .center)
        #expect(circle.description == "circle(50px at center)")
        
        let circlePercentRadius = BasicShape.circle(radius: .percentage(50), at: .topLeft)
        #expect(circlePercentRadius.description == "circle(50% at top left)")
        
        let circleWithKeywordRadius = BasicShape.circle(radius: .closestSide, at: .bottom)
        #expect(circleWithKeywordRadius.description == "circle(closest-side at bottom)")
        
        // Circle with no position
        let circleNoPosition = BasicShape.circle(radius: .length(.px(50)), at: nil)
        #expect(circleNoPosition.description == "circle(50px)")
        
        // Circle with no radius
        let circleNoRadius = BasicShape.circle(radius: nil, at: .center)
        #expect(circleNoRadius.description == "circle( at center)")
        
        // Empty circle
        let emptyCircle = BasicShape.circle(radius: nil, at: nil)
        #expect(emptyCircle.description == "circle()")
    }
    
    @Test("Ellipse shape renders correctly")
    func testEllipseShape() {
        let ellipse = BasicShape.ellipse(radiusX: .length(.px(100)), radiusY: .length(.px(50)), at: .center)
        #expect(ellipse.description == "ellipse(100px 50px at center)")
        
        let ellipsePercentRadius = BasicShape.ellipse(radiusX: .percentage(50), radiusY: .percentage(25), at: .topLeft)
        #expect(ellipsePercentRadius.description == "ellipse(50% 25% at top left)")
        
        let ellipseWithKeywordRadius = BasicShape.ellipse(radiusX: .closestSide, radiusY: .farthestSide, at: .bottom)
        #expect(ellipseWithKeywordRadius.description == "ellipse(closest-side farthest-side at bottom)")
        
        // Ellipse with no position
        let ellipseNoPosition = BasicShape.ellipse(radiusX: .length(.px(100)), radiusY: .length(.px(50)), at: nil)
        #expect(ellipseNoPosition.description == "ellipse(100px 50px)")
        
        // Ellipse with no radii
        let ellipseNoRadii = BasicShape.ellipse(radiusX: nil, radiusY: nil, at: .center)
        #expect(ellipseNoRadii.description == "ellipse( at center)")
        
        // Empty ellipse
        let emptyEllipse = BasicShape.ellipse(radiusX: nil, radiusY: nil, at: nil)
        #expect(emptyEllipse.description == "ellipse()")
    }
    
    @Test("Polygon shape renders correctly")
    func testPolygonShape() {
        let points = [
            BasicShape.PolygonPoint(.percentage(50), .percentage(0)),
            BasicShape.PolygonPoint(.percentage(100), .percentage(50)),
            BasicShape.PolygonPoint(.percentage(50), .percentage(100)),
            BasicShape.PolygonPoint(.percentage(0), .percentage(50))
        ]
        
        let polygon = BasicShape.polygon(points: points)
        #expect(polygon.description == "polygon(50% 0%, 100% 50%, 50% 100%, 0% 50%)")
        
        let polygonWithFillRule = BasicShape.polygon(fillRule: .evenodd, points: points)
        #expect(polygonWithFillRule.description == "polygon(evenodd, 50% 0%, 100% 50%, 50% 100%, 0% 50%)")
    }
    
    @Test("Polygon factory method works correctly")
    func testPolygonFactoryMethod() {
        let tuplePoints: [(LengthPercentage, LengthPercentage)] = [
            (.percentage(50), .percentage(0)),
            (.percentage(100), .percentage(50)),
            (.percentage(50), .percentage(100)),
            (.percentage(0), .percentage(50))
        ]
        
        let polygon = BasicShape.polygon(points: tuplePoints)
        #expect(polygon.description == "polygon(50% 0%, 100% 50%, 50% 100%, 0% 50%)")
        
        let polygonWithFillRule = BasicShape.polygon(fillRule: .evenodd, points: tuplePoints)
        #expect(polygonWithFillRule.description == "polygon(evenodd, 50% 0%, 100% 50%, 50% 100%, 0% 50%)")
    }
    
    @Test("Path shape renders correctly")
    func testPathShape() {
        let path = BasicShape.path(pathData: "M 0,0 H 100 V 100 H 0 Z")
        #expect(path.description == "path(\"M 0,0 H 100 V 100 H 0 Z\")")
        
        let pathWithFillRule = BasicShape.path(fillRule: .evenodd, pathData: "M 0,0 H 100 V 100 H 0 Z")
        #expect(pathWithFillRule.description == "path(evenodd, \"M 0,0 H 100 V 100 H 0 Z\")")
    }
    
    @Test("ShapeRadius renders correctly")
    func testShapeRadius() {
        let lengthRadius = BasicShape.ShapeRadius.length(.px(50))
        #expect(lengthRadius.description == "50px")
        
        let percentageRadius = BasicShape.ShapeRadius.percentage(75)
        #expect(percentageRadius.description == "75%")
        
        let closestSide = BasicShape.ShapeRadius.closestSide
        #expect(closestSide.description == "closest-side")
        
        let farthestSide = BasicShape.ShapeRadius.farthestSide
        #expect(farthestSide.description == "farthest-side")
    }
    
    @Test("FillRule conforms to Equatable")
    func testFillRuleEquatable() {
        let nonzero1 = BasicShape.FillRule.nonzero
        let nonzero2 = BasicShape.FillRule.nonzero
        let evenodd = BasicShape.FillRule.evenodd
        
        #expect(nonzero1 == nonzero2)
        #expect(nonzero1 != evenodd)
    }
    
    @Test("PolygonPoint conforms to Equatable")
    func testPolygonPointEquatable() {
        let point1 = BasicShape.PolygonPoint(.percentage(50), .percentage(50))
        let point2 = BasicShape.PolygonPoint(.percentage(50), .percentage(50))
        let point3 = BasicShape.PolygonPoint(.percentage(25), .percentage(75))
        
        #expect(point1 == point2)
        #expect(point1 != point3)
        
        // Different types of LengthPercentage should not be equal
        let point4 = BasicShape.PolygonPoint(.px(50), .percentage(50))
        #expect(point1 != point4)
    }
}
