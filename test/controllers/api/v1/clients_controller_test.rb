require "test_helper"

class Api::V1::ClientsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_clients_index_url
    assert_response :success
  end

  test "should get read" do
    get api_v1_clients_read_url
    assert_response :success
  end

  test "should get create" do
    get api_v1_clients_create_url
    assert_response :success
  end

  test "should get update" do
    get api_v1_clients_update_url
    assert_response :success
  end

  test "should get destroy" do
    get api_v1_clients_destroy_url
    assert_response :success
  end
end
