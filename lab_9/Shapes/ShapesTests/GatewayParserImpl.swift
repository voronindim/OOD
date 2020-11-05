//
//  GatewayParserImpl.swift
//  ShapesTests
//
//  Created by Dmitrii Voronin on 05.11.2020.
//

import XCTest
@testable import Shapes

class GatewayParserImpl: XCTestCase {
    func testgatewayParserImpl() {
    
        let firstShapeInfo = ShapeInfo(
            name: .ellipse,
            ellipse: ShapeInfo.Ellipse(
                center: ShapeInfo.Point(x: 0, y: 0),
                verticalRadius: 10,
                horizontalRadius: 20
            ),
            triangle: nil,
            rectangle: nil
        )
        
        let secondShapeInfo = ShapeInfo(
            name: .rectangle,
            ellipse: nil,
            triangle: nil,
            rectangle: ShapeInfo.Rectangle(
                leftTop: ShapeInfo.Point(x: 100, y: 100),
                width: 10,
                height: 20
            )
        )
        
        let thrirdShapeInfo = ShapeInfo(
            name: .triangle,
            ellipse: nil,
            triangle: ShapeInfo.Triangle(
                vertex1: ShapeInfo.Point(x: 0, y: 0),
                vertex2: ShapeInfo.Point(x: 100, y: 100),
                vertex3: ShapeInfo.Point(x: 100, y: 0)
            ),
            rectangle: nil
        )
        
        let fourthShapeWithoutInfo = ShapeInfo(
            name: .rectangle,
            ellipse: nil,
            triangle: nil,
            rectangle: nil
        )
        
        let fifthShapeDataAnotherShape = ShapeInfo(
            name: .triangle,
            ellipse: ShapeInfo.Ellipse(
                center: ShapeInfo.Point(x: 40, y: 40),
                verticalRadius: 30,
                horizontalRadius: 50
            ),
            triangle: nil,
            rectangle: nil
        )
        
        let expectedInfo = [firstShapeInfo, secondShapeInfo, thrirdShapeInfo]
        
        
        let responseData =
        """
            {
                "arrayOfShapes":
                [
                    {
                        "name": "\(firstShapeInfo.name)",
                        "ellipse":
                        {
                            "center":
                            {
                                "x": \(firstShapeInfo.ellipse!.center.x),
                                "y": \(firstShapeInfo.ellipse!.center.y)
                            },
                            "verticalRadius": \(firstShapeInfo.ellipse!.verticalRadius),
                            "horizontalRadius": \(firstShapeInfo.ellipse!.horizontalRadius)
                        }
                    },
                    {
                        "name": "\(secondShapeInfo.name)",
                        "rectangle":
                        {
                            "leftTop":
                            {
                                "x": \(secondShapeInfo.rectangle!.leftTop.x),
                                "y": \(secondShapeInfo.rectangle!.leftTop.y)
                            },
                            "width": \(secondShapeInfo.rectangle!.width),
                            "height": \(secondShapeInfo.rectangle!.height)
                        }
                    },
                    {
                        "name": "\(thrirdShapeInfo.name)",
                        "triangle":
                        {
                            "vertex1":
                            {
                                "x": \(thrirdShapeInfo.triangle!.vertex1.x),
                                "y": \(thrirdShapeInfo.triangle!.vertex1.y)
                            },
                            "vertex2":
                            {
                                "x": \(thrirdShapeInfo.triangle!.vertex2.x),
                                "y": \(thrirdShapeInfo.triangle!.vertex2.y)
                            },
                            "vertex3":
                            {
                                "x": \(thrirdShapeInfo.triangle!.vertex3.x),
                                "y": \(thrirdShapeInfo.triangle!.vertex3.y)
                            }
                        }
                    },
                    {
                        "name": "\(fourthShapeWithoutInfo.name)"
                    },
                    {
                        "name": "\(fifthShapeDataAnotherShape.name)",
                        "ellipse":
                        {
                            "center":
                            {
                                "x": \(fifthShapeDataAnotherShape.ellipse!.center.x),
                                "y": \(fifthShapeDataAnotherShape.ellipse!.center.y)
                            },
                            "verticalRadius": \(fifthShapeDataAnotherShape.ellipse!.verticalRadius),
                            "horizontalRadius": \(fifthShapeDataAnotherShape.ellipse!.horizontalRadius)
                        }
                    }
                ]
            }
        """.data(using: .utf8)
        
        XCTAssertEqual(try parseShapes(data: responseData!), expectedInfo)
    }
    
}


fileprivate func parseShapes(data: Data) throws -> [ShapeInfo]? {
    let parser = ParseImpl()
    return parser.getListOfShapes(data)
}
    
