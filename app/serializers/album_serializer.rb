class AlbumSerializer < ActiveModel::Serializer
  attributes :id, :title, :artist, :img
end
