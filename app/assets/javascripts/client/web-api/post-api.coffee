'use strict'

define [
  'lodash'
  'jquery'
  'superagent'
  'FileAPI'
  'client/actions/app-actions'
  'client/stores/post-store'
  'client/stores/user-store'
], (_, $, request, FileAPI, AppActions, PostStore, UserStore) ->

  # @author Quang Râu
  #
  # Web api for client-side, responsible for handling request for the whole app
  #

  createPost: (object, image, callback)->
    user = UserStore.getUser()

    FileAPI.upload
      url:       '/api/v1/posts'
      data:      _.extend(object, access_token: user.get('authentication_token'), _method: 'POST')
      files:     {image: image}
      complete:  callback

  getPosts: (params, include, methods, callback) ->
    request
      .get '/api/v1/posts'
      .query( access_token:  UserStore.getUser().get 'authentication_token')
      .query $.param(params)
      .query $.param(include: include)
      .query $.param(methods: methods)
      .end callback

  getPostInfo: (post_id, include, methods, callback) ->
    request
      .get "/api/v1/posts/#{post_id}"
      .query(
        access_token: UserStore.getUser().get 'authentication_token'
        lang:         LanguagesStore.getCurrentLanguage()
      )
      .query $.param(include: include)
      .query $.param(methods: methods)
      .end callback
