class CreateBlogTags < ActiveRecord::Migration[5.1]
  def change
    create_table :blog_tags do |t|
      t.references :blog, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end

    add_index :blog_tags, [:blog_id, :tag_id], unique: true
  end
end
