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

  _posts = undefined

  _isModalOpen = false

  # handlers
  _toggleModal = ->
    _isModalOpen = not _isModalOpen

  # event register
  PostStore = _.extend(new EventEmitter(), {
    emitChange:               -> @emit CHANGE_EVENT
    addChangeListener:        (callback) -> @on CHANGE_EVENT, callback
    removeChangeListener:     (callback) -> @removeListener CHANGE_EVENT, callback
    getPosts:                 -> _posts
    getModalState:            -> _isModalOpen
    dispatcherIndex:          AppDispatcher.register (payload)->
      action = payload.action

      if _.contains [AppConstants.POST.TOGGLE_MODAL], action.actionType
        switch action.actionType
          when AppConstants.POST.TOGGLE_MODAL then _toggleModal()

        PostStore.emitChange()

    Mixins:
      getInitialState: -> isModalOpen: _isModalOpen, posts: _posts

      componentWillMount: -> PostStore.addChangeListener(@onPostStoreChange)

      componentWillUnmount: -> PostStore.removeChangeListener(@onPostStoreChange)

      onPostStoreChange: -> @setState isModalOpen: _isModalOpen, posts: _posts
  })

  PostStore

