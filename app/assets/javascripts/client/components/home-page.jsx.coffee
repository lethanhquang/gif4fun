'use strict'

define [
  'react'
  'client/stores/post-store'
  'client/components/home-page-post'
], (React, PostStore, HomePagePost) ->

  # @author Quang Rau
  #
  # Home page component

  React.createClass
    displayName: 'HomePage'

    getInitialState: ->
      posts: PostStore.getPosts()

    render: ->
      posts = _(@state.posts).map((post)->
        return (
          `<HomePagePost post={post} />`
        )
      )

      `<div className="panel">
        <div className="panel-heading">Top Stories</div>
        <div className="panel-body" id="top-stories">
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
