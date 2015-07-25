module Jekyll

  class TagPage < Page
    def initialize(site, base, dir, tag)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'
  
      self.process(@name)
      layout_name = site.config['tag_layout'] || 'tags'
      self.read_yaml(File.join(base, '_layouts'), layout_name+".html")
      self.data['tag'] = tag
    end
  end

  class TagPageGenerator < Generator
    safe true

    def generate(site)
      layout_name = site.config['tag_layout'] || 'tags'
      if site.layouts.key? layout_name
        dir = site.config['tag_dir'] || 'tags'
        site.tags.each_key do |tag|
          site.pages << TagPage.new(site, site.source, File.join(dir, tag), tag)
        end
      end
    end
  end

  class TagListLiquidTag < Liquid::Tag
    
    def render(context)
      tags = context['site']['tags']
      tag_dir = context['site']['tag_dir'] || 'tags'
      list = StringIO.new
      tags.each_key do |tag|
        num_of_posts = tags[tag].size()
        list << "<li>
                    <a href='/#{tag_dir}/#{tag}' data-num-of-posts='#{num_of_posts}'>#{tag}</a>
                  </li>"
      end
      <<-MARKUP.strip
      <ul class='list-tags'>#{list.string}</ul>
      MARKUP
    end
  end
  Liquid::Template.register_tag('list_tags', TagListLiquidTag)

end