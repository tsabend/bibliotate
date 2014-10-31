User.create(name: "admin", email: "admin@admin.com", password_digest: "admin", role: "teacher")
Course.create(user_id: 1, name: "test course")
Enrollment.create(user_id: 1, course_id: 1)
Story.create(course_id: 1, title: "test story", author: "test author", body: "test body")
Sentence.create(story_id: 1, body: "test sentence")
Comment.create(sentence_id: 1, user_id: 1, body: "test comment")

# to find user courses:
  # User.find(1).courses

# to find user enrollments:
  # User.find(1).enrollments

# to


