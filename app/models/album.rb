require "net/http"
require "uri"

class Album < ActiveRecord::Base
  has_many :meta_datas, :as => :item
  has_many :playlist_albums, :dependent => :destroy
  has_many :playlists, :through => :playlist_albums

  # title:string
  attr_accessible :title
  validates_presence_of :title

  # artist:references
  belongs_to :artist
  attr_accessible :artist_id
  validates_presence_of :artist_id

  # genre:string
  attr_accessible :genre

  # album_art:string
  attr_accessible :album_art

  # year:string
  attr_accessible :year

  # Album.all.each { |album| album.import_meta_data if album.meta_datas.empty? }
  def import_meta_data
    query = itunes_search_query
    puts query

    uri = URI.parse(query)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(uri.request_uri)

    response = http.request(request)

    if response.code == '200'
      response_json = JSON.parse(response.body)
      response_json['results'].each do |result|
        meta_datas.create data: result, source: query
      end
    else
      # Things didn't work
      puts response.code
    end
  end

  def itunes_search_query
    term = Rack::Utils.escape "#{artist.name} #{title}".downcase
    "https://itunes.apple.com/search?media=music&entity=album&term=#{term}"
  end

  def to_s
    "#{artist.name}: #{title}"
  end

end
