'use strict'

define [
  'jquery'
  'react'
  'client/actions/app-actions'
  'client/stores/user-store'
  'client/components/user/login-modal'
], ($, React, AppActions, UserStore, LoginModal) ->

  # @author Quang Râu
  #
  # User component

  React.createClass
    displayName: 'User'

    mixins: [UserStore.Mixins]

    render: ->
      return `<li><LoginModal /></li>` unless @state.user

      `<li>
        <a className="dropdown profile-link" href="javascript:void(0)">
          <div className="media">
            <div className="pull-left media-middle">
              <img className="media-object avatar-rounded" src={this.state.user.get('avatar_square')} width='35' />
            </div>
            <div className="media-body">
              <h4 className="media-heading">{this.state.user.get('name')} <span className="caret"></span></h4>
            </div>
          </div>
        </a>
      </li>`
