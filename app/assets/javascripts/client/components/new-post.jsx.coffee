'use strict'

define [
  'jquery'
  'react'
  'client/actions/app-actions'
  'client/stores/user-store'
], ($, React, AppActions, UserStore) ->

  # @author Quang Râu
  #
  # User component

  React.createClass
    displayName: 'User'

    mixins: [UserStore.Mixins]

    render: ->
      return `<li />` unless @state.user

      `<li>
        <a className="new-post-link" href="javascript:void(0)">
          <i className="fa fa-upload"></i> Upload
        </a>
      </li>`
