#job to be done => sample records for app

require_relative '../config/environment'

#individual tables
users = []
enrollments = []
stories = []
sentences = []
paragraphs = []
comments = []
courses = []

# hand written example records
usertest1 = {
      :name => "pablo",
      :email => "pablo@rox.always",
      :password_digest => "pablo",
      :role => "teacher",
}

enrolltest1 = {
    :user => 1,
    :course => 1,
}

story1 = {
    :course => 1,
    :titles => "the test story",
    :author => "big hairy tom",
}

paragraph1 = {
    :story => 1,
}


sentence1 = {
    :paragraph => 1,
    :body => "this is the story of a girl",
}

comment1 = {
      :sentence =>  1,
      :user => 1,
      :body => "this sentence stinks of stinky shoes",
}

course1 = {
      :user => 1,
      :name =>  "wizards",
}

#push individual/outlier example
users.push usertest1
enrollments.push enrolltest1
stories.push story1
sentences.push sentence1
comments.push comment1
courses.push course1


# Generated data


role = ["Teacher", "Student"]
usertotal = 50
coursetotal = 10
1.upto(usertotal).each do |id|
  users.push({
    :name => Faker::Name.name,
    :email => Faker::Internet.email,
    :password_digest => "pablo",
    :role => role.sample,
  })
end


1.upto(usertotal).each do |id|
  enrollments.push({
    :user => usertotal.sample,
    :course => coursetotal.sample,
  })
end

tables = {
    :users => users,
    :enrollments => enrollments,
    :stories => stories,
    :sentences => sentences,
    :comments => comments,
    :courses => courses
}

yaml = YAML.dump tables
yaml = "# DON'T EDIT THIS, EDIT seed_generator.rb\n" + yaml
puts yaml
path = File.join(File.dirname(__FILE__), 'seed_data.yaml')
File.write path, yaml

