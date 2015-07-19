# Tag plugin, read a template from file 

module Jekyll
  class TagsGenerator < Generator     
    def generate(site)
      tag_name = {}
      site.tags.keys.each do |k|
        tag_name[k] = k.gsub(" ","-")
        create_tag_page(tag_name[k])
      end
    end

    def create_tag_page(tag_name)
      file = File.open("tags/"+tag_name+".html", "w")
      file.puts("---","layout: tags","tag: "+tag_name,"title: "+tag_name,"---")
      file.close
    end  
  end
end