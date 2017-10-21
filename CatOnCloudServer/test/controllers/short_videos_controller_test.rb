require 'test_helper'

class ShortVideosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @short_video = short_videos(:one)
  end

  test "should get index" do
    get short_videos_url
    assert_response :success
  end

  test "should get new" do
    get new_short_video_url
    assert_response :success
  end

  test "should create short_video" do
    assert_difference('ShortVideo.count') do
      post short_videos_url, params: { short_video: {  } }
    end

    assert_redirected_to short_video_url(ShortVideo.last)
  end

  test "should show short_video" do
    get short_video_url(@short_video)
    assert_response :success
  end

  test "should get edit" do
    get edit_short_video_url(@short_video)
    assert_response :success
  end

  test "should update short_video" do
    patch short_video_url(@short_video), params: { short_video: {  } }
    assert_redirected_to short_video_url(@short_video)
  end

  test "should destroy short_video" do
    assert_difference('ShortVideo.count', -1) do
      delete short_video_url(@short_video)
    end

    assert_redirected_to short_videos_url
  end
end
