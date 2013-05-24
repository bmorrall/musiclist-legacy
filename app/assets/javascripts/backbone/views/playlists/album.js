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
    this.updateAlbumStatus();
  },

  togglePurchased: function() {
    this.model.set('purchased', !this.model.get('purchased'));
    this.updateAlbumStatus();
  },

  updateAlbumStatus: function() {
    var albumStatus = new Musiclist.Models.AlbumStatus({
      album_id: this.model.id,
      played: this.model.get('played'),
      purchased: this.model.get('purchased')
    });
    albumStatus.save();
  }

});