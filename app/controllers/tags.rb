get '/:tag' do
	@tag = Tag.find_by_name(params[:tag])
	erb :tags
end

