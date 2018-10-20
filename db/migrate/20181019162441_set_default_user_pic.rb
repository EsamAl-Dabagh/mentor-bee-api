class SetDefaultUserPic < ActiveRecord::Migration[5.2]
  def change
    change_column_default :users, :pic, from: nil, to: "https://t4.ftcdn.net/jpg/02/15/84/43/240_F_215844325_ttX9YiIIyeaR7Ne6EaLLjMAmy4GvPC69.jpg"
  end
end
