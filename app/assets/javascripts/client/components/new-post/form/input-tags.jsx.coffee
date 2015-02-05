'use strict'

define [
  'react'
  'react-router'
  'react-bootstrap'
  'client/actions/app-actions'
  'client/stores/user-store'
], (React, Router, ReactBootstrap, AppActions, UserStore) ->

  # @author Quang Râu
  #
  # User component

  React.createClass
    displayName: 'InputTitle'

    render: ->
      `<div className="form-group">
        <input type="text" className="form-control" name="post[tags]" placeholder="#Tags" />
      </div>`
