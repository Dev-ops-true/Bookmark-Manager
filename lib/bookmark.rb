require 'pg'
class Bookmark
  def self.all_bookmarks
    conn = if ENV['ENVIRONMENT'] == 'test'
             PG.connect(dbname: 'bookmark_manager_test')
           else
             PG.connect(dbname: 'bookmark_manager')
           end
    result = conn.exec(' SELECT * FROM bookmarks ')
    result.map { |bookmark| bookmark['url'] }
  end
end
