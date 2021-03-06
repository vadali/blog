module Jekyll

  class CatIndex < Page
    def initialize(site, base, dir, category)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'category_index.html')
      self.data['category'] = category
      self.data['title'] = "Posts under category &ldquo;"+category+"&rdquo;"
    end
  end

  class CatGenerator < Generator
    safe true

    def generate(site)
      if site.layouts.key? 'category_index'
        dir = 'categories'
        site.categories.keys.each do |category|
          write_category_index(site, File.join(dir, category), category)
        end
      end
      require 'fileutils'
      FileUtils.cp_r "_site/categories/.", 'categories', :verbose => false
    end

    def write_category_index(site, dir, category)
      index = CatIndex.new(site, site.source, dir, category)
      index.render(site.layouts, site.site_payload)
      index.write(site.dest)
      site.pages << index
    end
  end

end
