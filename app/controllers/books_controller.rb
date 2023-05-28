class BooksController < ApplicationController
  # 投稿データの保存
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    redirect_to book_path
    else
      render :index
    end
  end
  
  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to books_path  # 投稿一覧画面へリダイレクト
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
