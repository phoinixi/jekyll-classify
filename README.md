# Jekyll Tags and Categories Pages Generator


**Tags** and **Categories** pages and generator for Jekyll.

It creates an html page for each tag and category with the posts that belongs to it.

---

### Structure

- _plugins/
	- categories.rb
	- tags.rb

---

### How to use it

1. Create `/categories/` and `/tags/` folders in the root of your jekyll project 

3. Use the following code to create a layout for each category page:

		{% for post in site.tags[page.tag] %}
  			..........
		{% endfor %}

		{% for post in site.tags[page.category] %}
        		..........
		{% endfor %}
	
4. Use the following code to list your tags categories links to navigate in the tags and categories pages:

		{% for tag in page.tags %}
                    <a href="/tags/{{ tag | replace: ' ','-' }}.html">#{{ tag }}</a>
                {% endfor %}

		{% for tag in page.categories %}
                    <a href="/categories/{{ tag | replace: ' ','-' }}.html">#{{ category }}</a>
                {% endfor %}

---

**It works with any version of jekyll**
