//
//  BookmarksProtocols.swift
//  Tonight's Movie
//
//  Created by Maxime Maheo on 09/08/2018.
//  Copyright (c) 2018 Maxime Maheo. All rights reserved.
//

import Foundation
import UIKit

// ======== Coordinator ======== //

//protocol BookmarksCoordinatorDelegate: class {
//    func coordinator(_ coordinator: Coordinator, finishedWithSuccess success: Bool)
//}

// PRESENTER -> COORDINATOR
protocol BookmarksCoordinatorInput: class {

}

// ======== Interactor ======== //

// PRESENTER -> INTERACTOR
protocol BookmarksInteractorInput {
    func perform(_ request: Bookmarks.Request.FetchSavedItems)
}

// INTERACTOR -> PRESENTER (indirect)
protocol BookmarksInteractorOutput: class {
    func present(_ response: Bookmarks.Response.SavedItemsFetched)
}

// ======== Presenter ======== //

// VIEW -> PRESENTER
protocol BookmarksPresenterInput {
    
    // MARK: - Properties -
    var numberOfItems: Int { get }
    
    // MARK: - Methods -
    func viewCreated()
    func viewWillAppear()
    func configure(item: ItemListCellProtocol, at indexPath: IndexPath)
    func configure(item: SearchHeaderViewProtocol, at indexPath: IndexPath)
    func didEndDisplaying(item: ItemListCellProtocol, at indexPath: IndexPath)
}

// PRESENTER -> VIEW
protocol BookmarksPresenterOutput: class {
    func display(_ displayModel: Bookmarks.DisplayData.Items)
}