module ErrorSerializer

  def self.serialize(errors)
    {
      errors: {
        detail: errors
      }
    }
  end
end
