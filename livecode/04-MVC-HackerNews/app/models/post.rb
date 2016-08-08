class Post
  attr_reader :id
  attr_accessor :title, :url, :votes

  def initialize(attributes = {})
    @id = attributes[:id]
    @url = attributes[:url]
    @votes = attributes[:votes] || 0
    @title = attributes[:title]
  end

  def self.find(id)
    DB.results_as_hash = true
    result = DB.execute("SELECT * FROM posts WHERE id = ?", id).first
    if result.nil?
      return nil
    else
      Post.new(id: result["id"], title: result["title"], url: result["url"], votes: result["votes"])
    end
  end

  def self.all
    DB.results_as_hash = true
    results = DB.execute("SELECT * FROM posts")
    results.map { |row| Post.new(id: row["id"], title: row["title"], url: row["url"], votes: row["votes"]) }
  end

  def save
    if @id.nil?
      DB.execute("INSERT INTO posts (title, url, votes)
      VALUES (?, ?, ?)", @title, @url, @votes)
      @id = DB.last_insert_row_id
    else
      DB.execute("UPDATE posts SET title = ?,  url = ?, votes = ?
      WHERE id = ?", @title, @url, @votes, @id)
    end
  end

  def upvote!
    @votes +=1
  end

  def destroy
    # TODO: destroy the current instance from the database
    DB.execute("DELETE FROM posts WHERE id = ?;", id)
  end
end