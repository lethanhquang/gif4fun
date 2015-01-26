'use strict'

define [
  'react'
  'react-router'
  'react-bootstrap'
], (React, Router, ReactBootstrap) ->

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
            <button className="facebook-signin">Sign in with Facebook</button>
            <p><strong>or</strong></p>
            <form>
              <div className="form-group">
                <input type="email" className="form-control" placeholder="Email" />
              </div>
              <div className="form-group">
                <input type="password" className="form-control" placeholder="Password" />
              </div>
              <div className="submit-container">
                <span className="forgot-password">
                  <a id="ember1731" className="ember-view" href="/forgot-password">Forgot your password?</a>
                </span>
                <button type="submit">Sign In</button>
              </div>
            </form>
          </div>
        </div>
      </ReactBootstrap.Modal>`


