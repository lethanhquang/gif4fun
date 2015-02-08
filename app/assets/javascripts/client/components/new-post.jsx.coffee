'use strict'

define [
  'react'
  'react-router'
  'react-bootstrap'
  'client/actions/app-actions'
  'client/stores/user-store'
  'client/stores/post-store'
  'client/components/new-post/new-post-tabs'
], (React, Router, ReactBootstrap, AppActions, UserStore, PostStore, NewPostTabs) ->

  # @author Quang Râu
  #
  # User component

  React.createClass
    displayName: 'NewPost'

    mixins: [ReactBootstrap.OverlayMixin, UserStore.Mixins, PostStore.Mixins]

    handleToggle: -> AppActions.PostActions.toggleModal()

    render: ->
      return `<li />` unless @state.user

      `<li>
        <a className="new-post-link" onClick={this.handleToggle}>
          <i className="fa fa-upload"></i> Upload
        </a>
      </li>`

    renderOverlay: ->
      return `<span />` unless @state.isModalOpen

      `<ReactBootstrap.Modal className='post-modal' onRequestHide={this.handleToggle}>
        <div className='modal-body'>
          <div className="header">
            <h3>Submit your post</h3>
          </div>
          <div className="new-post-container">
            <NewPostTabs />
          </div>
        </div>
      </ReactBootstrap.Modal>`
