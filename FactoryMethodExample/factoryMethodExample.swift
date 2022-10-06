//
//  main.swift
//  FactoryMethodExample
//
//  Created by 한지석 on 2022/10/06.
//

import Foundation

//MARK: Product에 해당하는 프로토콜
//      Creator와 Creator의 서브클래스에 의해 생성되는 클래스에게 공통적인 인터페이스 제공

protocol Transport {
    
    var location: String { get }
    func getTransport()
    func setLocation(location: String)
    func getLocation()
    func deilver()
    
}

//MARK: Product 프로토콜을 준수하는 Concrete Protocol
//      Product 인터페이스의 다른 구현체

class TruckTransport: Transport {
    
    var location: String = "회사 창고"
    
    func getTransport() {
        print("print - getTransport : Truck")
    }
    
    func setLocation(location: String) {
        self.location = location
    }
    
    func getLocation() {
        print("print - getLocaiton : \(location)")
    }
    
    func deilver() {
        print("print - deilver")
    }

}

class ShipTransport: Transport {
    
    var location: String = "회사 창고"
    
    func getTransport() {
        print("print - getTransport : Ship")
    }
    
    func setLocation(location: String) {
        self.location = location
    }
    
    func getLocation() {
        print("print - getLocaiton : \(location)")
    }
    
    func deilver() {
        print("print - deilver")
    }

}

//class PlaneTransport: Transport {
//
//    var location: String = "회사 창고"
//
//    func getTransport() {
//        print("print - getTransport : Plane")
//    }
//
//    func setLocation(location: String) {
//        self.location = location
//    }
//
//    func getLocation() {
//        print("print - getLocaiton : \(location)")
//    }
//
//    func deilver() {
//        print("print - deilver")
//    }
//
//}


//MARK: Creator
//      새 Product 클래스를 리턴하는 팩토리 메소드 선언. 리턴 타입은 Product 인터페이스와 일치해야 함.
//      팩토리 메소드를 추상적(abstract)로 선언하여 모든 서브 클래스가 자체 메소드를 구현할 수 있음.

protocol TransportFactoryProtocol {
    func creatTransport(transportType: TransportType) -> Transport
}

enum TransportType {
    case truck
    case ship
//    case plane
}

//MARK: Concrete Creator = Factory
//      기본 팩토리 메소드를 재정의하여 Product를 반환함

class TransportFactory: TransportFactoryProtocol {
    func creatTransport(transportType: TransportType) -> Transport {
        switch transportType {
        case .truck:
            return TruckTransport()
        case .ship:
            return ShipTransport()
//        case .plane:
//            return PlaneTransport()
        }
    }
}

//MARK: 타입에 따른 인스턴스 생성
//      스위프트에서는 구조체도 메서드를 사용할 수 있기에 객체라는 용어보다 둘을 하나로 일컫는 인스턴스라는 용어로
//      객체라는 용어를 대체한다.
let factory = TransportFactory()
let truckDeliver = factory.creatTransport(transportType: .truck)
let shipDeliver = factory.creatTransport(transportType: .ship)
//let planeDeliver = factory.creatTransport(transportType: .plane)


truckDeliver.getTransport()
truckDeliver.getLocation()

print("- - - - - - - - - - - - - - - - - -")

shipDeliver.getTransport()
shipDeliver.getLocation()
shipDeliver.setLocation(location: "우리 집")
shipDeliver.getLocation()


// planeDeliver.getTransport()
// planeDeliver.getLocation()

// 장점
// 1. 클래스의 유지보수가 쉬워진다. (결합도를 낮춤으로 발생하는 장점)
// 2. Product 생성 코드를 한 곳으로 모아 코드를 더 쉽고 체계적으로 관리할 수 있다.

// 단점
// 1. 코드가 복잡해진다 -> 계속해서 서브 클래스를 정의해야하기 때문.
