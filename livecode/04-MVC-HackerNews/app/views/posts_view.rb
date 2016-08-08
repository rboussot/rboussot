class PostsView
  # TODO: implement methods called by the PostsController
  def ask_for(stuff)
    puts "#{stuff}?"
    print "> "
    gets.chomp
  end

  def display(posts)
    posts.each_with_index do |post, index|
      puts "#{index + 1}. #{post.title} - #{post.url} (#{post.votes})"
    end
  end

  def ask_for_index
    puts "Which post you want to update (type number)"
    gets.chomp.to_i - 1
  end
end
