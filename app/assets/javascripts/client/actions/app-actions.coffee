'use strict'

define [
  'client/constants/app-constants'
  'client/dispatcher/app-dispatcher'
], (AppConstants, AppDispatcher)->

  # @author Quang Rau
  # This script is responsible for managing actions between multiple components
  # via dispatching event handling to listened components

  # Manage Post info
  PostActions =
    loadNewPosts: (values)->
      AppDispatcher.handleViewAction actionType: AppConstants.POST.LOAD_NEW_POSTS, data: values
    toggleModal: ->
      AppDispatcher.handleViewAction actionType: AppConstants.POST.TOGGLE_MODAL

  # Manage user info
  UserActions =
    updateInfo: (values, keys) ->
      AppDispatcher.handleViewAction actionType: AppConstants.USER.UPDATE_INFO, data: { values: values, keys: keys }

    toggleProfile: ->
      AppDispatcher.handleViewAction actionType: AppConstants.USER.TOGGLE_PROFILE

  # export actions
  window.actions = { PostActions, UserActions }
  { PostActions, UserActions }
