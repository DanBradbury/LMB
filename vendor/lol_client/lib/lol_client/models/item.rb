require 'lol_client/models/base'

class LolClient
  class Item < ModelBase
    attributes :id, :name
  end
end
