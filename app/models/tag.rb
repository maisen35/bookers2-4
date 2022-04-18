class Tag < ApplicationRecord
  has_many :book_tags, dependent: :destroy
  has_many :books, through: :book_tags

  def self.search_books_for(search, word)
    if search == "perfect_match"
      tags = Tag.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      tags = Tag.where("name LIKE?", "#{word}%")
    elsif search == "backword_match"
      tags = Tag.where("name LIKE?", "%#{word}")
    else search == "partical_match"
      tags = Tag.where("name LIKE?", "%#{word}%")
    end
    return tags.inject(init = []) {|result, tag| result + tag.books}
  end

end
