#      Column       |            Type             |                          Description
#-------------------+-----------------------------+--------------------------------------------------------------
#   name            |       String                |           Summoners name that is being looked up
class Search < ActiveRecord::Base
  validates :name, presence: true

  def initialize(name)
    super(name)
    cleanup rescue "no name provided"
  end

  def cleanup
    self.name = name.downcase.gsub(' ', '')
  end
end
