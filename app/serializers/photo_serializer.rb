class PhotoSerializer
  include JSONAPI::Serializer

  set_type :image
  attributes :image
end
