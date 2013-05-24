Musiclist.Models.Album = Backbone.Model.extend({
   defaults : { title : "", artist: "", played: false, purchased: false }

});

Musiclist.Models.Albums = Backbone.Collection.extend({
  model: Musiclist.Models.Album
});
