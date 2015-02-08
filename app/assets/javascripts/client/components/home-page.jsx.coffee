'use strict'

define [
  'react'
  'client/stores/user-store'
  'client/stores/post-store'
  'client/web-api/post-api'
  'client/actions/app-actions'
  'client/components/home-page-post'
], (React, UserStore, PostStore, PostApi, AppActions, HomePagePost) ->

  # @author Quang Rau
  #
  # Home page component

  React.createClass
    displayName: 'HomePage'

    mixins: [UserStore.Mixins, PostStore.Mixins]

    componentWillMount: ->
      @loadNewPosts(1)

    loadNewPosts: (page) ->
      PostApi.getPosts { sort_by: 'id', sort_dir: 'desc', page: page }, ['user'], ['image'], (result) ->
        AppActions.PostActions.loadNewPosts result.body.data

    render: ->
      posts = _(@state.posts).map((post)->
        return (
          `<HomePagePost post={post} />`
        )
      )

      `<div className="panel">
        <div className="panel-heading">New Stories</div>
        <div className="panel-body" id="new-stories">
          {posts}
          <div className="well text-center">
            <h1>Centered Text</h1>
            This was a 2.x challenge that seems a little easier in 3.
            <div>
              <i className="glyphicon glyphicon-4x glyphicon-camera"></i>
              <i className="glyphicon glyphicon-4x glyphicon-camera"></i>
              <i className="glyphicon glyphicon-4x glyphicon-camera"></i>
            </div>
          </div>
        </div>
      </div>`
