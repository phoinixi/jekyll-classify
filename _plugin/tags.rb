# Tag plugin, read a template from file 

module Jekyll
  class TagsGenerator < Generator     
     def generate(site)
      tags = {}
      mappings = {}
      site.tags.keys.each do |k|              # create a mapping to change the keys
        mappings[k] = k.gsub(" ","-")+".html" 
      end
      tags_list = Hash[site.tags.map {|k, v| [mappings[k], v] }]
      tags_list.each do |tag|
        tag[1].each do |post|
          if tags.has_key?(tag[0])
            tags[tag[0]] << {"url"=>post.url, "title"=>post.title, "date"=>post.date, "content"=>post.content, "categories"=>post.categories}
          else
            tags[tag[0]] = [{"url"=>post.url, "title"=>post.title, "date"=>post.date, "content"=>post.content, "categories"=>post.categories}]
          end   
        end
        input = site.source + "/_layouts/tags.html"
        output = site.source + "/tags/" + tag[0]
        self.copy_template(input,output)     # create a file for each tag in the $tag_folder
        site.pages <<  TagPage.new(site, site.source, "/tags/", tag[0], tags[tag[0]])  
      end
    end

    #Copy the whole file "input" in the file "output"
    def copy_template(input, output)
      file = File.open(input, "r")
      f = File.open(output,"w")
      while (line = file.gets)
        f.write(line)
      end
      f.close
      file.close
    end
  end

#  Inherits the Page class due to add an available variable in every tag page

  class TagPage < Page
    def initialize(site, base, dir, name, tag)
      super(site, base, dir, name)
      self.data['tag'] = tag
    end
  end     
end
