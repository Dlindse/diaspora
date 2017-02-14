class PagesController < ApplicationController
  def home
  end

  def about
  end
  
  def flare
      
      @aa = Array.new
      @works = Work.all
      @authors = Author.all
      
      @authors.each do |a|
          
          @array = Array.new
          
          a.works.each do |work|
              
              
              @array2 = Array.new
              
              work.references.each do |r|
                  
                  
                  @array2 << {"name"=> r.name, "size"=> 1 }
                  
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
          
          @aa << {"name"=> a.name, "children"=> @array}
          
      end
      
      @flare = {:name=> 'Works', :children=> @aa }
      @flare_json= @flare.to_json
      
      
      render json: @flare
      
  end


def genre_count
    
    
    @gg = Array.new
    @genres = Genre.all
    
    
    @genres.each do |g|
        
        @gg << {"name" => g.name, "value" => Reference.where(genre_id: g).count}
        
        
        end
    
    
    @gg
    
    render json: @gg

    
    end


def ref_work
    
    @wa = Array.new
    @w = Work.all
    
     @w.each do |r|
         
         @wa <<{"name"=> r.title, "author" => r.author.name, "value" => r.references.count}
         
         end
     
     @wa
     
     render json: @wa
  

    
    end


  
end
