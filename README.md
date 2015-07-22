# Jekyll Tags and Categories Pages Generator


**Tags** and **Categories** pages and generator for Jekyll.

It creates an html page for each tag and category with the posts that belongs to it.

[DEMO](http://francescoes.com/tags/interview-questions.html) (my personal website)
Navigate into tags and see how it works



---

### Structure

- _plugins/
	- categories.rb
	- tags.rb

---

### How to use it

1. Create `/categories/` and `/tags/` folders in the root of your jekyll project 

2. Copy the content of  `/_plugin/` in your plugin directory (create it if you don't have it)

3. Use the following code to list all the post that belongs to a tag/category:

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
