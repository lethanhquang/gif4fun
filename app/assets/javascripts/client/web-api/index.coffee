'use strict'

define [
  'client/web-api/post-api'
], (Post) ->

  # initialize get all top posts
  Post.getTopPosts()

