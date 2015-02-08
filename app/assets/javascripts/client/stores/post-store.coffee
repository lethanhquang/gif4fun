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

  _posts = []

  _isModalOpen = false

  # handlers
  _toggleModal = ->
    _isModalOpen = not _isModalOpen

  _loadNewPosts = (values) ->
    return if values.length is 0
    _.map(values, (post) -> _posts.push post)

  # event register
  PostStore = _.extend(new EventEmitter(), {
    emitChange:               -> @emit CHANGE_EVENT
    addChangeListener:        (callback) -> @on CHANGE_EVENT, callback
    removeChangeListener:     (callback) -> @removeListener CHANGE_EVENT, callback
    getPosts:                 -> _posts
    getModalState:            -> _isModalOpen
    dispatcherIndex:          AppDispatcher.register (payload)->
      action = payload.action

      if _.contains [AppConstants.POST.TOGGLE_MODAL, AppConstants.POST.LOAD_NEW_POSTS], action.actionType
        switch action.actionType
          when AppConstants.POST.TOGGLE_MODAL then _toggleModal()
          when AppConstants.POST.LOAD_NEW_POSTS then _loadNewPosts action.data

        PostStore.emitChange()

    Mixins:
      getInitialState: -> isModalOpen: _isModalOpen, posts: _posts
      componentWillMount: -> PostStore.addChangeListener(@onPostStoreChange)
      componentWillUnmount: -> PostStore.removeChangeListener(@onPostStoreChange)
      onPostStoreChange: -> @setState isModalOpen: _isModalOpen, posts: _posts
  })

  PostStore

