require 'rubygems'
require 'mysql2'

class League
  def initialize
    @@db = Mysql2::Client.new(:host => ENV["HOST"], :username => ENV["USER"], :password => ENV["PASS"], :database => "league_data", :reconnect => true)
  end

  def get_champ_hash
    return {266=>"Aatrox", 103=>"Ahri", 84=>"Akali", 12=>"Alistar", 32=>"Amumu", 34=>"Anivia", 1=>"Annie", 22=>"Ashe", 53=>"Blitzcrank", 63=>"Brand", 51=>"Caitlyn", 69=>"Cassiopeia", 31=>"Chogath", 42=>"Corki", 122=>"Darius", 131=>"Diana", 119=>"Draven", 36=>"DrMundo", 60=>"Elise", 28=>"Evelynn", 81=>"Ezreal", 9=>"FiddleSticks", 114=>"Fiora", 105=>"Fizz", 3=>"Galio", 41=>"Gangplank", 86=>"Garen", 79=>"Gragas", 104=>"Graves", 120=>"Hecarim", 74=>"Heimerdinger", 39=>"Irelia", 40=>"Janna", 59=>"JarvanIV", 24=>"Jax", 126=>"Jayce", 222=>"Jinx", 43=>"Karma", 30=>"Karthus", 38=>"Kassadin", 55=>"Katarina", 10=>"Kayle", 85=>"Kennen", 121=>"Khazix", 96=>"KogMaw", 7=>"Leblanc", 64=>"LeeSin", 89=>"Leona", 127=>"Lissandra", 236=>"Lucian", 117=>"Lulu", 99=>"Lux", 54=>"Malphite", 90=>"Malzahar", 57=>"Maokai", 11=>"MasterYi", 21=>"MissFortune", 62=>"MonkeyKing", 82=>"Mordekaiser", 25=>"Morgana", 267=>"Nami", 75=>"Nasus", 111=>"Nautilus", 76=>"Nidalee", 56=>"Nocturne", 20=>"Nunu", 2=>"Olaf", 61=>"Orianna", 80=>"Pantheon", 78=>"Poppy", 133=>"Quinn", 33=>"Rammus", 58=>"Renekton", 107=>"Rengar", 92=>"Riven", 68=>"Rumble", 13=>"Ryze", 113=>"Sejuani", 35=>"Shaco", 98=>"Shen", 102=>"Shyvana", 27=>"Singed", 14=>"Sion", 15=>"Sivir", 72=>"Skarner", 37=>"Sona", 16=>"Soraka", 50=>"Swain", 134=>"Syndra", 91=>"Talon", 44=>"Taric", 17=>"Teemo", 412=>"Thresh", 18=>"Tristana", 48=>"Trundle", 23=>"Tryndamere", 4=>"TwistedFate", 29=>"Twitch", 77=>"Udyr", 6=>"Urgot", 110=>"Varus", 67=>"Vayne", 45=>"Veigar", 254=>"Vi", 112=>"Viktor", 8=>"Vladimir", 106=>"Volibear", 19=>"Warwick", 101=>"Xerath", 5=>"XinZhao", 157=>"Yasuo", 83=>"Yorick", 154=>"Zac", 238=>"Zed", 115=>"Ziggs", 26=>"Zilean", 143=>"Zyra"}
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
