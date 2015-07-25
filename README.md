# jekyll-classify

by Francesco Esposito [http://francescoes.com]() || <fraesps@gmail.com>


jekyll-classify is a Jekyll plugin that helps to classify your jekyll posts. It generates tags and categories pages and to add custom Liquid Tag for listing categories and tags. 


[DEMO](http://francescoes.com/jekyll-classify-demo/) 

---

# Structure

- _plugins/
	- categories.rb - *generate the category pages and the 'list-categories' Liquid Tag*
	- tags.rb - *generate the tags pages and the 'list-tags' Liquid Tag*

---

# Usage

### Categories/Tags links

Add `categories.rb` and `tags.rb` to you `_plugins` directory (or the one that you like to use). 


- To list all the categories links use the **helper**:

		{% list_categories %}
	
- To list all the tags links use the **helper**:
	
		{% list_tags %}

The previous Liquid Tag will generate an unordered list with class `list-categories` (and `list-tags`). Each `a` tag will have a `data-num-of-posts` attribute with the number of posts associated with the correspongind `category` (or `tag`). 

### Categories/Tags layouts
		
The pages will be generated **automatically** in your `_site` directory based on a chosen layout:  
	
- In the `_layout` folder create a file (default names: `categories.html` and `tags.html`) with the layout you wish for the `categories` and `tags` pages.

In the **Category Layout:** add the following to list all the post.

		{% for post in site.categories[page.category] %}
			# post properties
		{% endfor %}

In the **Tag Layout:** add the following to list all the post.

		{% for post in site.tags[page.tag] %}
			# post properties
		{% endfor %}
			

# Optional configuration

It is possible to override the following variables in the `_config.yml`:
	
	# default values
	site.category_dir = 'categories'	# /categories/ as category pages directory
	site.category_layout = 'categories'	# _layout/categories.html as category page layout 

	# default values
	site.tag_dir = 'tags'		# /tags/ as tag pages directory
	site.tag_layout = 'tags'	# _layout/tags.html as tag page layout 


# License

##MIT licensed

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
