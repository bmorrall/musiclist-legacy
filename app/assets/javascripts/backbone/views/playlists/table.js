Musiclist.Views.PlaylistTable = Backbone.View.extend({

  initialize: function() {
    this.model.on('reset', this.renderAlbums, this);
  },

  render: function() {
    this.renderAlbums();
    return this;
  },

  renderAlbums: function() {
    var _this = this;
    this.$el.empty();
    this.model.each(function(album) {
      var albumView = new Musiclist.Views.PlaylistAlbum({ model: album });
      var rendered = albumView.render();
      console.log(rendered);
      _this.$el.append(rendered.el);
    })
    return this;
  }

});