class UpdateLikesCounterToZeroPosts < ActiveRecord::Migration[7.0]
  def change
    change_column_default :posts, :likescounter, from: nil, to: 0
  end
end
