class WeatherSerializer
  include JSONAPI::Serializer

  set_type :forecast

  def id
    "null"
  end

  attributes :current, :daily, :hourly
end
