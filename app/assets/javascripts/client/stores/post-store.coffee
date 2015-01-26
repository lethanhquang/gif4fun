'use strict'

define [
  'lodash'
  'event-emitter2'
  'client/dispatcher/app-dispatcher'
], (_, EventEmitter, AppDispatcher) ->

  # @author Quang Rau
  # Store posts

  # initialization
  CHANGE_EVENT = "change"

  _posts = [
    {id: 1, name: "Post #1", url: "http://i.4cdn.org/wsg/1422129126611.gif"}
    {id: 2, name: "Post #2", url: "http://i.4cdn.org/wsg/1419775504250.gif"}
    {id: 3, name: "Post #3", url: "http://media2.giphy.com/media/87rTWttn5oEF2/200.gif"}
  ]

  # handlers

  # event register
  PostStore = _.extend(new EventEmitter(), {
    emitChange:               -> @emit CHANGE_EVENT
    addChangeListener:        (callback) -> @on CHANGE_EVENT, callback
    removeChangeListener:     (callback) -> @removeListener CHANGE_EVENT, callback
    getPosts:                 -> _posts
    dispatcherIndex:          AppDispatcher.register (payload)->
      action = payload.action

      PostStore.emitChange()
  })

  PostStore

