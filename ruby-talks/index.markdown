---
layout: page
---

<h3>ALL TALKS</h3>

<h4>{{ site.data.talks.conference_name }}</h4>

<ul>
    {% for talks in site.data.talks.talks %}
        <li>
                <b>Title:</b> 
                {{ talks.title }}
                <br>
                <b>Speaker:</b> 
                <a href="https://github.com/{{ talks.github | slice: 1, talks.github.size }}">
                    {{ talks.speaker }}
                </a>
        </li>
    {% endfor %}
</ul>