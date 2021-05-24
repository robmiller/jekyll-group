module JekyllGroup
  class Generator < Jekyll::Generator
    safe true
    priority :lowest

    def generate(site)
      @site = site
      group_posts
      generate_groups

      @site.posts.docs.each do |post|
        next unless post.data["group"]

        group_slug = post.data["group"]
        post.data["group"] = groups[group_slug]
      end
    end

    private

    attr_reader :groups
    attr_reader :posts_by_group

    def generate_groups
      @groups =
        @site.posts.docs
          .map { |p| p.data["group"] }
          .compact
          .uniq
          .map { |g| [g, { "slug" => g, "posts" => posts_by_group[g] }] }
          .to_h
    end

    def group_posts
      @posts_by_group =
        @site.posts.docs
          .select { |p| p.data["group"] }
          .group_by { |p| p.data["group"] }
    end
  end
end
