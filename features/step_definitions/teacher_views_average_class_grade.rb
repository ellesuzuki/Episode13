Given /^I have an assignment$/ do
  @teacher = Teacher.new
  @student1, @student2 = Student.new, Student.new
  @assignment1, @assignment2 = Assignment.new, Assignment.new
end

When /^I'm done grading the assignment$/ do
  @teacher.submit_assignment(@student1,@assignment1)
  @teacher.record_grade(@student1,90)
  @teacher.submit_assignment(@student2,@assignment2)
  @teacher.record_grade(@student2,70)
end

Then /^I can see the average class grade$/ do
  @teacher.average_grade.should == 80
end