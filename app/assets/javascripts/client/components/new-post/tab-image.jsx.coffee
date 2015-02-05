'use strict'

define [
  'react'
  'react-router'
  'react-bootstrap'
  'client/actions/app-actions'
  'client/stores/user-store'
  'client/components/new-post/form/input-title'
  'client/components/new-post/form/input-tags'
], (React, Router, ReactBootstrap, AppActions, UserStore, InputTitle, InputTags) ->

  # @author Quang Râu
  #
  # User component

  React.createClass
    displayName: 'TabImage'

    getInitialState: ->
      user = UserStore.getUser()

      title:     'Title of post'
      username:  user.get 'name'

    render: ->
      `<div className="tab-image">
        <InputTitle />
        <InputTags />
        <div className="form-group">
          <div className="row">
            <div className="col-md-6">
              <div className="thumbnail">
                <img src="http://sgag.sg/assets/placeholder.png" />
              </div>
            </div>
            <div className="col-md-6">
              <div className="post-preview">
                <h3>{this.state.title}</h3>
                <div className="text-muted">
                  <small>Aug 15 / By </small>
                  <a href="#">{this.state.username}</a>
                </div>
                <div className="tags">
                  <label className="label label-default">#tag</label>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div className="form-group">
          <div className="checkbox">
            <label>
              <input type="checkbox" />
              <span>I agree to the  </span>
              <a>terms and conditions</a>
            </label>
          </div>
        </div>
        <div className="form-group">
          <button className="btn blue-button full-width text-center">Submit</button>
        </div>
      </div>`
