class CommentsController < ApplicationController

  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end

  def index
    @commentable = find_commentable
    @comments = @commentable.comments
    render json: @comments
  end

end
