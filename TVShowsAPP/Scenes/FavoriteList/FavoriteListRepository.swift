//
//  FavoriteListRepository.swift
//  TVShowsAPP
//
//  Created by Vinicius Mesquita on 03/04/21.
//

import Foundation

class FavoriteListRepository: Repository {

    typealias ObjectDTO = TVShow
    typealias ObjectDAO = TVShowDAO

    let service = CoreDataService<TVShowDAO>()
    var favorites: [ObjectDAO] = []

    func getAll() -> [ObjectDAO] {
        guard let favorites = service.fetchAll() else { return self.favorites }
        self.favorites = favorites
        return favorites
    }

    @discardableResult
    func add(object: TVShow) -> ObjectDAO? {
        let tvShow = service.new()
        tvShow?.name = object.name
        tvShow?.id = Int32(object.id)
        tvShow?.summary = object.summary
        tvShow?.genres = object.genres.joined(separator: " ,")
        tvShow?.officialSite = object.officialSite
        tvShow?.image = CoreDataService<ImageDAO>().new()
        tvShow?.image?.medium = object.image?.medium
        tvShow?.image?.background = object.image?.background
        tvShow?.rating?.avarege = object.rating?.average ?? 0
        if service.save() { return tvShow }
        return nil
    }

    @discardableResult
    func delete(object: TVShow) -> TVShowDAO? {
        guard let searchedObject = get(object: object) else { return nil }
        guard let deletedObject = service.delete(object: searchedObject) else { return nil }
        return deletedObject
    }

    func get(object: TVShow) -> TVShowDAO? {
        let predicateEnum = Predicate.id(String(object.id))
        if let product = service.retrieve(predicate: predicateEnum.predicate) {
            return product.first
        }
        return nil
    }

    func favorite(object: TVShow) -> TVShowDAO? {
        return nil
    }

    func unfavorite(object: TVShow) -> TVShowDAO? {
        return nil
    }
}
