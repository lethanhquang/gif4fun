'use strict'

define [
  'react'
  'react-bootstrap'
  'alertify'
  'client/constants/app-constants'
  'client/actions/app-actions'
  'client/stores/user-store'
  'client/stores/post-store'
  'client/web-api/post-api'
], (React, ReactBootstrap, alertify, AppConstants, AppActions, UserStore, PostStore, PostApi) ->

  # @author Quang Râu
  #
  # User component

  React.createClass
    displayName: 'TabImage'

    getInitialState: ->
      user = UserStore.getUser()

      post_type:       AppConstants.POST.POST_TYPE_DEFAULT
      title:           undefined
      content:         undefined
      tag:             undefined
      image:           undefined
      imageThumbnail:  AppConstants.IMAGES.PLACE_HOLDER
      username:        user.get 'name'

    imageOnChange: (event) ->
      file = event.target.files[0]

      if file
        reader        = new FileReader()
        reader.onload = (loadEvent) => @setState image: file, imageThumbnail: loadEvent.target.result
        reader.readAsDataURL file

    dataOnChange: (currentState, event) ->
      newState = {}
      newState[currentState] = event.target.value
      @setState newState

    handleSubmit: ->
      PostApi.createPost
        post_type: @state.post_type, title: @state.title,
        @state.image,
        (err, xhr) =>
          data = JSON.parse xhr.responseText

          unless err || xhr.status != 201
            alertify.success 'Your post was submit successful!'
            AppActions.PostActions.toggleModal()
          else
            alertify.error data.error

    render: ->
      `<div className="tab-image">
        <div className="form-group">
          <input type="text" className="form-control" onBlur={this.dataOnChange.bind(this, 'title')} placeholder="Title of post" />
        </div>
        <div className="form-group">
          <input type="text" className="form-control" placeholder="#Tags" />
        </div>
        <div className="form-group">
          <div className="row">
            <div className="col-md-6">
              <div className="thumbnail">
                <input type='file' className='file-input-field' onChange={this.imageOnChange} />
                <div className="overlay"></div>
                <img src={this.state.imageThumbnail} />
              </div>
            </div>
            <div className="col-md-6">
              <div className="post-preview">
                <h3>{this.state.title ? this.state.title : 'Title of post'}</h3>
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
          <button className="btn blue-button full-width text-center" onClick={this.handleSubmit}>Submit</button>
        </div>
      </div>`
