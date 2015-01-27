'use strict'

define [
  'client/constants/app-constants'
  'client/dispatcher/app-dispatcher'
], (AppConstants, AppDispatcher)->

  # @author Quang Rau
  # This script is responsible for managing actions between multiple components
  # via dispatching event handling to listened components

  # Manage user info
  # UPDATE_INFO
  # TOGGLE_PROFILE
  UserActions =
    updateInfo: (values, keys) ->
      AppDispatcher.handleViewAction actionType: AppConstants.USER.UPDATE_INFO, data: { values: values, keys: keys }

    toggleProfile: ->
      AppDispatcher.handleViewAction actionType: AppConstants.USER.TOGGLE_PROFILE

  # export actions
  window.actions = { UserActions }
  { UserActions }
