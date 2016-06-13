# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.create(id: 1, name:'Admin')
Role.create(id: 2, name:'Mod')
Role.create(id: 3, name:'User')

User.create(name:'jonhoaglin', email:'jonhoaglin@gmail.com', password:'Beer0204',password_confirmation:'Beer0204', role:Role.first, activated:true)
Character.create(name:'thepiggod', user: User.first, universe:Universe.first)

Universe.create(name:'Out of Character')
Group.create(name:'Testers', universe:Universe.first)
Group.create(name:'Beta Testers', universe:Universe.first, private:true)
Group.create(name:'Alpha Testers', universe:Universe.first, private:true, hidden:true)
Member.create(user:User.first, group:Group.first, level:'Creator', approved:true)
Member.create(user:User.first, group:Group.second, level:'Creator', approved:true)
Member.create(user:User.first, group:Group.third, level:'Creator', approved:true)
Room.create(name:'Off Topic', group:Group.first)
Message.create(content:'Hello World!', room:Room.first, speaker:User.first)