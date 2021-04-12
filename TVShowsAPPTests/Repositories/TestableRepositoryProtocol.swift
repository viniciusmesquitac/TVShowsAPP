//
//  TestableRepositoryProtocol.swift
//  TVShowsAPPTests
//
//  Created by Vinicius Mesquita on 06/04/21.
//

// swiftlint:disable force_cast
import CoreData
@testable import TVShowsAPP

protocol TestableRepository {
    associatedtype GenericRepository: Repository
    associatedtype GenericDAO: NSManagedObject
    var sut: GenericRepository! { get set }
    func clean()
}

extension TestableRepository {
    func clean() {
        let service = CoreDataService<GenericDAO>()
        let allElements = sut.getAll()
        for element in allElements {
            let element = element as! GenericDAO
            _ = service.delete(object: element)
        }
    }
}
