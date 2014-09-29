Skill.create name: "Java"
Skill.create name: "Ruby"
Skill.create name: "ObjC"
Skill.create name: "C/C++"
Skill.create name: "Web"
Skill.create name: "JQuery"
Skill.create name: "Android"
Skill.create name: "iOS"
Skill.create name: "Unix"
Skill.create name: "C#"
Skill.create name: "Python"
Skill.create name: "Git"
Skill.create name: "HTTP"

User.create( name: "Yves DeSousa", employer: false, email: "eva@eva.com", password: "eva", prog_type: "Web Dev", looking_for: "Entry", location: "New York, NY", blob: "Hi, I am Yvonne but my closest friends call me Eva. I am a total wheeabo cat girl and hacker chick. You want a website with persistant backend? I am your girl. Just give me 70+k a year and a box. I'll be in your inhouse cat programmer")
User.last.skills.push [Skill.find(1), Skill.find(9), Skill.find(7), Skill.find(5), Skill.find(2), Skill.find(4)]

User.create( name: "Max Rogers", employer: false, email: "max@max.com", password: "max", prog_type: "Web/Mobile Dev", looking_for: "Entry", location: "New York, NY", blob: "Hi, my name is Max. I am the creator of this application. I hope to easy the recruiting purpose with a more streamlined approach than Linkedin and Craigslist")
User.last.skills.push [Skill.find(3), Skill.find(2), Skill.find(1), Skill.find(5), Skill.find(9), Skill.find(4)]
