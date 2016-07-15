require 'test_helper'

class GeneratedFeedbacksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @generated_feedback = generated_feedbacks(:one)
  end

  test "should get index" do
    get generated_feedbacks_url
    assert_response :success
  end

  test "should get new" do
    get new_generated_feedback_url
    assert_response :success
  end

  test "should create generated_feedback" do
    assert_difference('GeneratedFeedback.count') do
      post generated_feedbacks_url, params: { generated_feedback: { auto_feedback: @generated_feedback.auto_feedback, performance_grade: @generated_feedback.performance_grade, subcategory: @generated_feedback.subcategory, subject: @generated_feedback.subject, teacher_id: @generated_feedback.teacher_id } }
    end

    assert_redirected_to generated_feedback_url(GeneratedFeedback.last)
  end

  test "should show generated_feedback" do
    get generated_feedback_url(@generated_feedback)
    assert_response :success
  end

  test "should get edit" do
    get edit_generated_feedback_url(@generated_feedback)
    assert_response :success
  end

  test "should update generated_feedback" do
    patch generated_feedback_url(@generated_feedback), params: { generated_feedback: { auto_feedback: @generated_feedback.auto_feedback, performance_grade: @generated_feedback.performance_grade, subcategory: @generated_feedback.subcategory, subject: @generated_feedback.subject, teacher_id: @generated_feedback.teacher_id } }
    assert_redirected_to generated_feedback_url(@generated_feedback)
  end

  test "should destroy generated_feedback" do
    assert_difference('GeneratedFeedback.count', -1) do
      delete generated_feedback_url(@generated_feedback)
    end

    assert_redirected_to generated_feedbacks_url
  end
end
