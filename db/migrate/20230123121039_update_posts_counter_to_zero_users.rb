class UpdatePostsCounterToZeroUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :postscounter, from: nil, to: 0
  end
end
