class Monster < ApplicationRecord
  belongs_to :dungeon

  def attributes
    if intelligent == false && hostile == false
      "Pack Size? #{pack_size}"
    elsif intelligent == false && hostile == true
      "Hostile? #{hostile}, Pack Size? #{pack_size}"
    elsif intelligent == true && hostile == false
      "Intelligent? #{intelligent}, Pack Size? #{pack_size}"
    else
      "Intelligent? #{intelligent}, Hostile? #{hostile}, Pack Size? #{pack_size}"
    end
  end
end