FactoryGirl.define do
  factory :user do
    sequence(:email){|n| "person#{n}@example.com"}
    full_name 'John Doe'
    role 'Teacher'
    password 'password'
    password_confirmation 'password'
  end
end

FactoryGirl.define do
  factory :course do
    sequence(:title){|n| "Course 10#{n}"}
    semester_id 1
    teacher_id 1
  end
end

FactoryGirl.define do
  factory :enrollment do
    student_id 1
    course_id 1
    grade 3.33
    credits 3
  end
end

FactoryGirl.define do
  factory :semester do
    name 'Fall 2013'
  end
end
