class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @tournaments = Tournament.all
    @leaders = User.all.sort_by(&:total_points).reverse[0..9]
  end
end
