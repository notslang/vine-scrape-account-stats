request = require 'request-promise'

getAccountStats = ({userId, username}) ->
  if not userId and not username
    throw new Error('Either a userId or a username (the last segment in a vanity
    url) needs to be passed')

  uri = (
    if userId
      "https://vine.co/api/users/profiles/#{userId}"
    else
      "https://vine.co/api/users/profiles/vanity/#{username}"
  )

  request.get(
    uri: uri
  ).then((resp) ->
    # This line is a hack to fix the fact that Vine put 19/+ digit ID numbers
    # inside of JSON without quoting or something to prevent them from being
    # rounded.
    resp = resp.replace(/"userId": ([0-9]+)/, '"userId":"$1"')
    data = JSON.parse(resp).data

    return {
      description: data.description
      followers: data.followerCount
      following: data.followingCount
      isExplicit: data.explicitContent is 1
      isPrivate: data.private is 1
      isVerified: data.verified is 1
      name: data.username
      totalLoops: data.loopCount # all views on the videos of this account
      totalLikedPosts: data.likeCount # videos liked by this account
      userId: data.userId
      username: data.shareUrl.match(/[^\/]+$/i)[0]
      authoredPosts: data.authoredPostCount
      posts: data.postCount
    }
  )

module.exports = {getAccountStats}
