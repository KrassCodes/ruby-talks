---
layout: page
---

<h3>ALL TALKS</h3>

<ul>
    {% for item in site.data.master_talks_list %}
        <li>
                <b>Conference:</b> 
                {{ item.conference_name }}
                <br>
                <b>Speaker:</b> 
                {{ item.speaker_name }}
                <br>
                <b>Twitter:</b> 
                <a href="{{ item.speaker_twitter }}"> {{ item.speaker_twitter }} </a>
                <br>
                <b>Bio:</b>
                {{ item.speaker_bio }}
                <br>
                <b>Video:</b>
                <a href="{{ item.talk_video }}"> {{ item.talk_title}} </a>
                <br>
                <br>         
        </li>
    {% endfor %}
     
</ul>
