window.MusicList ||= {}

class MusicList.PlaylistAlbumView
  constructor: (@$el, @album_statuses_path) ->
    @album_id = @$el.data('album')

    this.$('a.played').click =>
      @togglePlayed()

    this.$('a.purchased').click =>
      @togglePurchased()

  togglePlayed: () ->
    $playedSpan = this.$('a.played span.label')

    # Toggle the span and get the new value
    $playedSpan.removeClass('label-important');
    $playedSpan.toggleClass("label-warning")
    played = $playedSpan.hasClass("label-warning")
    console.log('album played: ' + @album_id + '(' + played + ')')

    # Update the value via ajax
    $.ajax
      type: "post"
      data:
        album_status:
          album_id: @album_id
          played: played
      error: (jqXHR, textStatus, errorThrown) ->
        console.error(textStatus, errorThrown)
        $playedSpan.removeClass('label-warning');
        $playedSpan.addClass('label-important');
        return
      url: @album_statuses_path
    return

  togglePurchased: () ->
    $purchasedSpan = this.$('a.purchased span.label')

    # Toggle the span and get the new value
    $purchasedSpan.removeClass('label-important');
    $purchasedSpan.toggleClass("label-warning")
    purchased = $purchasedSpan.hasClass("label-warning")
    console.log('album purchased: ' + @album_id + '(' + purchased + ')')

    # Update the value via ajax
    $.ajax
      type: "post"
      data:
        album_status:
          album_id: @album_id
          purchased: purchased
      error: (jqXHR, textStatus, errorThrown) ->
        console.error(textStatus, errorThrown)
        $purchasedSpan.removeClass('label-warning');
        $purchasedSpan.addClass('label-important');
        return
      url: @album_statuses_path
    return

  $: (selector) ->
    @$el.find(selector)

class MusicList.PlaylistTable
  constructor: (el) ->
    @$el = $(el)
    album_statuses_path = @$el.data('album-statuses-path')
    @$el.find('tbody tr[data-album]').each ->
      new MusicList.PlaylistAlbumView( $(this), album_statuses_path )
      return
