# Jekyll Tags and Categories Pages Generator

-----

**Tags** and **Categories** pages and generator for Jekyll.

It creates an html page for each tag and category with the posts that belongs to it.

---

### Structure

- _plugins/
	- categories.rb
	- tags.rb
- _layout/
	- categories.html
	- tags.html

---

### How to use it

1. Create `/categories/` and `/tags/` folders in the root of your jekyll project 

2. Add the following variables to the `_config.yml` file

	- categories_folder: "/categories/"
	- tags_folder: "/categories/"
	
	Or just choose the name you like according with the `categories.html` and `tags.html` 	files and the point 3.
	
3. Use the following code to list your tags categories links to navigate in the tags and categories pages:

		{% for cat in post.categories %}
        	<a href="{{ site.categories_folder }}{{ cat | replace: ' ','-' }}.html">{{cat}}</a>
		{% endfor %}


		{% for tag in page.tags %}
			<a href="{{ site.tags_folder }}{{ tag | replace: ' ','-'  }}.html">#{{tag}}</a>
		{% endfor %}
