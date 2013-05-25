Musiclist.Views.PlaylistTable = Backbone.View.extend({

  events: {
    'click a.order-album': 'orderAlbum',
    'click a.order-artist': 'orderArtist',
    'click a.order-position': 'orderPosition',
    'change #album-played, #album-purchased, #album-unheard': 'changeFilter'
  },

  initialize: function() {
    this.filteredModels = new Musiclist.Models.Albums();
    this.model.on('reset', this.updateFilter, this);
  },

  changeFilter: function(e) {
    this.updateFilter();
  },

  orderAlbum: function(e) {
    e.preventDefault();

    this.filteredModels.comparator = function(album) {
      return album.get("title").toLowerCase();
    };
    this.filteredModels.sort();
  },

  orderArtist: function(e) {
    e.preventDefault();

    this.filteredModels.comparator = function(album) {
      return album.get("artist").toLowerCase();
    };
    this.filteredModels.sort();
  },

  orderPosition: function(e) {
    e.preventDefault();

    this.filteredModels.comparator = function(album) {
      return album.get("position");
    };
    this.filteredModels.sort();
  },

  render: function() {
    this.renderAlbums();
    return this;
  },

  renderAlbums: function() {
    var _this = this;
    this.$('tbody').empty();
    
    console.debug(this.filteredModels.length);
    this.filteredModels.each(function(album) {
      var albumView = new Musiclist.Views.PlaylistAlbum({ model: album });
      var rendered = albumView.render();
      _this.$('tbody').append(rendered.el);
    })
    return this;
  },

  updateFilter: function() {
    var filterPlayed = this.$('#album-played').is(':checked');
    var filterPurchased = this.$('#album-purchased').is(':checked');
    var filterUnheard = this.$('#album-unheard').is(':checked');
    this.filteredModels.reset(this.model.filter(function(album) {
      var display = false;

      if (filterPlayed) {
        display = display || album.get('played');
      }
      if (filterPurchased) {
        display = display || album.get('purchased');
      }
      if (filterUnheard) {
        display = display || (!album.get('played') && !album.get('purchased'))
      }

      return display;
    }));

    this.renderAlbums();
  }

});