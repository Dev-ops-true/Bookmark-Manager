require 'bookmark'

describe Bookmark do
  describe '.all_bookmarks' do
    it 'displays all the bookmarks' do
      conn = PG.connect(dbname: 'bookmark_manager_test')

      conn.exec("INSERT INTO bookmarks (url) VALUES('http://www.makersacademy.com');")
      conn.exec("INSERT INTO bookmarks (url) VALUES('http://www.twitter.com');")
      conn.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")

      bookmarks = Bookmark.all_bookmarks
      expect(bookmarks).to include('http://www.makersacademy.com')
      expect(bookmarks).to include('http://www.twitter.com')
      expect(bookmarks).to include('http://www.google.com')
    end
  end

  describe '.create' do
    it 'adds a bookmark to the database' do

    end
  end

end
