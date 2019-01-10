class PostsController < ApplicationController
  before_action :authorize
  #新規投稿ページ
  def new
    @post = Post.new
  end
  def create
    # ここに処理を実装
    @post = Post.new(post_params)
    upload_file = params[:post][:upload_file]
    #投稿画像がない場合
    if upload_file.blank?
        flash[:danger] = "投稿には画像が必須です。"
        redirect_to new_post_path and return
    end  
    upload_file_name = upload_file.original_filename
    output_dir = Rails.root.join('public', 'images')
    output_path = output_dir + upload_file_name
    @post.post_images.new(name: upload_file_name)
    File.open(output_path, 'w+b') do |f|
        f.write(upload_file.read)
    end 
    if @post.save
        flash[:message] = "投稿しました。"
        redirect_to top_path and return
    else
        flash[:danger] = "投稿に失敗しました。"
        redirect_to new_post_path and return
    end  
  end
  private
  def post_params
      params.require(:post).permit(:caption).merge(user_id: current_user.id)
  end
  
  #投稿処理
end
