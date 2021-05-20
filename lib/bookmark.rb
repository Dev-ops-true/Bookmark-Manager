require 'pg'
class Bookmark

  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.all_bookmarks
    conn = if ENV['ENVIRONMENT'] == 'test'
             PG.connect(dbname: 'bookmark_manager_test')
           else
             PG.connect(dbname: 'bookmark_manager')
           end
    result = conn.exec(' SELECT * FROM bookmarks ')
    result.map do |bookmark| 
      Bookmark.new(id: bookmark['id'], url: bookmark['url'], title: bookmark['title'])  
    end
  end

  def self.create(url:, title:)
    conn = if ENV['ENVIRONMENT'] == 'test'
             PG.connect(dbname: 'bookmark_manager_test')
           else
             PG.connect(dbname: 'bookmark_manager')
           end
    result = conn.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}')RETURNING id, url, title;")
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.delete(id:)
    conn =  if ENV['ENVIRONMENT'] == 'test'
              PG.connect(dbname: 'bookmark_manager_test')
            else
              PG.connect(dbname: 'bookmark_manager')
            end
    conn.exec("DELETE FROM bookmarks WHERE id = #{id}")
  end
end
