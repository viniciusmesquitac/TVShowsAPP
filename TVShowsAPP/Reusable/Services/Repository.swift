//
//  Repository.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 03/04/21.
//

import Foundation

protocol Repository {
    associatedtype ObjectDTO
    associatedtype ObjectDAO

    func getAll() -> [ObjectDAO]
    func get(object: ObjectDTO) -> ObjectDAO?
    func add(object: ObjectDTO) -> ObjectDAO?
    func delete(object: ObjectDTO) -> ObjectDAO?
}
