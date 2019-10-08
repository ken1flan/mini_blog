# frozen_string_literal: true

class MyController < ApplicationController
  before_action :require_signed_in

  def index
    # empty
  end
end
