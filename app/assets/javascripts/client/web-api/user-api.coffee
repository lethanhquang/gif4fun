'use strict'

define [
  'lodash'
  'superagent'
  'client/actions/app-actions'
  'client/stores/user-store'
], (_, request, AppActions, UserStore) ->

  # @author Quang Râu
  #
  # Web api for client-side, responsible for handling request for the whole app

  UserApi =
    signIn: (object, callback) ->
      request
        .post '/api/v1/users/sign_in'
        .send _.extend(object)
        .end callback

    updateInfo: (object, callback) ->
      request
        .put '/api/v1/users/me'
        .send _.extend(object, access_token: UserStore.getUser().get 'authentication_token')
        .end callback
