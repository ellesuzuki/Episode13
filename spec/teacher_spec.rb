require_relative "../lib/teacher"
require_relative "../lib/student"
require_relative "../lib/assignment"
require "rspec"

describe Teacher do
  it "should store assignments" do
    student = stub
    assignment = stub
    subject.submit_assignment(student, assignment)
    subject.assignment_for_student(student).should eq(assignment)
  end


  describe "should record a grade" do
    it "should record the grade" do
      student = stub
      assignment = mock
      assignment.should_receive(:grade=).with(95)
      subject.submit_assignment(student, assignment)
      subject.record_grade(student, 95)
    end
  end

  describe 'should get average grade' do
    it 'should get the average grade' do
      student1, student2 = stub, stub
      assignment1, assignment2 = mock, mock
      subject.submit_assignment(student1, assignment1)
      subject.submit_assignment(student2, assignment2)

      assignment1.should_receive(:grade=).with(90)
      assignment2.should_receive(:grade=).with(80)
      subject.record_grade(student1, 90)
      subject.record_grade(student2, 80)

      assignment1.should_receive(:grade).and_return(90)
      assignment2.should_receive(:grade).and_return(80)
      subject.average_grade.should == 85
    end
  end
end
