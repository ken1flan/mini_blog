# frozen_string_literal: true

json.extract! user, :id, :nickname, :icon_url, :introduction, :created_at, :updated_at
json.url user_url(user, format: :json)
