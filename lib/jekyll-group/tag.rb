module JekyllGroup
  class PostGroupTag < Liquid::Tag
    def render(context)
      page = context["page"]
      group = page["group"]

      return "" unless group

      liquid = <<~EOL
        <h3>Part of the {{ page.group.slug }} series</h3>
        <ol>
        {% for post in page.group.posts %}
          {% if post.id == page.id %}
            <li>{{ post.title }}</li>
          {% else %}
            <li><a href="{{ post.url | absolute_url }}">{{ post.title }}</a></li>
          {% endif %}
        {% endfor %}
        </ol>
      EOL

      partial = Liquid::Template.parse(liquid)
      context.stack do
        partial.render(context)
      end
    end
  end
end

Liquid::Template.register_tag("post_group", JekyllGroup::PostGroupTag)
