Musiclist.Views.PlaylistTable = Backbone.View.extend({

  events: {
    'click a.order-album': 'orderAlbum',
    'click a.order-artist': 'orderArtist',
    'click a.order-position': 'orderPosition'
  },

  initialize: function() {
    this.model.on('reset', this.renderAlbums, this);
  },

  orderAlbum: function(e) {
    e.preventDefault();

    this.model.comparator = function(album) {
      return album.get("title").toLowerCase();
    };
    this.model.sort();
  },

  orderArtist: function(e) {
    e.preventDefault();

    this.model.comparator = function(album) {
      return album.get("artist").toLowerCase();
    };
    this.model.sort();
  },

  orderPosition: function(e) {
    e.preventDefault();

    this.model.comparator = function(album) {
      return album.get("position");
    };
    this.model.sort();
  },

  render: function() {
    this.renderAlbums();
    return this;
  },

  renderAlbums: function() {
    var _this = this;
    this.$('tbody').empty();
    this.model.each(function(album) {
      var albumView = new Musiclist.Views.PlaylistAlbum({ model: album });
      var rendered = albumView.render();
      _this.$('tbody').append(rendered.el);
    })
    return this;
  }

});