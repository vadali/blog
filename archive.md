---
layout: page
title: Archive
menu: main
---

## Blog Posts

{% for post in site.posts %}
  * {{ post.date | date_to_string }} &raquo; [ {{ post.title }} ]({{ post.url | prepend: site.baseurl }})
{% endfor %}
