class PostsController
  def initialize
    @view = PostsView.new
  end

  ################################################################
  # BEWARE: you MUST not use the global variable DB in this file #
  ################################################################

  def index
    # TODO: implement listing all posts
    @view.display(Post.all)
  end

  def create
    title = @view.ask_for("Title")
    url = @view.ask_for("Url")
    Post.new(title: title, url: url).save
    @view.display(Post.all)
  end

  def update
    @view.display(Post.all)
    index = @view.ask_for_index
    title = @view.ask_for("Title")
    url = @view.ask_for("Url")
    posts = Post.all
    post = posts[index]
    post.title = title unless title.empty?
    post.url = url unless url.empty?
    post.save
    print `clear`
    @view.display(Post.all)
  end

  def destroy
    @view.display(Post.all)
    index = @view.ask_for_index
    posts = Post.all
    post = posts[index]
    post.destroy
    print `clear`
    @view.display(Post.all)
  end

  def upvote
    @view.display(Post.all)
    index = @view.ask_for_index
    posts = Post.all
    post = posts[index]
    post.upvote!
    post.save
    @view.display(Post.all)
  end
end
