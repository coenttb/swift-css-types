//
//  TransformFunction Tests.swift
//  
//
//  Created on 03/26/2025.
//

import CSSTypeTypes
import Testing

@Suite("TransformFunction Tests")
struct TransformFunctionTests {
    
    // MARK: - Matrix Tests
    
    @Test("Matrix transformation renders correctly")
    func testMatrix() {
        let matrix = TransformFunction.matrix(a: 1, b: 2, c: -1, d: 1, tx: 80, ty: 80)
        #expect(matrix.description == "matrix(1, 2, -1, 1, 80, 80)")
        
        let identity = TransformFunction.identity
        #expect(identity.description == "matrix(1, 0, 0, 1, 0, 0)")
        
        let matrix3d = TransformFunction.matrix3d(values: [1, 0, 0, 0, 0, 1, 3, 0, 0, 0, 1, 0, 50, 100, 0, 1.1])
        #expect(matrix3d.description == "matrix3d(1, 0, 0, 0, 0, 1, 3, 0, 0, 0, 1, 0, 50, 100, 0, 1.1)")
    }
    
    // MARK: - Perspective Tests
    
    @Test("Perspective transformation renders correctly")
    func testPerspective() {
        let perspective = TransformFunction.perspective(.px(200))
        #expect(perspective.description == "perspective(200px)")
    }
    
    // MARK: - Rotation Tests
    
    @Test("Rotation transformations render correctly")
    func testRotation() {
        let rotate = TransformFunction.rotate(.deg(45))
        #expect(rotate.description == "rotate(45deg)")
        
        let rotate3d = TransformFunction.rotate3d(x: 1, y: 1, z: 1, angle: .deg(90))
        #expect(rotate3d.description == "rotate3d(1, 1, 1, 90deg)")
        
        let rotateX = TransformFunction.rotateX(.deg(180))
        #expect(rotateX.description == "rotateX(180deg)")
        
        let rotateY = TransformFunction.rotateY(.deg(90))
        #expect(rotateY.description == "rotateY(90deg)")
        
        let rotateZ = TransformFunction.rotateZ(.deg(45))
        #expect(rotateZ.description == "rotateZ(45deg)")
    }
    
    // MARK: - Scaling Tests
    
    @Test("Scaling transformations render correctly")
    func testScaling() {
        let scale1 = TransformFunction.scale(1.5)
        #expect(scale1.description == "scale(1.5)")
        
        let scale2 = TransformFunction.scale(sx: 1.5, sy: 2)
        #expect(scale2.description == "scale(1.5, 2)")
        
        let scale3d = TransformFunction.scale3d(sx: 1, sy: 1.5, sz: 1.5)
        #expect(scale3d.description == "scale3d(1, 1.5, 1.5)")
        
        let scaleX = TransformFunction.scaleX(2)
        #expect(scaleX.description == "scaleX(2)")
        
        let scaleY = TransformFunction.scaleY(0.5)
        #expect(scaleY.description == "scaleY(0.5)")
        
        let scaleZ = TransformFunction.scaleZ(3)
        #expect(scaleZ.description == "scaleZ(3)")
    }
    
    // MARK: - Skewing Tests
    
    @Test("Skewing transformations render correctly")
    func testSkewing() {
        let skew1 = TransformFunction.skew(.deg(10))
        #expect(skew1.description == "skew(10deg)")
        
        let skew2 = TransformFunction.skew(.deg(10), .deg(5))
        #expect(skew2.description == "skew(10deg, 5deg)")
        
        let skewX = TransformFunction.skewX(.deg(15))
        #expect(skewX.description == "skewX(15deg)")
        
        let skewY = TransformFunction.skewY(.deg(20))
        #expect(skewY.description == "skewY(20deg)")
    }
    
    // MARK: - Translation Tests
    
    @Test("Translation transformations render correctly")
    func testTranslation() {
        // Use case constructor directly instead of ambiguous translate method
        let translate1 = TransformFunction.translateX(.px(100))
        #expect(translate1.description == "translateX(100px)")
        
        // For 2D translation with both parameters, use translate convenience method
        let translate2 = TransformFunction.translate(100, 200)
        #expect(translate2.description == "translate(100px, 200px)")
        
        let translate3d = TransformFunction.translate3d(.px(50), .px(100), .px(50))
        #expect(translate3d.description == "translate3d(50px, 100px, 50px)")
        
        let translateX = TransformFunction.translateX(.px(100))
        #expect(translateX.description == "translateX(100px)")
        
        let translateY = TransformFunction.translateY(.px(200))
        #expect(translateY.description == "translateY(200px)")
        
        let translateZ = TransformFunction.translateZ(.px(300))
        #expect(translateZ.description == "translateZ(300px)")
        
        // Use translatePercent convenience method instead
        let translatePercentage = TransformFunction.translatePercent(50, 100)
        #expect(translatePercentage.description == "translate(50%, 100%)")
    }
    
    // MARK: - Convenience Constructor Tests
    
    @Test("Convenience constructors work correctly")
    func testConvenienceConstructors() {
        let uniformScale = TransformFunction.scale(sx: 2)
        #expect(uniformScale.description == "scale(2)")
        
        let uniformScale2 = TransformFunction.scale(20.percent)
        #expect(uniformScale2.description == "scale(20%)")
        
        // Skip the ambiguous translate method
        // Instead, test the specific translate methods that don't have ambiguity
        let pxTranslate = TransformFunction.translate(100, 50)
        #expect(pxTranslate.description == "translate(100px, 50px)")
        
        let percentTranslate = TransformFunction.translatePercent(25, 75)
        #expect(percentTranslate.description == "translate(25%, 75%)")
    }
    
    @Test("TransformFunction conforms to Hashable")
    func testHashable() {
        let scale1 = TransformFunction.scale(1.5)
        let scale2 = TransformFunction.scale(1.5)
        let scale3 = TransformFunction.scale(2)
        
        #expect(scale1 == scale2)
        #expect(scale1 != scale3)
        
        // Test two identical translate functions instead
        let translate1 = TransformFunction.translate(100, 50)
        let translate2 = TransformFunction.translate(100, 50)
        let translate3 = TransformFunction.translate(200, 50)
        
        #expect(translate1 == translate2)
        #expect(translate1 != translate3)
        #expect(translate1 != scale1)
    }
    
    @Test("Different transform types are not equal")
    func testDifferentTypes() {
        let scale = TransformFunction.scale(2)
        let rotate = TransformFunction.rotate(.deg(45))
        let translate = TransformFunction.translateX(.px(100))  // Use translateX instead of ambiguous translate
        
        #expect(scale != rotate)
        #expect(rotate != translate)
        #expect(translate != scale)
    }
}
