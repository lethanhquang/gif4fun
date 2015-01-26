'use strict'

define [
  'lodash'
  'flux'
], (_, Flux)->

  # @author Quang Rau
  # Whole app dispatcher for client-side part

  AppDispatcher = _.extend(new Flux.Dispatcher(), {
    handleViewAction: (action) ->
      @dispatch source: 'VIEW_ACTION', action: action
  })

  # export app dispatcher
  AppDispatcher

