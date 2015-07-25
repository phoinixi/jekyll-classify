module Jekyll

  class CategoryPage < Page
    def initialize(site, base, dir, category)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      layout_name = site.config['category_layout'] || 'categories'
      self.read_yaml(File.join(base, '_layouts'), layout_name+".html")
      self.data['category'] = category

    end
  end

  class CategoryPageGenerator < Generator
    safe true

    def generate(site)
      layout_name = site.config['category_layout'] || 'categories'
      if site.layouts.key? layout_name
        dir = site.config['category_dir'] || 'categories'
        site.categories.each_key do |category|
          site.pages << CategoryPage.new(site, site.source, File.join(dir, category), category)
        end
      end
    end
  end

  class CategoryListTag < Liquid::Tag
      
    def render(context)
      categories = context['site']['categories']
      category_dir = context['site']['category_dir'] || 'categories'
      list = StringIO.new
      categories.each_key do |category|
        num_of_posts = categories[category].size()
        list << "<li>
                    <a href='/#{category_dir}/#{category}' data-num-of-posts='#{num_of_posts}'>#{category}</a>
                  </li>"
      end
      <<-MARKUP.strip
      <ul class='list-categories'>#{list.string}</ul>
      MARKUP
    end
  end
  Liquid::Template.register_tag('list_categories', CategoryListTag)

end