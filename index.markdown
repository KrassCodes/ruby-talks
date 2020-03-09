---
layout: page
---

<h3>ALL TALKS</h3>

<ul>
    {% for item in site.data.talks %}
        <li>
            {% for subitem in item.talk %}
        
                <b>Title:</b> 
                {{ subitem.conference_name }}
                <br>
                <b>Speaker:</b> 
                {{ subitem.speaker_name }}
                <br>
                <b>Bio:</b>
                {{ subitem.speaker_bio }}
                <br>
                <b>Video:</b>
                <a href="{{ subitem.talk_video }}"> {{ subitem.talk_video }} </a>
                <br>
                <br>
                 
                 {% endfor %}
        </li>
    {% endfor %}
</ul>
