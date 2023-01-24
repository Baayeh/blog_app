class UpdateCommentsCounterToZeroPosts < ActiveRecord::Migration[7.0]
  def change
    change_column_default :posts, :commentscounter, from: nil, to: 0
  end
end
