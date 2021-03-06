Musiclist.Views.PlaylistAlbum = Backbone.View.extend({
  tagName: "tr",
  template: JST['backbone/templates/playlists/album'],

  events: {
    'click a.played': 'togglePlayed',
    'click a.purchased': 'togglePurchased'
  },

  initialize: function() {
    this.model.on("change", this.render, this);
  },

  render: function() {
    this.$el.html(this.template(this.model.attributes));
    return this;
  },

  togglePlayed: function() {
    this.model.set('played', !this.model.get('played'));
    this.updateAlbumStatus(this.$('.played'));
  },

  togglePurchased: function() {
    this.model.set('purchased', !this.model.get('purchased'));
    this.updateAlbumStatus(this.$('.purchased'));
  },

  updateAlbumStatus: function(actionElement) {
    var albumStatus = new Musiclist.Models.AlbumStatus({
      album_id: this.model.id,
      played: this.model.get('played'),
      purchased: this.model.get('purchased')
    });
    var errorCallback = function(model, xhr, options) {
      actionElement.removeClass('label-warning label-success').addClass('label-important')
      if (xhr.statusText) {
        alert(xhr.status + " (" + xhr.statusText + ")");
      }
      else {
        alert("HTTP Error: " + xhr.status);
      }
    }
    albumStatus.save(null, { error: errorCallback });
  }

});