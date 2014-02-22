require 'rubygems'
require 'mysql2'

class League
  def initialize
    @@db = Mysql2::Client.new(:host => ENV["HOST"], :username => ENV["USER"], :password => ENV["PASS"], :database => "league_data", :reconnect => true)
  end

  def champion_names
    begin
      query = @@db.query("SELECT name FROM champions ORDER BY name")
      list = []
      query.each do |row|
        list << row['name']
      end
      return list
    end
  end

  def item_names
    begin
      query = @@db.query("SELECT name FROM items ORDER BY name")
      list = []
      query.each do |row|
        list << row
      end
      return list
    end
  end

  def get_item_image(name)
    begin
      escaped_name = @@db.escape(name)
      query_string = "SELECT id FROM items WHERE name = '#{escaped_name}'"
      query = @@db.query(query_string)
      link = []
      query.each do |row|
        link << row
      end
      img = query.first['id'].to_s + ".png"
      return img
    end
  end

  def get_champion_image(name)
    puts name
    begin
      query_string = "SELECT id FROM champions WHERE name = '#{name}'"
      query = @@db.query(query_string)
      link = []
      img = query.first['id'].to_s + ".jpg"
      return img
    end
  end
  #TODO - support the lookup of summoners (there is no summoner db atm)
  def get_summoner_image(name)
    begin
      query_string = "SELECT id FROM summoners WHERE name = '#{name}'"
      query = @@db.query(query_string)
      link = []
      img = query.first['id'].to_s + ".png"
      return img
    end
  end

end
