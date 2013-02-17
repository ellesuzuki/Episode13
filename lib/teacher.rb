class Teacher
  def initialize
    @assignments = {}
  end

  def record_grade(student, grade)
    assignment = @assignments[student]
    assignment.grade = grade
    @assignments[student] = assignment
  end

  def submit_assignment(student, assignment)
    @assignments[student] = assignment
  end

  def assignment_for_student(student)
    @assignments[student]
  end

  def average_grade
    sum = 0
    @assignments.each { |k, v| sum += v.grade }
    sum / @assignments.length
  end
end
