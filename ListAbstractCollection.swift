//
//  ListAbstractCollection.swift
//  SwiftTodos
//
//  Created by Sadman samee on 1/28/16.
//  Copyright © 2016 Peter Siegesmund. All rights reserved.
//

import Foundation
import SwiftDDP

public class ListAbstractCollection: AbstractCollection {

    // Include any logic that needs to occur when a document is added to the collection on the server
    override public func documentWasAdded(collection:String, id:String, fields:NSDictionary?) {
        let list = List(id: id, fields: fields)
        lists.append(list)
        
    }

    // Include any logic that needs to occur when a document is changed on the server
    override public func documentWasChanged(collection:String, id:String, fields:NSDictionary?, cleared:[String]?) {
        if let index = lists.indexOf({ listStruct in return listStruct._id == id }) {
           var list = lists[index]
            list.update(fields)
            lists[index] = list
        }
    }

    // Include any logic that needs to occur when a document is removed on the server
    override public func documentWasRemoved(collection:String, id:String) {
        if let index = lists.indexOf({ contact in return contact._id == id }) {
                lists.removeAtIndex(index)
        }
    }
}
