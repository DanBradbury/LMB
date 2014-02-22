#      Column       |            Type             |                          Description
#-------------------+-----------------------------+--------------------------------------------------------------
# RANKING           | int                         |          {0 => 'lad', 1 => 'bad', 2 => 'mad'}
# PLAYER_ID         | int                         |
# DESCIRPTION       | text                        |
class Review < ActiveRecord::Base
  validates :ranking, presence: true
  validates :player_id, presence: true
end
