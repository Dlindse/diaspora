class AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :edit, :update, :destroy]

  # GET /authors
  # GET /authors.json
  def index
    @authors = Author.all
  end

  # GET /authors/1
  # GET /authors/1.json
  def show
      @author= Author.find(params[:id])
      @aa = Array.new
      @array = Array.new
      
      @author.works.each do |work|
          
          @array2 = Array.new
          
            work.references.each do |r|
                
                @array2 << {"name"=> r.name, "size"=> 1}
                
                @array3 = Array.new
                
                end
            
            @array3 = @array2.group_by{|ref| ref["name"]}.map do |ref,ref_values|
                {"name" => ref,
                    #combine all the quantities into an array and reduce using `+`
                    "size" => ref_values.map{|h| h["size"]}.reduce(:+)
                }
                
            end
            
             @array << {"name" => work.title, "children" => @array3}
             
             end
      
      @aa << {"name"=> @author.name, "children"=> @array}
      
      
  
  @c_pack = @aa.to_json
  
  
  respond_to do |format|
  format.html
  format.json { render json: @c_pack }
end

  end

  # GET /authors/new
  def new
    @author = Author.new
  end

  # GET /authors/1/edit
  def edit
  end

  # POST /authors
  # POST /authors.json
  def create
    @author = Author.new(author_params)

    respond_to do |format|
      if @author.save
        format.html { redirect_to @author, notice: 'Author was successfully created.' }
        format.json { render :show, status: :created, location: @author }
      else
        format.html { render :new }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /authors/1
  # PATCH/PUT /authors/1.json
  def update
    respond_to do |format|
      if @author.update(author_params)
        format.html { redirect_to @author, notice: 'Author was successfully updated.' }
        format.json { render :show, status: :ok, location: @author }
      else
        format.html { render :edit }
        format.json { render json: @author.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /authors/1
  # DELETE /authors/1.json
  def destroy
    @author.destroy
    respond_to do |format|
      format.html { redirect_to authors_url, notice: 'Author was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_author
      @author = Author.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def author_params
      params.require(:author).permit(:name, :active)
    end
end
