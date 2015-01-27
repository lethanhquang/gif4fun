'use strict'

define [
  'lodash'
  'immutable'
  'event-emitter2'
  'client/dispatcher/app-dispatcher'
  'client/constants/app-constants'
], (_, Immutable, EventEmitter, AppDispatcher, AppConstants) ->

  # @author Phan Quang Hung
  # Store user infos
  #
  # This store is responsible for controlling all user infos, for
  # example, profile page, welcome header, etc.

  # initialization
  _user = Immutable.fromJS _.extend(window.INFOS, isMenuShown: false)

  # handlers
  _updateInfo = (values, keys) ->
    _user = _user.withMutations (user) ->
      values.forEach (value, index) -> user.set(keys[index], value)
      user

  _toggleProfile = ->
    _isMenuShown = _user.get 'isMenuShown'
    _user        = _user.set 'isMenuShown', not _isMenuShown

  UserStore = _.extend(new EventEmitter(), {
    emitChange:            -> @emit AppConstants.USER.INFO_CHANGE_EVENT
    addChangeListener:     (callback) -> @on AppConstants.USER.INFO_CHANGE_EVENT, callback
    removeChangeListener:  (callback) -> @removeListener AppConstants.USER.INFO_CHANGE_EVENT, callback
    getUser:               -> _user
    dispatcherIndex:       AppDispatcher.register (payload) ->
      action = payload.action

      if _.contains [AppConstants.USER.UPDATE_INFO, AppConstants.USER.TOGGLE_PROFILE], action.actionType
        switch action.actionType
          when AppConstants.USER.UPDATE_INFO    then _updateInfo action.data.values, action.data.keys
          when AppConstants.USER.TOGGLE_PROFILE then _toggleProfile()

        UserStore.emitChange()
    Mixins:
      getInitialState:       -> user: _user
      componentWillMount:    -> UserStore.addChangeListener @userOnChange
      componentWillUnmount:  -> UserStore.removeChangeListener @userOnChange
      userOnChange:          -> @setState user: _user
  })

  UserStore
