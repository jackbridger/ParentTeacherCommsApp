require 'test_helper'

class MathsGradesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @maths_grade = maths_grades(:one)
  end

  test "should get index" do
    get maths_grades_url
    assert_response :success
  end

  test "should get new" do
    get new_maths_grade_url
    assert_response :success
  end

  test "should create maths_grade" do
    assert_difference('MathsGrade.count') do
      post maths_grades_url, params: { maths_grade: { feedback: @maths_grade.feedback, grade_date: @maths_grade.grade_date, performance_grade: @maths_grade.performance_grade, student_id: @maths_grade.student_id, subcategory: @maths_grade.subcategory, teacher_id: @maths_grade.teacher_id, title: @maths_grade.title } }
    end

    assert_redirected_to maths_grade_url(MathsGrade.last)
  end

  test "should show maths_grade" do
    get maths_grade_url(@maths_grade)
    assert_response :success
  end

  test "should get edit" do
    get edit_maths_grade_url(@maths_grade)
    assert_response :success
  end

  test "should update maths_grade" do
    patch maths_grade_url(@maths_grade), params: { maths_grade: { feedback: @maths_grade.feedback, grade_date: @maths_grade.grade_date, performance_grade: @maths_grade.performance_grade, student_id: @maths_grade.student_id, subcategory: @maths_grade.subcategory, teacher_id: @maths_grade.teacher_id, title: @maths_grade.title } }
    assert_redirected_to maths_grade_url(@maths_grade)
  end

  test "should destroy maths_grade" do
    assert_difference('MathsGrade.count', -1) do
      delete maths_grade_url(@maths_grade)
    end

    assert_redirected_to maths_grades_url
  end
end
