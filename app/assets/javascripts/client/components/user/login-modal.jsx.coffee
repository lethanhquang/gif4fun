'use strict'

define [
  'react'
  'react-router'
  'react-bootstrap'
  'client/components/user/login-form'
], (React, Router, ReactBootstrap, LoginForm) ->

  React.createClass
    displayName: 'LoginModal'

    mixins: [ReactBootstrap.OverlayMixin]

    getInitialState: ->
      isModalOpen: false

    handleToggle: -> @setState isModalOpen: not @state.isModalOpen

    render: -> `<a onClick={this.handleToggle} bsStyle="primary"> Login </a>`

    renderOverlay: ->
      return `<span />` unless @state.isModalOpen

      `<ReactBootstrap.Modal className='login-modal' onRequestHide={this.handleToggle}>
        <div className='modal-body'>
          <div className="login-header">
            <h1>Gif4Fun</h1>
            <p><strong>Please sign into your account.</strong></p>
          </div>
          <div className="login-container">
            <a href="/users/auth/facebook">
              <button className="facebook-signin">Sign in with Facebook</button>
            </a>
            <p><strong>or</strong></p>
            <LoginForm setModalState={this.handleToggle} />
          </div>
        </div>
      </ReactBootstrap.Modal>`


