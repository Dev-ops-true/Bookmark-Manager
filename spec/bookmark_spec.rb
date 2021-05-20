require 'bookmark'
require 'database_helper'
describe Bookmark do
  describe '.all_bookmarks' do
    it 'displays all the bookmarks' do
      bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers')
      Bookmark.create(url: 'http://www.twitter.com', title: 'Twitter')
      Bookmark.create(url: 'http://www.google.com', title: 'Google')
      bookmarks = Bookmark.all_bookmarks
      expect(bookmarks.length).to eq(3)
      expect(bookmarks.first).to be_a(Bookmark)
      expect(bookmarks.first.id).to eq(bookmark.id)
      expect(bookmarks.first.title).to eq('Makers')
      expect(bookmarks.first.url).to eq('http://www.makersacademy.com')
    end
  end

  describe '.create' do
    it 'adds a bookmark to the database' do
      bookmark = Bookmark.create(url: 'http://www.facebook.com', title: 'Test Bookmark')
      persisted_data = persisted_data(id: bookmark.id)
      
      expect(bookmark).to be_a(Bookmark)
      expect(bookmark.id).to eq(persisted_data['id'])
      expect(bookmark.title).to eq('Test Bookmark')
      expect(bookmark.url).to eq('http://www.facebook.com')
    end
  end

  describe'.delete' do
    it 'deletes a bookmark' do
      bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers')

      Bookmark.delete(id: bookmark.id)

      expect(Bookmark.all_bookmarks.length).to eq(0)
    end
  end
end

