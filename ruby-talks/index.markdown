---
layout: page
---

<h3>TALKS</h3>

<ul>
{% for talks in site.data.talks.talks %}
  <li>
        <b>Title:</b> 
        {{ talks.title }}

        <br>

        <b>Speaker:</b> 
        <a href="https://github.com/{{ talks.github }}">
            {{ talks.speaker }}
        </a>

  </li>
{% endfor %}
</ul>