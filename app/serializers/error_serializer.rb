# frozen_string_literal: true

module ErrorSerializer
  def self.serialize(errors)
    {
      errors: {
        detail: errors
      }
    }
  end
end
