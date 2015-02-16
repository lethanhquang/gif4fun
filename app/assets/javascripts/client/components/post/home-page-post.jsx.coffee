'use strict'

define [
  'react'
  'client/components/post/post-container'
  'client/components/post/post-statistic'
], (React, PostContainer, PostStatistic) ->

  # @author Quang Rau
  #
  # Home page component


  HomePagePost = React.createClass
    displayName: 'HomePagePost'

    render: ->
      `<div>
        <div className="row row-post">
          <PostContainer post={this.props.post} />
          <PostStatistic postId={this.props.post.id} title={this.props.post.title} author={this.props.post.user.name} />
        </div>
        <hr />
      </div>`

  # return
  HomePagePost
