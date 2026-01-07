class PagesController < ApplicationController
  allow_unauthenticated_access
  layout 'pages'

  def main
  end
end
