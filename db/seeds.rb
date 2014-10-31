User.create(name: "admin", email: "admin@admin.com", password_digest: "admin", role: "teacher")
Course.create(user_id: 1, name: "test course")
Enrollment.create(user_id: 1, course_id: 1)
Story.create(course_id: 1, title: "test story", author: "test author", body: "test body")
Paragraph.create(story_id: 1, body: "test sentence")
Sentence.create(paragraph_id: 1, body: "test sentence")
Comment.create(sentence_id: 1, user_id: 1, body: "test comment")

# to find user courses:
  # User.find(1).courses

# to find user enrollments:
  # User.find(1).enrollments

# to find stories associated with a course:
  # Course.find(1).stories.all

# to find a SPECIFIC story associated with a course:
  # course.find(1).stories.find(1) OR User.find(1).comments.find_by(title: "test title")

# to find all sentences associated with a story:
  # Course.find(1).stories.find(1).paragraphs.find(1).sentences.all

# to find all comments associated with a sentence:
  # Course.find(1).stories.find(1).paragraphs.find(1).sentences.find(1).comments.all

# to find all comments associated with a user:
  # User.find(1).comments
