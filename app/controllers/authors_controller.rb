class AuthorsController < ApplicationController
	def new
        @author = Author.new
      end

      def show
        @author = Author.find(params[:id])
      end

      def index
        @authors = Author.all
      end

	  def edit
		@author = Author.find(params[:id])
	  end

	  def update
		@author = Author.find(params[:id])
		# update the author, but always render the edit page again
		@author.update(author_params)
		render :edit
	  end

	  def create
        @author = Author.new(author_params)
        if @author.save
        	redirect_to root_path, notice: 'Success!'
        else 
          	render :new
        end
      end

	  def destroy
		@author = Author.find(params[:id])
		@author.destroy
	
		redirect_to authors_path
	  end

      private # 03
      def author_params
        params.require(:author).permit(:first_name, :last_name, :homepage)
      end
end
