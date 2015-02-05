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
    displayName: 'TabImage'

    getInitialState: ->
      user = UserStore.getUser()

      title:     'Title of post'
      username:  user.get 'name'

    render: ->
      console.log UserStore.getUser()
      `<div className="tab-image">
        <div className="form-group">
          <input type="text" className="form-control" name="post[title]" placeholder="Title of post" />
        </div>
        <div className="form-group">
          <input type="text" className="form-control" name="post[tags]" placeholder="#Tags" />
        </div>
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
