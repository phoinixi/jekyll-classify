# Tag plugin, read a template from file 

module Jekyll
  class CategoryGenerator < Generator     
    def generate(site)
      category_name = {}
      site.categories.keys.each do |k|
        category_name[k] = k.gsub(" ","-")
        create_category_page(category_name[k])
      end
    end

    def create_category_page(category_name)
      file = File.open("categories/"+category_name+".html", "w")
      file.puts("---","layout: categories","category: "+category_name,"title: "+category_name,"---")
      file.close
    end  
  end
end