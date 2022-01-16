class PhotoFacade
  class << self
    def get_background(location)
      Photo.new(PhotoService.get_background(location), location)
    end
  end
end
