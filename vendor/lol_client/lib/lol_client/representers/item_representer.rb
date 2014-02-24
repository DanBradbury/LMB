require 'representable/json'

class LolClient
  class ItemRepresenter < Representable::Decorator
    include Representable::JSON

    property :id
    property :name
  end
end
