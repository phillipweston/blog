
get '/posts/new' do
	erb :posts_new
end

post '/posts/new' do
	post = Post.create(title: params[:title], body: params[:body])
	post_tags = params[:tags].split(", ")
	
	post_tags.map{|post_tag| tag = Tag.find_or_create_by_name(post_tag); post.tags << tag }

	redirect "/posts/#{post.id}"
end

post '/posts/update' do
	post = Post.find(params[:id])
	post.tags = []
	post_tags = params[:tags].split(", ")

	post_tags.map{|post_tag| tag = Tag.find_or_create_by_name(post_tag); post.tags << tag }
	post.update_attributes({title: params[:title], body: params[:body]})
	redirect "/posts/#{post.id}"
end	

get '/posts/:id' do
	@post = Post.find(params[:id])
	erb :post
end

get '/posts/:id/edit' do
	@post = Post.find(params[:id])
	@tags = @post.tags.map{|tag| tag.name }.join(", ")
	erb :post_edit
end

get '/posts/:id/delete' do
	Post.find(params[:id]).destroy
	redirect "/"
end

